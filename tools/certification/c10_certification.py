#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from c10lib import (
    CASE_FIELDS, aggregate_wordbench_response, build_english_benchmark, build_g1_cases, build_paradigm_registry,
    build_parity, coverage_tables, generate_bug_handoffs, generate_dashboard, generate_g2_cases, generate_g2_scenarios,
    generate_g3_cases, generate_g3_scenarios, lint_artifacts, parse_wordbench_request,
    project_source_lock, promote_golds, read_csv, record_review_ledger, record_structural_evidence, refresh_evidence_artifacts, refresh_g1_evidence_candidates, release_packet, render_coverage_summary, render_parity_markdown, sha256_file, update_project_optional_scenarios, validate_review_rows,
    write_csv, write_json,
)


def root_from(arg: str | None) -> Path:
    if arg:
        p=Path(arg).resolve()
    else:
        p=Path(__file__).resolve().parents[2]
    if not (p/"project.toml").is_file():
        raise SystemExit(f"not an Albanian project root: {p}")
    return p


def bootstrap(root: Path, contracts: Path, rgl_src: Path | None = None) -> None:
    cert=root/"validation/certification"
    g1=build_g1_cases(root)
    g2=generate_g2_cases(root,g1)
    g2_ids=generate_g2_scenarios(root,g2)
    g3=generate_g3_cases(root,g2)
    g3_ids=generate_g3_scenarios(root,g3)
    update_project_optional_scenarios(root, g2_ids+g3_ids)

    for lvl,rows in (("g1",g1),("g2",g2),("g3",g3)):
        write_csv(cert/"campaigns"/lvl/"case_ledger.tsv",rows,CASE_FIELDS)
        write_json(cert/"campaigns"/lvl/"manifest.json",{
            "schema":"albanian-c10-campaign-v1","level":lvl.upper(),"case_count":len(rows),
            "source_lock_sha256":project_source_lock(root),
            "scenario_ids":sorted({str(r["scenario_id"]) for r in rows if r.get("scenario_id")}),
            "language_variety":"Standard Albanian",
        })

    refresh_g1_evidence_candidates(root, g1)

    parity,module_parity=build_parity(root,contracts)
    write_csv(cert/"parity/english_parity_functions.csv",parity,["signature_id","module","symbol","type","english_example","status","structural_basis","linguistic_certification","owner_conversation","source_contract_sha256","test_ids","gold_ids","rationale"])
    write_csv(cert/"parity/module_parity.csv",module_parity,["module","scope","file","status","owner_conversation","rationale"])
    benchmark=None
    if rgl_src is not None:
        benchmark=build_english_benchmark(root,rgl_src)
        write_json(cert/"parity/english_benchmark.json",benchmark)
    (cert/"parity/english_parity.md").write_text(render_parity_markdown(parity,module_parity,benchmark),encoding="utf-8")

    paradigms=build_paradigm_registry(root)
    write_csv(cert/"coverage/paradigm_registry.csv",paradigms,["paradigm","overload","type","source_file","owner_conversation","inventory_status","test_status","gold_status"])
    tables=coverage_tables(g3,parity)
    write_csv(cert/"coverage/coverage_by_phenomenon.csv",tables["phenomenon"],["key","cases","executed","reviewed","valid","valid_variant","questionable","invalid","golded"])
    write_csv(cert/"coverage/coverage_by_category.csv",tables["category"],["key","cases","executed","reviewed","valid","valid_variant","questionable","invalid","golded"])
    write_csv(cert/"coverage/coverage_morphology_cells.csv",tables["morphology_cells"],["key","cases","executed","reviewed","valid","valid_variant","questionable","invalid","golded"])
    write_csv(cert/"coverage/coverage_by_abstract_function.csv",tables["abstract_function"],["signature_id","module","symbol","parity_status","linguistic_certification","owner_conversation"])
    (cert/"coverage/coverage_summary.md").write_text(render_coverage_summary(tables),encoding="utf-8")

    dashboard,md=generate_dashboard(root,g1,g2,g3,parity,paradigms)
    write_json(cert/"dashboard/CURRENT.json",dashboard)
    (cert/"dashboard/CURRENT.md").write_text(md,encoding="utf-8")
    findings=lint_artifacts(root)
    write_json(cert/"dashboard/LINT.json",{"schema":"albanian-c10-lint-v1","findings":findings})
    packet,pmd=release_packet(root,dashboard,findings)
    write_json(cert/"release/CURRENT_RELEASE_PACKET.json",packet)
    (cert/"release/CURRENT_RELEASE_PACKET.md").write_text(pmd,encoding="utf-8")
    handoff_index=cert/"bugs/HANDOFF_INDEX.tsv"
    if not handoff_index.exists():
        write_csv(handoff_index,[],["bug_id","case_id","campaign_level","owner_conversation","owner_domain","scenario_id","verdict","confidence","status"])
    print(f"C10 bootstrap complete: G1={len(g1)} G2={len(g2)} G3={len(g3)} optional_scenarios={len(g2_ids)+len(g3_ids)}")
    print(f"working_tree_lock_sha256={project_source_lock(root)}")


def cmd_ingest(root: Path, args: argparse.Namespace) -> None:
    level=args.level.lower()
    cases=read_csv(root/f"validation/certification/campaigns/{level}/case_ledger.tsv",delimiter="\t")
    rows=parse_wordbench_request(root,Path(args.request),cases)
    out=Path(args.output) if args.output else root/f"validation/certification/reviews/{level}_case_outputs.tsv"
    fields=list(CASE_FIELDS)
    for x in ("source_lock_sha256","run_id"):
        if x not in fields: fields.insert(1,x)
    write_csv(out,rows,fields)
    print(f"wrote {len(rows)} case outputs to {out}")


def cmd_response(root: Path, args: argparse.Namespace) -> None:
    rows=read_csv(Path(args.reviewed_cases),delimiter="\t")
    reviewer={"reviewer_kind":args.reviewer_kind,"reviewer_name":args.reviewer_name}
    if args.reviewer_model: reviewer["model"]=args.reviewer_model
    data=aggregate_wordbench_response(Path(args.request),rows,reviewer)
    out=Path(args.output)
    write_json(out,data); print(out)


def cmd_lint(root: Path) -> int:
    findings=lint_artifacts(root)
    for f in findings: print(f"{f['severity']} {f['code']} {f['message']}")
    return 1 if any(f["severity"]=="ERROR" for f in findings) else 0



def cmd_validate_reviews(args: argparse.Namespace) -> int:
    rows=read_csv(Path(args.reviewed_cases),delimiter="\t")
    findings=validate_review_rows(rows,require_all_executed_reviewed=args.require_all_executed_reviewed)
    for f in findings: print(f"{f['severity']} {f['code']} {f['message']}")
    return 1 if any(f["severity"]=="ERROR" for f in findings) else 0


def cmd_record_reviews(root: Path, args: argparse.Namespace) -> None:
    rows=read_csv(Path(args.reviewed_cases),delimiter="\t")
    out=record_review_ledger(root,args.level,rows)
    refresh_evidence_artifacts(root)
    print(f"recorded {len(rows)} reviewed CASE(s) at {out}")


def cmd_record_structural(root: Path, args: argparse.Namespace) -> None:
    data=json.loads(Path(args.evidence).read_text(encoding="utf-8"))
    out=record_structural_evidence(root,data)
    refresh_evidence_artifacts(root)
    print(out)


def cmd_refresh(root: Path) -> int:
    dashboard,findings=refresh_evidence_artifacts(root)
    for f in findings: print(f"{f['severity']} {f['code']} {f['message']}")
    print(f"maturity={dashboard.get('maturity')} certification={dashboard.get('certification_status')}")
    return 1 if any(f["severity"]=="ERROR" for f in findings) else 0


def cmd_handoffs(root: Path, args: argparse.Namespace) -> None:
    rows=read_csv(Path(args.reviewed_cases),delimiter="\t")
    findings=validate_review_rows(rows,require_all_executed_reviewed=False)
    if any(f["severity"]=="ERROR" for f in findings):
        raise SystemExit("review ledger is invalid; run validate-reviews")
    handoffs=generate_bug_handoffs(root,rows,overwrite=args.overwrite)
    print(f"generated {len(handoffs)} C1-C9 bug handoff(s)")


def cmd_promote(root: Path, args: argparse.Namespace) -> None:
    rows=read_csv(Path(args.reviewed_cases),delimiter="\t")
    findings=validate_review_rows(rows,require_all_executed_reviewed=False)
    if any(f["severity"]=="ERROR" for f in findings):
        raise SystemExit("review ledger is invalid; run validate-reviews")
    promos=promote_golds(root,Path(args.request),rows,decision_ref=args.decision_ref,reviewer_kind=args.reviewer_kind,reviewer_name=args.reviewer_name,reviewer_model=args.reviewer_model or "",scenario_ids=args.scenario or (),allow_replace=args.allow_replace)
    print(f"promoted {len(promos)} scenario gold(s)")

def main() -> int:
    ap=argparse.ArgumentParser(description="Albanian RGL Conversation 10 certification toolkit")
    ap.add_argument("--root",help="Albanian project root")
    sub=ap.add_subparsers(dest="cmd",required=True)
    b=sub.add_parser("bootstrap",help="materialize G1/G2/G3, parity, coverage, dashboard and release packet")
    b.add_argument("--abstract-signatures",required=True,help="Compendium contracts/ABSTRACT_SIGNATURES.jsonl")
    b.add_argument("--rgl-src",help="supplied full RGL src directory, for English benchmark metrics")
    i=sub.add_parser("ingest-wordbench",help="split hash-bound Wordbench scenario outputs into CASE outputs")
    i.add_argument("--level",choices=["g1","g2","g3"],required=True); i.add_argument("--request",required=True); i.add_argument("--output")
    r=sub.add_parser("build-wordbench-response",help="aggregate reviewed CASEs back to Wordbench response schema")
    r.add_argument("--request",required=True); r.add_argument("--reviewed-cases",required=True); r.add_argument("--reviewer-kind",choices=["ai","human","dual"],required=True); r.add_argument("--reviewer-name",required=True); r.add_argument("--reviewer-model"); r.add_argument("--output",required=True)
    vr=sub.add_parser("validate-reviews",help="validate a case-level review ledger")
    vr.add_argument("--reviewed-cases",required=True); vr.add_argument("--require-all-executed-reviewed",action="store_true")
    pg=sub.add_parser("promote-golds",help="explicitly promote reviewed scenario outputs to Wordbench golds")
    pg.add_argument("--request",required=True); pg.add_argument("--reviewed-cases",required=True); pg.add_argument("--decision-ref",required=True); pg.add_argument("--reviewer-kind",choices=["ai","human","dual"],required=True); pg.add_argument("--reviewer-name",required=True); pg.add_argument("--reviewer-model"); pg.add_argument("--scenario",action="append"); pg.add_argument("--allow-replace",action="store_true")
    rr=sub.add_parser("record-reviews",help="validate and record a canonical C10 case-review ledger, then refresh evidence projections")
    rr.add_argument("--level",choices=["g1","g2","g3"],required=True); rr.add_argument("--reviewed-cases",required=True)
    rs=sub.add_parser("record-structural",help="record fresh external GF/Wordbench structural evidence bound to the current C10 working-tree lock")
    rs.add_argument("--evidence",required=True)
    sub.add_parser("refresh",help="rebuild coverage/dashboard/release from recorded evidence without regenerating campaigns")
    bh=sub.add_parser("build-handoffs",help="materialize invalid/questionable CASE handoffs for C1-C9")
    bh.add_argument("--reviewed-cases",required=True); bh.add_argument("--overwrite",action="store_true")
    sub.add_parser("lint",help="run blocking C10 consistency checks")
    sub.add_parser("source-lock",help="print deterministic working-tree lock")
    args=ap.parse_args(); root=root_from(args.root)
    if args.cmd=="bootstrap": bootstrap(root,Path(args.abstract_signatures),Path(args.rgl_src) if args.rgl_src else None); return 0
    if args.cmd=="ingest-wordbench": cmd_ingest(root,args); return 0
    if args.cmd=="build-wordbench-response": cmd_response(root,args); return 0
    if args.cmd=="validate-reviews": return cmd_validate_reviews(args)
    if args.cmd=="promote-golds": cmd_promote(root,args); refresh_evidence_artifacts(root); return 0
    if args.cmd=="record-reviews": cmd_record_reviews(root,args); return 0
    if args.cmd=="record-structural": cmd_record_structural(root,args); return 0
    if args.cmd=="refresh": return cmd_refresh(root)
    if args.cmd=="build-handoffs": cmd_handoffs(root,args); return 0
    if args.cmd=="lint": return cmd_lint(root)
    if args.cmd=="source-lock": print(project_source_lock(root)); return 0
    return 2

if __name__=="__main__": raise SystemExit(main())
