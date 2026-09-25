from __future__ import annotations

import csv
import json
import os
import sys
import tempfile
import unittest
from pathlib import Path

HERE=Path(__file__).resolve()
TOOL=HERE.parents[1]
ROOT=HERE.parents[3]
if str(TOOL) not in sys.path:
    sys.path.insert(0,str(TOOL))

from c10lib import (
    VERDICTS, build_english_benchmark, build_g1_cases, build_paradigm_registry,
    build_parity, generate_bug_handoffs, lint_artifacts, promote_golds, read_csv, sha256_text, split_case_output,
    validate_review_rows,
)

CONTRACTS=Path(os.environ.get('C10_COMPENDIUM_CONTRACTS','__missing_contracts__'))
RGL_SRC=Path(os.environ.get('C10_RGL_SRC','__missing_rgl_src__'))

class C10ToolkitTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.g1=read_csv(ROOT/'validation/certification/campaigns/g1/case_ledger.tsv',delimiter='\t')
        cls.g2=read_csv(ROOT/'validation/certification/campaigns/g2/case_ledger.tsv',delimiter='\t')
        cls.g3=read_csv(ROOT/'validation/certification/campaigns/g3/case_ledger.tsv',delimiter='\t')

    def test_campaign_cardinality_and_supersets(self):
        self.assertEqual(len(self.g1),569)
        self.assertEqual(len(self.g2),5000)
        self.assertEqual(len(self.g3),20000)
        self.assertTrue({r['case_id'] for r in self.g1} <= {r['case_id'] for r in self.g2})
        self.assertTrue({r['case_id'] for r in self.g2} <= {r['case_id'] for r in self.g3})

    def test_g1_rebuild_matches_materialized_ids(self):
        rebuilt=build_g1_cases(ROOT)
        self.assertEqual([r['case_id'] for r in rebuilt],[r['case_id'] for r in self.g1])

    def test_g3_detailed_excludes_compile_safe_placeholders(self):
        detail=[r for r in self.g3 if r['family']=='morphology-detail']
        self.assertEqual(len(detail),15000)
        self.assertNotIn('compile-safe-placeholder',{r['provenance_status'] for r in detail})

    def test_case_output_splitter(self):
        text='CASE C1 first\nfoo\nCASE C2 second\nbar\nGF_WORDBENCH_END cases\n'
        self.assertEqual(split_case_output(text),{'C1':'foo\n','C2':'bar\n'})

    def test_review_policy_rejects_gold_invalid(self):
        row=dict(self.g1[0])
        row.update(execution_status='executed', verdict='invalid', confidence='high', rationale='bad',
                   source_lock_sha256='a'*64, case_output_sha256='b'*64, scenario_output_sha256='c'*64,
                   gold_eligible='true')
        f=validate_review_rows([row])
        self.assertTrue(any(x['code']=='C10-REV-108' and x['severity']=='ERROR' for x in f))

    @unittest.skipUnless(CONTRACTS.is_file(), "set C10_COMPENDIUM_CONTRACTS to run external parity inventory test")
    def test_parity_inventory(self):
        parity,modules=build_parity(ROOT,CONTRACTS)
        self.assertEqual(len(parity),356)
        self.assertEqual({r['status'] for r in parity},{'implemented'})
        self.assertGreaterEqual(len(modules),25)

    def test_paradigm_inventory(self):
        rows=build_paradigm_registry(ROOT)
        self.assertGreaterEqual(len(rows),90)
        self.assertGreaterEqual(len({r['paradigm'] for r in rows}),70)

    @unittest.skipUnless(RGL_SRC.is_dir(), "set C10_RGL_SRC to run supplied-snapshot benchmark test")
    def test_english_snapshot_benchmark(self):
        b=build_english_benchmark(ROOT,RGL_SRC)
        self.assertEqual(b['metrics']['dict_abstract_functions']['albanian'],6720)
        self.assertEqual(b['metrics']['dict_abstract_functions']['english'],64931)
        self.assertEqual(b['metrics']['morphodict_lemgrams']['albanian'],592)
        self.assertEqual(b['metrics']['morphodict_lemgrams']['english'],56568)

    def test_linter_clean(self):
        f=lint_artifacts(ROOT)
        self.assertFalse([x for x in f if x['severity']=='ERROR'],f)

    def test_gold_promotion_is_explicit_and_stores_diff(self):
        with tempfile.TemporaryDirectory() as td:
            troot=Path(td)
            output="CASE X1 example\nfoo\nGF_WORDBENCH_END cases\n"
            request={
                "schema":"gf-wordbench-linguistic-review-request-v1",
                "request_id":"req-1","source_lock_sha256":"a"*64,"run_id":"run-1",
                "language_variety":"Standard Albanian",
                "scenarios":[{"scenario_id":"s1","output_sha256":sha256_text(output),"output_text":output}]
            }
            req=troot/'request.json'; req.write_text(json.dumps(request),encoding='utf-8')
            row={k:'' for k in self.g1[0]}
            row.update({
                "case_id":"X1","scenario_id":"s1","execution_status":"executed",
                "source_lock_sha256":"a"*64,"scenario_output_sha256":sha256_text(output),
                "case_output_sha256":sha256_text('foo\n'),"output_text":'foo\n',
                "language_variety":"Standard Albanian","verdict":"valid","confidence":"high",
                "rationale":"confirmed","evidence_refs":"E-1","reviewer_kind":"human","reviewer_name":"reviewer"
            })
            promos=promote_golds(troot,req,[row],decision_ref='DEC-1',reviewer_kind='human',reviewer_name='reviewer')
            self.assertEqual(len(promos),1)
            self.assertTrue((troot/'validation/gold/s1.gold').is_file())
            self.assertTrue((troot/'validation/certification/reviews/gold_promotions/s1.diff').is_file())
            meta=json.loads((troot/'validation/certification/reviews/gold_promotions/s1.json').read_text())
            self.assertEqual(meta['decision_ref'],'DEC-1')
            self.assertTrue(meta['diff_sha256'])

    def test_bug_handoff_requires_c1_to_c9_and_preserves_uncertainty(self):
        with tempfile.TemporaryDirectory() as td:
            troot=Path(td)
            row=dict(self.g1[0])
            row.update(execution_status='executed', verdict='questionable', confidence='medium', rationale='Evidence conflict',
                       source_lock_sha256='a'*64, run_id='run', case_output_sha256='b'*64,
                       scenario_output_sha256='c'*64, output_text='x\n', owner_conversation='1')
            h=generate_bug_handoffs(troot,[row])
            self.assertEqual(len(h),1)
            self.assertEqual(h[0]['owner_conversation'],1)
            self.assertEqual(h[0]['expected_output'],'')
            self.assertIn('does not invent',h[0]['expected_constraint'])

    def test_wordbench_required_project_assets_present(self):
        required = [
            "README.md",
            "docs/00_PROJECT_START_HERE__PROJECT_DOCS.md",
            "docs/CATEGORY_AND_LINCAT_CONTRACT.md",
            "docs/DECISION_LOG.md",
            "docs/INTERFILE_CONTRACT_LOCK.md",
            "docs/KNOWN_ISSUES.md",
            "docs/LANGUAGE_ARCHITECTURE.md",
            "docs/LANGUAGE_OVERVIEW.md",
            "docs/MODULE_DEPENDENCY_MAP.md",
            "docs/MORPHOLOGY_SPEC.md",
            "docs/RELEASE_CRITERIA__PROJECT_DOCS.md",
            "docs/RESEARCH_EVIDENCE.md",
            "docs/STATUS_LEDGER__PROJECT_DOCS.md",
            "docs/SYNTAX_AND_CONSTRUCTOR_RULES.md",
            "docs/TEST_COVERAGE_MATRIX__PROJECT_DOCS.md",
            "docs/VALIDATION_SPEC__PROJECT_DOCS.md",
            "validation/README.md",
            "validation/gold/README.md",
            "validation/inputs/README.md",
            "validation/scenarios/README.md",
        ]
        for rel in required:
            path = ROOT / rel
            self.assertTrue(path.is_file(), rel)
            if path.suffix.lower() == ".md":
                self.assertNotRegex(path.read_text(encoding="utf-8"), r"<[^<>\r\n]+>", rel)

    def test_canonical_documentation_imported_and_locked(self):
        canonical = ROOT / "docs/canonical"
        self.assertGreaterEqual(len(list(canonical.glob("*.md"))), 29)
        lock = (canonical / "CANONICAL_SOURCE_LOCK.txt").read_text(encoding="utf-8")
        self.assertIn("sha256=", lock)

    def test_external_runner_materializes_exact_scenario_counts(self):
        import importlib.util
        runner_path = TOOL / "run_external_wordbench.py"
        spec = importlib.util.spec_from_file_location("run_external_wordbench", runner_path)
        self.assertIsNotNone(spec)
        module = importlib.util.module_from_spec(spec)
        assert spec and spec.loader
        spec.loader.exec_module(module)
        expected = {"g1": 52, "g2": 71, "g3": 131}
        for level, count in expected.items():
            manifest = module.load_manifest(ROOT, level)
            self.assertEqual(len(manifest["scenario_ids"]), count)

if __name__=='__main__':
    unittest.main()
