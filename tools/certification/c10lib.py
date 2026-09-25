from __future__ import annotations

import csv
import difflib
import hashlib
import json
import re
import tomllib
from collections import Counter, defaultdict, deque
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Iterator, Sequence

BASELINE_ARCHIVE_SHA256 = "961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829"
RGL_ARCHIVE_SHA256 = "e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d"
WORDBENCH_ARCHIVE_SHA256 = "1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd"
ALBANIAN_REF_ARCHIVE_SHA256 = "15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc"
COMPENDIUM_ARCHIVE_SHA256 = "73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe"

VERDICTS = {"valid", "valid_variant", "questionable", "invalid"}
CONFIDENCES = {"high", "medium", "low"}
PARITY_STATUSES = {
    "implemented", "equivalent", "partial", "missing",
    "linguistically_not_applicable", "needs_review",
}
REVIEWER_KINDS = {"ai", "human", "dual"}

OWNER_BY_DOMAIN = {
    "morphology_foundational": 1,
    "morphodict": 2,
    "dict_lexicon": 3,
    "tam_voice_aux": 4,
    "clitics_case_prepositions": 5,
    "nominal": 6,
    "clause": 7,
    "valency_construction": 8,
    "surface_api": 9,
    "certification": 10,
}

FAMILY_OWNER = {
    "noun-morphology": 1,
    "verb-morphology": 1,
    "adjective-agreement": 6,
    "syntax-core": 7,
    "clitics-negation": 5,
    "questions-relatives": 7,
    "names-preps-numerals": 6,
    "construction-stress": 8,
    "cross-feature-stress": 10,
    "dict-lexical": 3,
    "morphodict-lexical": 2,
    "morphology-detail": 1,
}

MODULE_OWNER = {
    "Adjective": 6, "Adverb": 9, "Conjunction": 8, "Construction": 8,
    "Extend": 9, "Extra": 9, "Idiom": 8, "Noun": 6, "Numeral": 6,
    "Phrase": 9, "Question": 7, "Relative": 7, "Sentence": 7,
    "Symbol": 9, "Tense": 4, "Text": 9, "Verb": 8,
    "Structural": 9, "Names": 6, "Lexicon": 3, "Markup": 9,
    "Documentation": 9, "Grammar": 9, "Lang": 9,
}

CASE_FIELDS = [
    "case_id", "campaign_level", "scenario_id", "run_id", "source_lock_sha256", "script_sha256", "normalization_version", "family", "label", "module",
    "expression", "category", "source_kind", "source_symbol", "cell",
    "owner_conversation", "owner_domain", "provenance_status", "protected_scope",
    "execution_status", "scenario_output_sha256", "case_output_sha256", "output_text",
    "language_variety", "verdict", "confidence", "rationale", "evidence_refs",
    "reviewer_kind", "reviewer_name", "reviewer_model", "reviewed_at",
    "bug_id", "gold_eligible", "gold_promoted", "gold_path", "decision_ref",
]

@dataclass(frozen=True)
class CellSpec:
    key: str
    expression_suffix: str


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def sha256_text(text: str) -> str:
    return sha256_bytes(text.encode("utf-8"))


def canonical_json(data: object) -> str:
    return json.dumps(data, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def tree_lock(root: Path, paths: Sequence[Path]) -> str:
    h = hashlib.sha256()
    for path in sorted(paths, key=lambda p: p.as_posix()):
        rel = path.relative_to(root).as_posix().encode("utf-8")
        h.update(rel); h.update(b"\0"); h.update(path.read_bytes()); h.update(b"\0")
    return h.hexdigest()


def project_source_lock(root: Path) -> str:
    selected: list[Path] = []
    for base in [
        root / "AlbanianSQI/GF/lib/src/albanian",
        root / "AlbanianSQI/GF/lib/src/morphodict",
        root / "validation/inputs",
        root / "validation/scenarios",
    ]:
        if base.exists():
            selected.extend(p for p in base.rglob("*") if p.is_file())
    if (root / "project.toml").is_file():
        selected.append(root / "project.toml")
    return tree_lock(root, selected)


def read_csv(path: Path, delimiter: str = ",") -> list[dict[str, str]]:
    with path.open("r", encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f, delimiter=delimiter))


def write_csv(path: Path, rows: Sequence[dict[str, object]], fieldnames: Sequence[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    delimiter = "\t" if path.suffix.lower() == ".tsv" else ","
    with path.open("w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore", delimiter=delimiter)
        w.writeheader()
        for row in rows:
            w.writerow({k: _stringify(row.get(k, "")) for k in fieldnames})


def write_json(path: Path, data: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def _stringify(value: object) -> str:
    if value is None:
        return ""
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (list, tuple, set)):
        return ";".join(str(x) for x in value)
    return str(value)


def infer_category(symbol_or_label: str) -> str:
    token = symbol_or_label.split()[0]
    m = re.search(r"_([A-Z][A-Z0-9]*|Adv|Prep|Conj|Interj|PN|Pron|Det|Subj|IAdv|IP|IDet|IQuant)$", token)
    return m.group(1) if m else ""


def owner_domain_for_family(family: str) -> str:
    owner = FAMILY_OWNER.get(family, 10)
    return {
        1: "morphology_foundational", 2: "morphodict", 3: "dict_lexicon",
        4: "tam_voice_aux", 5: "clitics_case_prepositions", 6: "nominal",
        7: "clause", 8: "valency_construction", 9: "surface_api", 10: "certification",
    }[owner]


def owner_for_case(family: str, scenario_id: str, label: str, expression: str = "") -> int:
    text = f"{scenario_id} {label} {expression}".lower()
    if family == "noun-morphology" or family == "verb-morphology": return 1
    if family == "adjective-agreement": return 6
    if family == "clitics-negation": return 5
    if family == "questions-relatives": return 7
    if family == "construction-stress": return 8
    if family == "dict-lexical": return 3
    if family == "morphodict-lexical": return 2
    if family == "names-preps-numerals":
        if any(x in text for x in (" in "," from "," with "," to "," under ","without","prep")): return 5
        return 6
    if family == "syntax-core":
        if any(x in scenario_id for x in ("v2","v3","complements","coordination","copular")): return 8
        return 7
    if family == "cross-feature-stress":
        if any(x in text for x in ("wh ","relative"," who ","if ","when ","although","because")): return 7
        if any(x in text for x in ("passive","progressive","future","conditional","past ","negative love","negative read","negative give")): return 4
        if any(x in text for x in ("beautiful","good man","girl","man in city")): return 6
        if any(x in text for x in ("beg ","paint ","say ","give ","coord")): return 8
        return 7
    return FAMILY_OWNER.get(family, 10)


def base_case_row(**kwargs: object) -> dict[str, object]:
    row: dict[str, object] = {k: "" for k in CASE_FIELDS}
    row.update({
        "language_variety": "Standard Albanian",
        "normalization_version": "1.0.0",
        "execution_status": "not_executed",
        "protected_scope": "false",
        "gold_eligible": "false",
        "gold_promoted": "false",
    })
    row.update(kwargs)
    return row


def parse_case_markers(script_path: Path) -> list[tuple[str, str, str]]:
    lines = script_path.read_text(encoding="utf-8").splitlines()
    out: list[tuple[str, str, str]] = []
    marker_re = re.compile(r'^\s*ps\s+"CASE\s+([^\s"]+)\s*(.*?)"\s*$')
    lin_re = re.compile(r"^\s*l\s+(.+?)\s*$")
    i = 0
    while i < len(lines):
        m = marker_re.match(lines[i])
        if m:
            case_id, label = m.group(1), m.group(2)
            expression = ""
            j = i + 1
            while j < len(lines):
                if marker_re.match(lines[j]) or "GF_WORDBENCH_END" in lines[j]:
                    break
                lm = lin_re.match(lines[j])
                if lm:
                    expression = lm.group(1)
                    break
                j += 1
            if not expression:
                raise ValueError(f"no linearize command after {case_id} in {script_path}")
            out.append((case_id, label, expression))
        i += 1
    return out


def build_g1_cases(root: Path) -> list[dict[str, object]]:
    core = read_csv(root / "validation/CAMPAIGN_MANIFEST.csv")
    rows: list[dict[str, object]] = []
    for r in core:
        family = r["family"]
        cat = infer_category(r["label"])
        owner = owner_for_case(family, r["scenario_id"], r["label"], r["expression"])
        rows.append(base_case_row(
            case_id=r["case_id"], campaign_level="G1", scenario_id=r["scenario_id"],
            family=family, label=r["label"], module=r["module"], expression=r["expression"],
            category=cat, source_kind="core", source_symbol=_symbol_from_expression(r["expression"]),
            owner_conversation=owner, owner_domain={1:"morphology_foundational",2:"morphodict",3:"dict_lexicon",4:"tam_voice_aux",5:"clitics_case_prepositions",6:"nominal",7:"clause",8:"valency_construction",9:"surface_api",10:"certification"}[owner],
            provenance_status="existing_campaign", protected_scope="true",
        ))
    for scenario_id, family, script_name, source_kind, owner in [
        ("alb-dict-smoke", "dict-lexical", "alb-dict-smoke.gfs", "dict", 3),
        ("alb-morphodict-smoke", "morphodict-lexical", "alb-morphodict-smoke.gfs", "morphodict", 2),
    ]:
        for case_id, label, expression in parse_case_markers(root / "validation/scenarios" / script_name):
            rows.append(base_case_row(
                case_id=case_id, campaign_level="G1", scenario_id=scenario_id, family=family,
                label=label, module="DictSqi" if source_kind == "dict" else "MorphoDictSqi",
                expression=expression, category=infer_category(label), source_kind=source_kind,
                source_symbol=expression.strip(), owner_conversation=owner,
                owner_domain="dict_lexicon" if owner == 3 else "morphodict",
                provenance_status="existing_smoke", protected_scope="true",
            ))
    _require_count(rows, 569, "G1")
    _require_unique([str(r["case_id"]) for r in rows], "G1 case IDs")
    return rows


def _symbol_from_expression(expr: str) -> str:
    m = re.search(r"(?:L|D|M)\.([\wÀ-ž_]+)", expr, re.UNICODE)
    return m.group(1) if m else ""


def lexical_candidates(root: Path) -> list[dict[str, str]]:
    out: list[dict[str, str]] = []
    for r in read_csv(root / "docs/dictionary/DictSqi_provenance.tsv", delimiter="\t"):
        out.append({
            "source_kind": "dict", "symbol": r["gf_id"], "category": r["category"],
            "lemma": r["lemma"], "provenance_status": r["validation_status"],
            "quality": "baseline_exact" if r["validation_status"] == "baseline_lexicon_exact" else "imported_unreviewed",
            "tier": _dict_tier(r),
        })
    for r in read_csv(root / "docs/morphodict/COVERAGE.csv"):
        out.append({
            "source_kind": "morphodict", "symbol": r["id"], "category": r["cat"],
            "lemma": r["base"], "provenance_status": r["quality"], "quality": r["quality"],
            "tier": _morph_tier(r["quality"]),
        })
    return out


def _dict_tier(row: dict[str, str]) -> str:
    if row.get("validation_status") == "baseline_lexicon_exact": return "T1_exact_baseline"
    flags = row.get("flags", "")
    lemma = row.get("lemma", "")
    if "multiword" in flags or any(ch in lemma for ch in " -'’/"):
        return "T3_high_risk_import"
    return "T2_single_lemma_import"


def _morph_tier(quality: str) -> str:
    if quality.startswith("exact") or quality in {"rgl-derived-explicit", "rgl+reference-characteristic"}:
        return "T1_or_T2_supported"
    if quality == "compile-safe-placeholder":
        return "T3_placeholder"
    return "T2_direct"


def _balanced_take(candidates: Sequence[dict[str, str]], n: int) -> list[dict[str, str]]:
    groups: dict[tuple[str, str, str], deque[dict[str, str]]] = defaultdict(deque)
    for r in sorted(candidates, key=lambda x: (x["source_kind"], x["tier"], x["category"], x["symbol"])):
        groups[(r["source_kind"], r["tier"], r["category"])].append(r)
    keys = sorted(groups)
    selected: list[dict[str, str]] = []
    while len(selected) < n:
        progressed = False
        for key in keys:
            if groups[key] and len(selected) < n:
                selected.append(groups[key].popleft()); progressed = True
        if not progressed:
            break
    if len(selected) != n:
        raise ValueError(f"requested {n} balanced candidates, got {len(selected)}")
    return selected


def generate_g2_cases(root: Path, g1: Sequence[dict[str, object]]) -> list[dict[str, object]]:
    smoke = {(str(r["source_kind"]), str(r["source_symbol"])) for r in g1 if r["source_kind"] in {"dict", "morphodict"}}
    candidates = [r for r in lexical_candidates(root) if (r["source_kind"], r["symbol"]) not in smoke]
    extras = _balanced_take(candidates, 5000 - len(g1))
    out = [dict(r) for r in g1]
    for i, r in enumerate(extras, 1):
        owner = 3 if r["source_kind"] == "dict" else 2
        out.append(base_case_row(
            case_id=f"G2C{i:05d}", campaign_level="G2", family=f"{r['source_kind']}-lexical",
            label=f"{r['symbol']} lexical smoke", module="DictSqi" if owner == 3 else "MorphoDictSqi",
            expression=r["symbol"], category=r["category"], source_kind=r["source_kind"],
            source_symbol=r["symbol"], owner_conversation=owner,
            owner_domain="dict_lexicon" if owner == 3 else "morphodict",
            provenance_status=r["provenance_status"], protected_scope="false",
        ))
    _require_count(out, 5000, "G2")
    return out


def noun_cells() -> list[CellSpec]:
    return [CellSpec(f"{sp.lower()}_{ca.lower()}_{nu.lower()}", f".s ! {sp} ! {ca} ! {nu}")
            for sp in ("Indef", "Def") for ca in ("Nom", "Acc", "Dat", "Ablat") for nu in ("Sg", "Pl")]


def adjective_cells() -> list[CellSpec]:
    return [CellSpec(f"{ca.lower()}_{ge.lower()}_{nu.lower()}", f".s ! {ca} ! {ge} ! {nu}")
            for ca in ("Nom", "Acc", "Dat", "Ablat") for ge in ("Masc", "Fem") for nu in ("Sg", "Pl")]


def verb_cells() -> list[CellSpec]:
    cells: list[CellSpec] = []
    for tense in ("Pres", "Past", "Imperfect", "Aorist"):
        for num in ("Sg", "Pl"):
            for person in ("P1", "P2", "P3"):
                cells.append(CellSpec(f"indicative_{tense.lower()}_{num.lower()}_{person.lower()}", f".Indicative ! ResSqi.{tense} ! {num} ! {person}"))
    for num in ("Sg", "Pl"):
        for person in ("P1", "P2", "P3"):
            cells.append(CellSpec(f"subjunctive_{num.lower()}_{person.lower()}", f".Subjunctive ! {num} ! {person}"))
    for num in ("Sg", "Pl"):
        cells.append(CellSpec(f"imperative_{num.lower()}", f".Imperative ! {num}"))
    cells.append(CellSpec("participle", ".participle"))
    for field in ("pres_optative", "perf_optative", "pres_admirative", "imperf_admirative"):
        for num in ("Sg", "Pl"):
            for person in ("P1", "P2", "P3"):
                cells.append(CellSpec(f"{field}_{num.lower()}_{person.lower()}", f".{field} ! {num} ! {person}"))
    assert len(cells) == 57
    return cells


def detailed_candidates(root: Path) -> list[dict[str, str]]:
    candidates = lexical_candidates(root)
    allowed = [r for r in candidates if r["category"] in {"N", "N2", "N3", "A", "A2"} or r["category"].startswith("V")]
    quality_rank = {
        "exact": 0, "exact-irregular": 0, "exact-normalized": 0, "baseline_exact": 0,
        "rgl-derived-explicit": 1, "rgl+reference-characteristic": 1, "direct-with-government": 1,
        "direct-invariant": 2, "imported_unreviewed": 3, "compile-safe-placeholder": 4,
    }
    return sorted(allowed, key=lambda r: (quality_rank.get(r["quality"], 5), r["source_kind"], r["category"], r["symbol"]))


def generate_g3_cases(root: Path, g2: Sequence[dict[str, object]]) -> list[dict[str, object]]:
    out = [dict(r) for r in g2]
    need = 20000 - len(out)
    idx = 1
    for r in detailed_candidates(root):
        if need <= 0: break
        cat = r["category"]
        cells = noun_cells() if cat in {"N", "N2", "N3"} else adjective_cells() if cat in {"A", "A2"} else verb_cells()
        for cell in cells:
            if need <= 0: break
            owner = 1
            out.append(base_case_row(
                case_id=f"G3C{idx:05d}", campaign_level="G3", family="morphology-detail",
                label=f"{r['symbol']} {cell.key}", module="DictSqi" if r["source_kind"] == "dict" else "MorphoDictSqi",
                expression=f"{r['symbol']}{cell.expression_suffix}", category=cat,
                source_kind=r["source_kind"], source_symbol=r["symbol"], cell=cell.key,
                owner_conversation=owner, owner_domain="morphology_foundational",
                provenance_status=r["provenance_status"], protected_scope="false",
            ))
            idx += 1; need -= 1
    if need:
        raise ValueError(f"not enough detailed candidates; {need} G3 cases missing")
    _require_count(out, 20000, "G3")
    return out


def _require_count(rows: Sequence[object], expected: int, label: str) -> None:
    if len(rows) != expected:
        raise ValueError(f"{label}: expected {expected}, got {len(rows)}")


def _require_unique(values: Sequence[str], label: str) -> None:
    dup = [x for x,c in Counter(values).items() if c > 1]
    if dup:
        raise ValueError(f"duplicate {label}: {dup[:10]}")


def generate_g2_scenarios(root: Path, g2: list[dict[str, object]], batch_size: int = 250) -> list[str]:
    extras = [r for r in g2 if str(r["case_id"]).startswith("G2C")]
    ids: list[str] = []
    seq = 1
    for source_kind in ("dict", "morphodict"):
        subset = [r for r in extras if r["source_kind"] == source_kind]
        for batch_no, batch in enumerate(_chunks(subset, batch_size), 1):
            scenario_id = f"alb-c10-g2-{source_kind}-{batch_no:03d}"
            ids.append(scenario_id)
            for r in batch: r["scenario_id"] = scenario_id
            abs_name = "AlbDictValidation" if source_kind == "dict" else "AlbMorphoDictValidation"
            input_files = [root / "validation/inputs" / f"{abs_name}.gf", root / "validation/inputs" / f"{abs_name}Sqi.gf"]
            _write_simple_scenario(root, scenario_id, batch, f"{abs_name}Sqi.gf", input_files)
            seq += 1
    return ids


def generate_g3_scenarios(root: Path, g3: list[dict[str, object]], batch_size: int = 250) -> list[str]:
    extras = [r for r in g3 if str(r["case_id"]).startswith("G3C")]
    ids: list[str] = []
    for batch_no, batch in enumerate(_chunks(extras, batch_size), 1):
        scenario_id = f"alb-c10-g3-morph-{batch_no:03d}"
        ids.append(scenario_id)
        module = f"AlbC10G3{batch_no:03d}"
        for r in batch: r["scenario_id"] = scenario_id; r["module"] = module
        abs_path = root / "validation/inputs" / f"{module}.gf"
        cnc_path = root / "validation/inputs" / f"{module}Sqi.gf"
        _write_probe_modules(abs_path, cnc_path, module, batch)
        _write_simple_scenario(root, scenario_id, batch, f"{module}Sqi.gf", [abs_path, cnc_path], use_case_id_as_expression=True)
    return ids


def _chunks(items: Sequence[dict[str, object]], n: int) -> Iterator[list[dict[str, object]]]:
    for i in range(0, len(items), n):
        yield list(items[i:i+n])


def _write_simple_scenario(root: Path, scenario_id: str, rows: Sequence[dict[str, object]], import_file: str,
                           inputs: Sequence[Path], use_case_id_as_expression: bool = False) -> None:
    lines: list[str] = []
    for p in inputs:
        rel = p.relative_to(root).as_posix()
        lines.append(f"-- GF_WORDBENCH_INPUT_SHA256 {sha256_file(p)} {rel}")
    lines += [f"i {import_file}", 'ps "GF_WORDBENCH_BEGIN cases"']
    for r in rows:
        label = str(r["label"]).replace('"', "'")
        lines.append(f'ps "CASE {r["case_id"]} {label}"')
        lines.append(f"l {r['case_id'] if use_case_id_as_expression else r['expression']}")
    lines += ['ps "GF_WORDBENCH_END cases"', "q", ""]
    path = root / "validation/scenarios" / f"{scenario_id}.gfs"
    path.write_text("\n".join(lines), encoding="utf-8")


def _write_probe_modules(abs_path: Path, cnc_path: Path, module: str, rows: Sequence[dict[str, object]]) -> None:
    abs_lines = [f"abstract {module} = {{", "  cat Probe ;", "  fun"]
    abs_lines += [f"    {r['case_id']} : Probe ;" for r in rows]
    abs_lines += ["}", ""]
    abs_path.write_text("\n".join(abs_lines), encoding="utf-8")

    cnc = [
        "--# -path=../../AlbanianSQI/GF/lib/src/morphodict",
        f"concrete {module}Sqi of {module} =",
        "  open Prelude, ResSqi, (D = DictSqi), (M = MorphoDictSqi) in {",
        "  lincat Probe = {s : Str} ;",
        "  lin",
    ]
    for r in rows:
        alias = "D" if r["source_kind"] == "dict" else "M"
        expr = str(r["expression"])
        symbol = str(r["source_symbol"])
        suffix = expr[len(symbol):]
        cnc.append(f"    {r['case_id']} = {{s = ({alias}.{symbol}){suffix}}} ;")
    cnc += ["} ;", ""]
    cnc_path.write_text("\n".join(cnc), encoding="utf-8")


def update_project_optional_scenarios(root: Path, scenario_ids: Sequence[str]) -> None:
    path = root / "project.toml"
    text = path.read_text(encoding="utf-8")
    block = "optional_scenarios = [\n" + "".join(f'  "{sid}",\n' for sid in scenario_ids) + "]"
    text2, n = re.subn(r"optional_scenarios\s*=\s*\[(?:.|\n)*?\]", block, text, count=1)
    if n != 1:
        raise ValueError("could not replace optional_scenarios in project.toml")
    path.write_text(text2, encoding="utf-8")


def build_parity(root: Path, abstract_signatures: Path) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    src = root / "AlbanianSQI/GF/lib/src/albanian"
    function_rows: list[dict[str, object]] = []
    with abstract_signatures.open("r", encoding="utf-8") as f:
        for line in f:
            if not line.strip(): continue
            rec = json.loads(line)
            mod = rec["module"]
            concrete = src / f"{mod}Sqi.gf"
            exists = concrete.is_file()
            function_rows.append({
                "signature_id": rec["signature_id"], "module": mod, "symbol": rec["symbol"],
                "type": rec["type"], "english_example": rec.get("example", ""),
                "status": "implemented" if exists else "missing",
                "structural_basis": f"{concrete.relative_to(root).as_posix()} exists" if exists else "no concrete module found",
                "linguistic_certification": "needs_review", "owner_conversation": MODULE_OWNER.get(mod, 9),
                "source_contract_sha256": rec.get("record_sha256", ""), "test_ids": "", "gold_ids": "",
                "rationale": "Common RGL abstract obligation; surface correctness requires Albanian evidence/gold.",
            })
    modules = [
        "Adjective","Adverb","Conjunction","Construction","Extend","Extra","Idiom","Names","Noun","Numeral",
        "Phrase","Question","Relative","Sentence","Structural","Symbol","Tense","Text","Verb","Lexicon",
        "Documentation","Markup","Grammar","Lang","All","Syntax","Constructors","Combinators","Try","Symbolic","Browse",
    ]
    module_rows: list[dict[str, object]] = []
    api_root = root / "AlbanianSQI/GF/lib/src"
    for mod in modules:
        if mod == "Browse":
            module_rows.append({"module":mod,"scope":"tooling_optional","file":"","status":"linguistically_not_applicable","owner_conversation":9,"rationale":"Canonical policy: out of core release scope unless upstream packaging requires it."})
            continue
        path = src / f"{mod}Sqi.gf"
        if mod in {"Syntax","Constructors","Combinators","Try","Symbolic"}:
            path = api_root / f"{mod}Sqi.gf"
        exists = path.is_file()
        status = "implemented" if exists else "missing"
        if mod == "Extra" and exists: status = "equivalent"
        module_rows.append({
            "module": mod, "scope":"core" if mod not in {"Browse"} else "tooling_optional",
            "file": path.relative_to(root).as_posix() if exists else "", "status":status,
            "owner_conversation": MODULE_OWNER.get(mod, 9),
            "rationale":"Concrete module present; linguistic equivalence remains evidence-bound." if exists else "Required surface not found in current snapshot.",
        })
    return function_rows, module_rows


def build_paradigm_registry(root: Path) -> list[dict[str, object]]:
    path = root / "AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf"
    text = _strip_line_comments(path.read_text(encoding="utf-8"))
    oper_pos = text.find("oper")
    if oper_pos < 0: return []
    block = text[oper_pos + 4:]
    statements = [s.strip() for s in block.split(";") if ":" in s]
    rows: list[dict[str, object]] = []
    overload_count: Counter[str] = Counter()
    for st in statements:
        st = re.sub(r"\s+", " ", st).strip()
        if "=" in st:
            left = st.split("=",1)[0].strip()
        else:
            left = st
        if ":" not in left: continue
        names, typ = left.rsplit(":",1)
        names = names.strip(); typ = typ.strip()
        if not re.fullmatch(r"[A-Za-z][A-Za-z0-9_']*(?:\s*,\s*[A-Za-z][A-Za-z0-9_']*)*", names):
            continue
        for name in [x.strip() for x in names.split(",")]:
            overload_count[name] += 1
            rows.append({
                "paradigm": name, "overload": overload_count[name], "type": typ,
                "source_file": path.relative_to(root).as_posix(), "owner_conversation": 1,
                "inventory_status":"inventoried", "test_status":"untested", "gold_status":"not_established",
            })
    return rows


def _strip_line_comments(text: str) -> str:
    return "\n".join(line.split("--",1)[0] for line in text.splitlines())


def count_abstract_functions(path: Path) -> int:
    text=_strip_line_comments(path.read_text(encoding="utf-8"))
    # Count identifiers declared before a colon in fun blocks. Generated Dict/MorphoDict use one declaration per line.
    count=0; in_fun=False
    for raw in text.splitlines():
        line=raw.strip()
        if line.startswith("fun"):
            in_fun=True; line=line[3:].strip()
        if not in_fun: continue
        if line.startswith(("cat ","flags ","param ","oper ","lin ","lincat ")): in_fun=False; continue
        if ":" in line:
            left=line.split(":",1)[0].strip()
            names=[x.strip() for x in left.split(",") if re.fullmatch(r"[A-Za-zÀ-ž_][A-Za-zÀ-ž0-9_']*",x.strip())]
            count += len(names)
    return count


def build_english_benchmark(root: Path, rgl_src: Path) -> dict[str, object]:
    sqi=root/"AlbanianSQI/GF/lib/src/albanian"
    morph=root/"AlbanianSQI/GF/lib/src/morphodict"
    eng=rgl_src/"english"; rmorph=rgl_src/"morphodict"
    def fcount(path: Path) -> int:
        return count_abstract_functions(path) if path.is_file() else 0
    data={
        "schema":"albanian-c10-english-benchmark-v1",
        "rgl_archive_sha256":RGL_ARCHIVE_SHA256,
        "metrics":{
            "dict_abstract_functions":{"albanian":fcount(sqi/"DictSqiAbs.gf"),"english":fcount(eng/"DictEngAbs.gf")},
            "morphodict_lemgrams":{"albanian":fcount(morph/"MorphoDictSqiAbs.gf"),"english":fcount(rmorph/"MorphoDictEngAbs.gf")},
            "language_gf_files":{"albanian":len(list(sqi.glob("*.gf"))),"english":len(list(eng.glob("*.gf")))},
            "dict_concrete_bytes":{"albanian":(sqi/"DictSqi.gf").stat().st_size,"english":(eng/"DictEng.gf").stat().st_size},
            "morphodict_concrete_bytes":{"albanian":(morph/"MorphoDictSqi.gf").stat().st_size,"english":(rmorph/"MorphoDictEng.gf").stat().st_size},
            "paradigms_bytes":{"albanian":(sqi/"ParadigmsSqi.gf").stat().st_size,"english":(eng/"ParadigmsEng.gf").stat().st_size},
            "extend_bytes":{"albanian":(sqi/"ExtendSqi.gf").stat().st_size,"english":(eng/"ExtendEng.gf").stat().st_size},
        },
        "documented_reference_notes": {
            "english_morphodict_lemgrams_in_prior_c10_docs": 56577,
            "snapshot_count": fcount(rmorph/"MorphoDictEngAbs.gf"),
            "policy": "Use the supplied source snapshot count for executable comparisons; retain the documented 56,577 figure as a provenance discrepancy until reconciled."
        },
        "interpretation":"English is a maturity/depth benchmark. Raw equality of counts is not a linguistic requirement.",
    }
    return data


def coverage_tables(cases: Sequence[dict[str, object]], parity: Sequence[dict[str, object]]) -> dict[str, list[dict[str, object]]]:
    by_family: dict[str, list[dict[str, object]]] = defaultdict(list)
    by_cat: dict[str, list[dict[str, object]]] = defaultdict(list)
    by_cell: dict[tuple[str,str], list[dict[str, object]]] = defaultdict(list)
    for r in cases:
        by_family[str(r["family"])].append(r)
        if r.get("category"): by_cat[str(r["category"])].append(r)
        if r.get("cell"): by_cell[(str(r["category"]),str(r["cell"]))].append(r)
    def agg(key: str, rows: Sequence[dict[str, object]]) -> dict[str, object]:
        verdicts = Counter(str(r.get("verdict", "")) for r in rows if r.get("verdict"))
        return {
            "key": key, "cases": len(rows),
            "executed": sum(str(r.get("execution_status")) == "executed" for r in rows),
            "reviewed": sum(str(r.get("verdict")) in VERDICTS for r in rows),
            "valid": verdicts["valid"], "valid_variant": verdicts["valid_variant"],
            "questionable": verdicts["questionable"], "invalid": verdicts["invalid"],
            "golded": sum(str(r.get("gold_promoted")).lower() == "true" for r in rows),
        }
    return {
        "phenomenon": [agg(k,v) for k,v in sorted(by_family.items())],
        "category": [agg(k,v) for k,v in sorted(by_cat.items())],
        "morphology_cells": [agg(f"{k[0]}:{k[1]}",v) for k,v in sorted(by_cell.items())],
        "abstract_function": [{
            "signature_id": p["signature_id"], "module": p["module"], "symbol": p["symbol"],
            "parity_status": p["status"], "linguistic_certification": p["linguistic_certification"],
            "owner_conversation": p["owner_conversation"],
        } for p in parity],
    }


def parse_wordbench_request(root: Path, request_path: Path, campaign_cases: Sequence[dict[str, object]]) -> list[dict[str, object]]:
    req = json.loads(request_path.read_text(encoding="utf-8"))
    by_scenario: dict[str, dict[str, dict[str, object]]] = defaultdict(dict)
    for r in campaign_cases:
        by_scenario[str(r["scenario_id"])][str(r["case_id"])] = dict(r)
    output_rows: list[dict[str, object]] = []
    for scenario in req.get("scenarios", []):
        sid = scenario["scenario_id"]
        if sid not in by_scenario: continue
        parsed = split_case_output(scenario.get("output_text", ""))
        expected = by_scenario[sid]
        for cid, row in expected.items():
            text = parsed.get(cid)
            nr = dict(row)
            nr["source_lock_sha256"] = req.get("source_lock_sha256", "")
            nr["run_id"] = req.get("run_id", "")
            nr["scenario_output_sha256"] = scenario.get("output_sha256", "")
            if text is None:
                nr["execution_status"] = "missing_case_output"
            else:
                nr["execution_status"] = "executed"
                nr["output_text"] = text
                nr["case_output_sha256"] = sha256_text(text)
            output_rows.append(nr)
    return output_rows


def split_case_output(text: str) -> dict[str, str]:
    marker = re.compile(r"^CASE\s+([^\s]+)(?:\s+.*)?$")
    end = re.compile(r"^GF_WORDBENCH_END\s+cases$")
    current: str | None = None
    acc: list[str] = []
    out: dict[str,str] = {}
    def flush() -> None:
        nonlocal current, acc
        if current is not None:
            payload = "\n".join(acc).strip("\n")
            out[current] = payload + ("\n" if payload else "")
        current = None; acc = []
    for line in text.replace("\r\n","\n").replace("\r","\n").split("\n"):
        m = marker.match(line.strip())
        if m:
            flush(); current = m.group(1); continue
        if end.match(line.strip()):
            flush(); break
        if current is not None:
            acc.append(line)
    flush()
    return out


def aggregate_wordbench_response(request_path: Path, reviewed_cases: Sequence[dict[str, object]], reviewer: dict[str,str]) -> dict[str, object]:
    req = json.loads(request_path.read_text(encoding="utf-8"))
    by_scenario: dict[str, list[dict[str, object]]] = defaultdict(list)
    for r in reviewed_cases:
        if str(r.get("verdict", "")) in VERDICTS:
            by_scenario[str(r["scenario_id"])].append(r)
    req_scenarios = {s["scenario_id"]: s for s in req.get("scenarios", [])}
    reviews = []
    confidence_rank = {"high": 3, "medium": 2, "low": 1}
    for sid, scenario in req_scenarios.items():
        cases = by_scenario.get(sid, [])
        if not cases: continue
        verdicts = [str(r["verdict"]) for r in cases]
        if "invalid" in verdicts: verdict = "invalid"
        elif "questionable" in verdicts: verdict = "questionable"
        elif "valid_variant" in verdicts: verdict = "valid_variant"
        else: verdict = "valid"
        confs = [str(r["confidence"]) for r in cases if str(r.get("confidence","")) in CONFIDENCES]
        confidence = min(confs, key=lambda x: confidence_rank[x]) if confs else "low"
        issues = [f"{r['case_id']}: {r.get('rationale','')}" for r in cases if r["verdict"] in {"invalid","questionable"}]
        reviews.append({
            "scenario_id": sid, "output_sha256": scenario["output_sha256"], "verdict": verdict,
            "confidence": confidence, "rationale": f"Aggregated from {len(cases)} C10 case-level reviews.",
            "issues": issues, "alternatives": [], "compendium_levels": [],
        })
    return {
        "schema":"gf-wordbench-linguistic-review-response-v1",
        "request_id":req["request_id"], "source_lock_sha256":req["source_lock_sha256"],
        "reviewer": reviewer, "language_variety":req.get("language_variety","Standard Albanian"),
        "reviews": reviews, "notes":["Generated from hash-bound C10 case-level reviews; no scenario is reviewed if it has no reviewed CASEs."],
    }



def validate_review_rows(rows: Sequence[dict[str, object]], *, require_all_executed_reviewed: bool = False) -> list[dict[str,str]]:
    findings: list[dict[str,str]] = []
    def add(sev: str, code: str, message: str) -> None:
        findings.append({"severity":sev,"code":code,"message":message})
    for r in rows:
        cid=str(r.get("case_id",""))
        executed=str(r.get("execution_status",""))=="executed"
        verdict=str(r.get("verdict",""))
        confidence=str(r.get("confidence",""))
        if require_all_executed_reviewed and executed and verdict not in VERDICTS:
            add("ERROR","C10-REV-100",f"executed CASE lacks verdict: {cid}")
        if verdict:
            if verdict not in VERDICTS: add("ERROR","C10-REV-101",f"invalid verdict {verdict}: {cid}")
            if not executed: add("ERROR","C10-REV-109",f"reviewed CASE was not executed: {cid}")
            if confidence not in CONFIDENCES: add("ERROR","C10-REV-102",f"reviewed CASE lacks valid confidence: {cid}")
            if not str(r.get("rationale","" )).strip(): add("ERROR","C10-REV-103",f"reviewed CASE lacks rationale: {cid}")
            case_hash=str(r.get("case_output_sha256","" )).strip()
            if not re.fullmatch(r"[0-9a-f]{64}",case_hash): add("ERROR","C10-REV-104",f"reviewed CASE lacks valid case output hash: {cid}")
            scenario_hash=str(r.get("scenario_output_sha256","" )).strip()
            if not re.fullmatch(r"[0-9a-f]{64}",scenario_hash): add("ERROR","C10-REV-105",f"reviewed CASE lacks valid scenario output hash: {cid}")
            source_lock=str(r.get("source_lock_sha256","" )).strip()
            if not re.fullmatch(r"[0-9a-f]{64}",source_lock): add("ERROR","C10-REV-106",f"reviewed CASE lacks valid source lock: {cid}")
            if str(r.get("language_variety","" )).strip() != "Standard Albanian": add("ERROR","C10-REV-107",f"reviewed CASE variety is not the Standard Albanian C10 namespace: {cid}")
            reviewer_kind=str(r.get("reviewer_kind","")).strip()
            if reviewer_kind not in REVIEWER_KINDS: add("ERROR","C10-REV-110",f"reviewed CASE lacks reviewer kind: {cid}")
            if not str(r.get("reviewer_name","")).strip(): add("ERROR","C10-REV-111",f"reviewed CASE lacks reviewer identity: {cid}")
            if not str(r.get("evidence_refs","")).strip(): add("ERROR","C10-REV-112",f"reviewed CASE lacks evidence reference: {cid}")
            text=str(r.get("output_text",""))
            if text and case_hash and sha256_text(text)!=case_hash: add("ERROR","C10-REV-113",f"CASE output text/hash mismatch: {cid}")
            eligible = verdict in {"valid","valid_variant"} and confidence in {"high","medium"}
            if str(r.get("gold_eligible","false")).lower()=="true" and not eligible:
                add("ERROR","C10-REV-108",f"CASE marked gold-eligible but policy rejects it: {cid}")
    if not any(x["severity"]=="ERROR" for x in findings):
        add("INFO","C10-REV-OK","review rows satisfy C10 structural review policy")
    return findings


def promote_golds(root: Path, request_path: Path, reviewed_cases: Sequence[dict[str, object]], *,
                  decision_ref: str, reviewer_kind: str, reviewer_name: str, reviewer_model: str = "",
                  scenario_ids: Sequence[str] = (), allow_replace: bool = False) -> list[dict[str, object]]:
    if reviewer_kind not in REVIEWER_KINDS:
        raise ValueError(f"unsupported reviewer_kind {reviewer_kind}")
    if not decision_ref.strip() or not reviewer_name.strip():
        raise ValueError("decision_ref and reviewer_name are required")
    req=json.loads(request_path.read_text(encoding="utf-8"))
    req_scen={s["scenario_id"]:s for s in req.get("scenarios",[])}
    by_scen: dict[str,list[dict[str,object]]] = defaultdict(list)
    for r in reviewed_cases:
        by_scen[str(r.get("scenario_id",""))].append(r)
    chosen=set(scenario_ids) if scenario_ids else set(by_scen)
    promotions=[]
    meta_dir=root/"validation/certification/reviews/gold_promotions"
    meta_dir.mkdir(parents=True,exist_ok=True)
    gold_dir=root/"validation/gold"; gold_dir.mkdir(parents=True,exist_ok=True)
    for sid in sorted(chosen):
        if sid not in req_scen:
            raise ValueError(f"scenario {sid} is not present in request")
        rows=by_scen.get(sid,[])
        if not rows: raise ValueError(f"scenario {sid} has no reviewed CASEs")
        bad=[]
        for r in rows:
            verdict=str(r.get("verdict","")); conf=str(r.get("confidence",""))
            if verdict not in {"valid","valid_variant"} or conf not in {"high","medium"}: bad.append(str(r.get("case_id")))
            if str(r.get("source_lock_sha256","")) != str(req.get("source_lock_sha256","")): bad.append(str(r.get("case_id"))+":source-lock")
            if str(r.get("scenario_output_sha256","")) != str(req_scen[sid].get("output_sha256","")): bad.append(str(r.get("case_id"))+":scenario-hash")
            if not str(r.get("evidence_refs","")).strip(): bad.append(str(r.get("case_id"))+":evidence")
            if str(r.get("reviewer_kind","")) not in REVIEWER_KINDS or not str(r.get("reviewer_name","")).strip(): bad.append(str(r.get("case_id"))+":reviewer")
        if bad:
            raise ValueError(f"scenario {sid} is not gold-eligible; blocking CASEs: {bad[:10]}")
        gold=gold_dir/f"{sid}.gold"
        old_text=gold.read_text(encoding="utf-8") if gold.exists() else ""
        old_hash=sha256_text(old_text) if gold.exists() else ""
        if gold.exists() and not allow_replace:
            raise FileExistsError(f"gold exists for {sid}; use allow_replace with explicit decision")
        output_text=str(req_scen[sid].get("output_text",""))
        new_hash=sha256_text(output_text)
        if new_hash != str(req_scen[sid].get("output_sha256","")):
            raise ValueError(f"request output_text/hash mismatch for {sid}")
        diff_text="".join(difflib.unified_diff(old_text.splitlines(True),output_text.splitlines(True),fromfile=f"{sid}.gold.previous",tofile=f"{sid}.gold.promoted"))
        diff_path=meta_dir/f"{sid}.diff"
        diff_path.write_text(diff_text,encoding="utf-8")
        gold.write_text(output_text,encoding="utf-8",newline="")
        meta={
            "schema":"albanian-c10-gold-promotion-v1","scenario_id":sid,"request_id":req["request_id"],
            "source_lock_sha256":req["source_lock_sha256"],"output_sha256":new_hash,"previous_gold_sha256":old_hash,
            "diff_path":diff_path.relative_to(root).as_posix(),"diff_sha256":sha256_file(diff_path),
            "decision_ref":decision_ref,"reviewer_kind":reviewer_kind,"reviewer_name":reviewer_name,"reviewer_model":reviewer_model,
            "case_ids":[str(r.get("case_id")) for r in rows],"case_review_count":len(rows),
            "language_variety":req.get("language_variety","Standard Albanian"),
        }
        write_json(meta_dir/f"{sid}.json",meta); promotions.append(meta)
    return promotions


def refresh_g1_evidence_candidates(root: Path, g1_rows: Sequence[dict[str, object]]) -> None:
    """Regenerate non-verdict evidence candidates for every G1 CASE.

    This function only creates review anchors. It never assigns a linguistic
    verdict, confidence, gold eligibility or gold promotion.
    """
    cert = root / "validation/certification"
    family_map: dict[str, list[str]] = {
        "noun-morphology": ["ALB-EV-001", "ALB-EV-002", "ALB-EV-005", "ALB-EV-006"],
        "adjective-agreement": ["ALB-EV-008", "ALB-EV-009"],
        "verb-morphology": ["ALB-EV-011", "ALB-EV-012", "ALB-EV-015", "ALB-EV-016", "ALB-EV-017", "ALB-EV-018", "ALB-EV-019", "ALB-EV-020"],
        "syntax-core": ["ALB-EV-023"],
        "clitics-negation": ["ALB-EV-010"],
        "questions-relatives": ["ALB-EV-021", "ALB-EV-022"],
        "names-preps-numerals": ["ALB-EV-001", "ALB-EV-021"],
        "construction-stress": ["ALB-EV-010", "ALB-EV-011", "ALB-EV-023"],
        "cross-feature-stress": ["ALB-EV-001", "ALB-EV-008", "ALB-EV-010", "ALB-EV-011", "ALB-EV-021", "ALB-EV-022", "ALB-EV-023"],
        "dict-lexical": [],
        "morphodict-lexical": ["ALB-EV-005", "ALB-EV-006"],
    }

    dict_prov: dict[str, dict[str, str]] = {}
    dict_path = root / "docs/dictionary/DictSqi_provenance.tsv"
    if dict_path.is_file():
        dict_prov = {r["gf_id"]: r for r in read_csv(dict_path, delimiter="\t")}
    morph_cov: dict[str, dict[str, str]] = {}
    morph_path = root / "docs/morphodict/COVERAGE.csv"
    if morph_path.is_file():
        morph_cov = {r["id"]: r for r in read_csv(morph_path)}

    evidence_rows: list[dict[str, object]] = []
    lexical_anchors: dict[str, dict[str, object]] = {}
    for row in g1_rows:
        family = str(row.get("family", ""))
        refs = list(family_map.get(family, ()))
        text = (str(row.get("label", "")) + " " + str(row.get("expression", ""))).lower()
        if "future" in text:
            refs.append("ALB-EV-013")
        if "imperative" in text or "command" in text:
            refs.extend(("ALB-EV-015", "ALB-EV-016"))
        if "optative" in text:
            refs.extend(("ALB-EV-017", "ALB-EV-018"))
        if "admirative" in text:
            refs.extend(("ALB-EV-019", "ALB-EV-020"))
        if "question" in text or "wh" in text:
            refs.extend(("ALB-EV-021", "ALB-EV-022"))
        if "adjective" in text or "beautiful" in text:
            refs.extend(("ALB-EV-008", "ALB-EV-009"))

        source_kind = str(row.get("source_kind", ""))
        symbol = str(row.get("source_symbol", ""))
        if source_kind == "dict" and symbol in dict_prov:
            evidence_id = f"DICT-PROV:{symbol}"
            refs.append(evidence_id)
            p = dict_prov[symbol]
            lexical_anchors[evidence_id] = {
                "evidence_id": evidence_id,
                "source": "docs/dictionary/DictSqi_provenance.tsv",
                "key": symbol,
                "status": p.get("validation_status", ""),
                "details": f"{p.get('sources','')} | {p.get('source_details','')}",
                "automatic_verdict_permission": "false",
            }
        elif source_kind == "morphodict" and symbol in morph_cov:
            evidence_id = f"MORPH-COV:{symbol}"
            refs.append(evidence_id)
            p = morph_cov[symbol]
            lexical_anchors[evidence_id] = {
                "evidence_id": evidence_id,
                "source": "docs/morphodict/COVERAGE.csv",
                "key": symbol,
                "status": p.get("quality", ""),
                "details": f"{p.get('source','')} | {p.get('expr','')} | {p.get('note','')}",
                "automatic_verdict_permission": "false",
            }

        refs = list(dict.fromkeys(refs))
        evidence_rows.append({
            "case_id": str(row.get("case_id", "")),
            "scenario_id": str(row.get("scenario_id", "")),
            "family": family,
            "candidate_evidence_refs": ";".join(refs),
            "policy": "candidate_only_not_a_verdict",
        })

    write_csv(
        cert / "evidence/g1_case_evidence_candidates.tsv",
        evidence_rows,
        ["case_id", "scenario_id", "family", "candidate_evidence_refs", "policy"],
    )
    write_csv(
        cert / "evidence/lexical_provenance_anchors.tsv",
        list(lexical_anchors.values()),
        ["evidence_id", "source", "key", "status", "details", "automatic_verdict_permission"],
    )

def lint_artifacts(root: Path) -> list[dict[str,str]]:
    findings: list[dict[str,str]] = []
    def add(sev: str, code: str, message: str) -> None: findings.append({"severity":sev,"code":code,"message":message})
    cert = root / "validation/certification"
    campaigns = {}
    current_lock = project_source_lock(root)
    for level, expected in (("g1",569),("g2",5000),("g3",20000)):
        p = cert / "campaigns" / level / "case_ledger.tsv"
        manifest_path = cert / "campaigns" / level / "manifest.json"
        if not p.exists(): add("ERROR","C10-CAMP-001",f"missing {p.relative_to(root)}"); continue
        rows = read_csv(p, delimiter="\t"); campaigns[level]=rows
        if len(rows)!=expected: add("ERROR","C10-CAMP-002",f"{level} expected {expected}, got {len(rows)}")
        if not manifest_path.is_file():
            add("ERROR","C10-CAMP-008",f"missing {manifest_path.relative_to(root)}")
        else:
            try:
                manifest=json.loads(manifest_path.read_text(encoding="utf-8"))
            except Exception as exc:
                add("ERROR","C10-CAMP-009",f"invalid campaign manifest {manifest_path.name}: {exc}")
            else:
                if str(manifest.get("source_lock_sha256","")) != current_lock:
                    add("ERROR","C10-CAMP-010",f"{level} manifest source lock is stale")
                if int(manifest.get("case_count",-1)) != expected:
                    add("ERROR","C10-CAMP-011",f"{level} manifest case_count differs from expected {expected}")
                manifest_ids=set(str(x) for x in manifest.get("scenario_ids",[]))
                ledger_ids=set(str(r.get("scenario_id","")) for r in rows)
                if manifest_ids != ledger_ids:
                    add("ERROR","C10-CAMP-012",f"{level} manifest scenario_ids differ from ledger")
        ids=[r["case_id"] for r in rows]
        if len(ids)!=len(set(ids)): add("ERROR","C10-CAMP-003",f"duplicate case IDs in {level}")
        for r in rows:
            if r.get("verdict") and r["verdict"] not in VERDICTS: add("ERROR","C10-REV-001",f"bad verdict {r['verdict']} for {r['case_id']}")
            if r.get("confidence") and r["confidence"] not in CONFIDENCES: add("ERROR","C10-REV-002",f"bad confidence {r['confidence']} for {r['case_id']}")
            if r.get("gold_promoted","false").lower()=="true" and r.get("verdict") in {"invalid","questionable"}: add("ERROR","C10-GOLD-001",f"nonpassing case golded: {r['case_id']}")
            if r.get("gold_promoted","false").lower()=="true" and r.get("confidence")=="low": add("ERROR","C10-GOLD-002",f"low-confidence case golded: {r['case_id']}")
            if not r.get("language_variety"): add("ERROR","C10-VAR-001",f"missing variety: {r['case_id']}")
            try: owner=int(r.get("owner_conversation") or 0)
            except ValueError: owner=0
            if owner not in range(1,11): add("ERROR","C10-OWN-001",f"bad owner for {r['case_id']}: {r.get('owner_conversation')}")
    if "g1" in campaigns and "g2" in campaigns:
        a={r["case_id"] for r in campaigns["g1"]}; b={r["case_id"] for r in campaigns["g2"]}
        if not a.issubset(b): add("ERROR","C10-CAMP-004","G2 is not a superset of G1")
    if "g2" in campaigns and "g3" in campaigns:
        a={r["case_id"] for r in campaigns["g2"]}; b={r["case_id"] for r in campaigns["g3"]}
        if not a.issubset(b): add("ERROR","C10-CAMP-005","G3 is not a superset of G2")
    p = cert / "parity/english_parity_functions.csv"
    if p.exists():
        for r in read_csv(p):
            if r["status"] not in PARITY_STATUSES: add("ERROR","C10-PAR-001",f"bad parity status {r['status']}")
            if r["status"]=="linguistically_not_applicable" and not r.get("rationale"): add("ERROR","C10-PAR-002",f"N/A lacks rationale {r['signature_id']}")
    else: add("ERROR","C10-PAR-003","missing parity matrix")
    # Validate generated scenario registration, CASE identity and input hashes.
    generated_scenarios=sorted((root/"validation/scenarios").glob("alb-c10-*.gfs"))
    project=tomllib.loads((root/"project.toml").read_text(encoding="utf-8"))
    required=list(project.get("validation",{}).get("required_scenarios",[]))
    optional=list(project.get("validation",{}).get("optional_scenarios",[]))
    generated_ids=[p.stem for p in generated_scenarios]
    if len(required)!=52: add("ERROR","C10-SCEN-010",f"required baseline scenarios changed: expected 52, got {len(required)}")
    if len(optional)!=79: add("ERROR","C10-SCEN-011",f"expected 79 generated optional scenarios, got {len(optional)}")
    if set(optional)!=set(generated_ids): add("ERROR","C10-SCEN-012","project optional scenario registry differs from generated C10 scripts")
    if "g3" in campaigns:
        expected_generated={r["case_id"] for r in campaigns["g3"] if str(r.get("scenario_id","")).startswith("alb-c10-")}
        observed_generated=set()
        for scen in generated_scenarios:
            observed_generated.update(cid for cid,_,_ in parse_case_markers(scen))
        if observed_generated!=expected_generated:
            add("ERROR","C10-SCEN-013",f"generated scenario CASE set differs from G3 ledger: observed={len(observed_generated)} expected={len(expected_generated)}")
        detailed=[r for r in campaigns["g3"] if r.get("family")=="morphology-detail"]
        if len(detailed)!=15000: add("ERROR","C10-CAMP-006",f"G3 detailed morphology expected 15000, got {len(detailed)}")
        if any(r.get("provenance_status")=="compile-safe-placeholder" for r in detailed): add("ERROR","C10-CAMP-007","G3 protected detailed morphology includes compile-safe placeholder")
    input_re = re.compile(r"^-- GF_WORDBENCH_INPUT_SHA256 ([0-9a-f]{64}) (.+)$")
    for scen in generated_scenarios:
        for line in scen.read_text(encoding="utf-8").splitlines():
            m=input_re.match(line)
            if not m: continue
            path=root/m.group(2)
            if not path.is_file(): add("ERROR","C10-SCEN-001",f"missing input {m.group(2)} for {scen.name}")
            elif sha256_file(path)!=m.group(1): add("ERROR","C10-SCEN-002",f"input hash mismatch {m.group(2)} for {scen.name}")
    # G1 evidence-candidate coverage: every baseline CASE must have at least one
    # review anchor, but candidate evidence must never imply an automatic verdict.
    evidence_map=cert/"evidence/g1_case_evidence_candidates.tsv"
    if not evidence_map.is_file():
        add("ERROR","C10-EVID-001","missing G1 case evidence candidate map")
    elif "g1" in campaigns:
        ev_rows=read_csv(evidence_map,delimiter="\t")
        ev_by_id={r.get("case_id",""):r for r in ev_rows}
        g1_ids={r.get("case_id","") for r in campaigns["g1"]}
        if set(ev_by_id) != g1_ids:
            add("ERROR","C10-EVID-002",f"G1 evidence map CASE set differs from G1 ledger: observed={len(ev_by_id)} expected={len(g1_ids)}")
        missing_refs=[cid for cid in sorted(g1_ids) if not str(ev_by_id.get(cid,{}).get("candidate_evidence_refs","")).strip()]
        if missing_refs:
            add("ERROR","C10-EVID-003",f"G1 CASEs without candidate evidence anchors: {missing_refs[:10]}")
    for ev_file in (cert/"evidence/linguistic_reference_claims.tsv", cert/"evidence/lexical_provenance_anchors.tsv"):
        if ev_file.is_file():
            for r in read_csv(ev_file,delimiter="\t"):
                if str(r.get("automatic_verdict_permission","false")).lower() != "false":
                    add("ERROR","C10-EVID-004",f"reference evidence may not auto-assign verdicts: {r.get('evidence_id','')}")

    promo_dir=cert/"reviews/gold_promotions"
    for gold in sorted((root/"validation/gold").glob("*.gold")):
        meta=promo_dir/f"{gold.stem}.json"
        if not meta.is_file(): add("ERROR","C10-GOLD-010",f"gold lacks C10 promotion metadata: {gold.name}")
        else:
            try: m=json.loads(meta.read_text(encoding="utf-8"))
            except Exception as exc: add("ERROR","C10-GOLD-011",f"bad promotion metadata {meta.name}: {exc}"); continue
            if m.get("output_sha256") != sha256_file(gold): add("ERROR","C10-GOLD-012",f"gold hash differs from promotion record: {gold.name}")
            if not m.get("decision_ref"): add("ERROR","C10-GOLD-013",f"gold promotion lacks decision: {gold.name}")
            diff_rel=m.get("diff_path","")
            diff_path=root/diff_rel if diff_rel else None
            if not diff_path or not diff_path.is_file(): add("ERROR","C10-GOLD-014",f"gold promotion lacks stored diff: {gold.name}")
            elif m.get("diff_sha256") != sha256_file(diff_path): add("ERROR","C10-GOLD-015",f"gold diff hash mismatch: {gold.name}")
    if not any(x["severity"]=="ERROR" for x in findings): add("INFO","C10-OK-000","all blocking C10 consistency checks passed")
    return findings




def merge_review_evidence(root: Path, level: str, base_rows: Sequence[dict[str, object]]) -> list[dict[str, object]]:
    level=level.lower()
    review_path=root/f"validation/certification/reviews/{level}_reviewed.tsv"
    merged=[dict(r) for r in base_rows]
    by_id={str(r.get("case_id","")):r for r in merged}
    if review_path.is_file():
        for rr in read_csv(review_path,delimiter="\t"):
            cid=rr.get("case_id","")
            if cid not in by_id:
                raise ValueError(f"recorded review CASE {cid} is not in {level.upper()} campaign")
            target=by_id[cid]
            # Review evidence may replace execution/review fields but never campaign identity/ownership.
            for key in ("run_id","source_lock_sha256","script_sha256","normalization_version","execution_status",
                        "scenario_output_sha256","case_output_sha256","output_text","language_variety","verdict","confidence",
                        "rationale","evidence_refs","reviewer_kind","reviewer_name","reviewer_model","reviewed_at","bug_id",
                        "gold_eligible","decision_ref"):
                if key in rr:
                    target[key]=rr.get(key,"")
    promo_dir=root/"validation/certification/reviews/gold_promotions"
    if promo_dir.is_dir():
        by_case={str(r.get("case_id","")):r for r in merged}
        for meta_path in sorted(promo_dir.glob("*.json")):
            meta=json.loads(meta_path.read_text(encoding="utf-8"))
            for cid in meta.get("case_ids",[]):
                row=by_case.get(str(cid))
                if row is None: continue
                if str(row.get("source_lock_sha256","")) == str(meta.get("source_lock_sha256","")) and str(row.get("scenario_output_sha256","")) == str(meta.get("output_sha256","")):
                    row["gold_promoted"]="true"
                    row["gold_path"]=f"validation/gold/{meta.get('scenario_id')}.gold"
                    row["decision_ref"]=meta.get("decision_ref","")
    return merged


def record_review_ledger(root: Path, level: str, rows: Sequence[dict[str, object]]) -> Path:
    level=level.lower()
    if level not in {"g1","g2","g3"}: raise ValueError(level)
    campaign=read_csv(root/f"validation/certification/campaigns/{level}/case_ledger.tsv",delimiter="\t")
    base={r["case_id"]:r for r in campaign}
    seen=set()
    for r in rows:
        cid=str(r.get("case_id",""))
        if cid not in base: raise ValueError(f"CASE {cid} is not part of {level.upper()}")
        if cid in seen: raise ValueError(f"duplicate reviewed CASE {cid}")
        seen.add(cid)
        if str(r.get("scenario_id","")) != str(base[cid].get("scenario_id","")): raise ValueError(f"scenario mismatch for {cid}")
    findings=validate_review_rows(rows,require_all_executed_reviewed=False)
    errors=[f for f in findings if f["severity"]=="ERROR"]
    if errors: raise ValueError("invalid review ledger: "+"; ".join(x["message"] for x in errors[:8]))
    out=root/f"validation/certification/reviews/{level}_reviewed.tsv"
    write_csv(out,rows,CASE_FIELDS)
    write_json(root/f"validation/certification/reviews/{level}_review_manifest.json",{
        "schema":"albanian-c10-recorded-review-v1","campaign_level":level.upper(),"row_count":len(rows),
        "working_tree_lock_sha256":project_source_lock(root),"language_variety":"Standard Albanian",
        "reviewed_case_ids_sha256":sha256_text("\n".join(sorted(seen))+"\n"),
    })
    return out


def record_structural_evidence(root: Path, evidence: dict[str, object]) -> Path:
    required=("run_id","gf_version","wordbench_version","working_tree_lock_sha256","targets_pass","targets_total",
              "required_scenarios_pass","required_scenarios_total","blocking_warnings","evidence_ref")
    missing=[k for k in required if k not in evidence]
    if missing: raise ValueError(f"structural evidence missing fields: {missing}")
    if str(evidence["gf_version"])!="3.12": raise ValueError("GF version must be 3.12 for current baseline")
    if str(evidence["wordbench_version"])!="1.3.4": raise ValueError("Wordbench version must be 1.3.4 for current baseline")
    if str(evidence["working_tree_lock_sha256"])!=project_source_lock(root): raise ValueError("structural evidence working-tree lock is stale")
    payload={"schema":"albanian-c10-structural-evidence-v1",**evidence}
    out=root/"validation/certification/evidence/structural_run.json"
    write_json(out,payload)
    return out


def refresh_evidence_artifacts(root: Path) -> tuple[dict[str, object], list[dict[str,str]]]:
    cert=root/"validation/certification"
    bases={lvl:read_csv(cert/f"campaigns/{lvl}/case_ledger.tsv",delimiter="\t") for lvl in ("g1","g2","g3")}
    effective={lvl:merge_review_evidence(root,lvl,rows) for lvl,rows in bases.items()}
    for lvl,rows in effective.items():
        write_csv(cert/f"reviews/{lvl}_effective.tsv",rows,CASE_FIELDS)
    parity=read_csv(cert/"parity/english_parity_functions.csv")
    paradigms=read_csv(cert/"coverage/paradigm_registry.csv")
    tables=coverage_tables(effective["g3"],parity)
    write_csv(cert/"coverage/coverage_by_phenomenon.csv",tables["phenomenon"],["key","cases","executed","reviewed","valid","valid_variant","questionable","invalid","golded"])
    write_csv(cert/"coverage/coverage_by_category.csv",tables["category"],["key","cases","executed","reviewed","valid","valid_variant","questionable","invalid","golded"])
    write_csv(cert/"coverage/coverage_morphology_cells.csv",tables["morphology_cells"],["key","cases","executed","reviewed","valid","valid_variant","questionable","invalid","golded"])
    write_csv(cert/"coverage/coverage_by_abstract_function.csv",tables["abstract_function"],["signature_id","module","symbol","parity_status","linguistic_certification","owner_conversation"])
    (cert/"coverage/coverage_summary.md").write_text(render_coverage_summary(tables),encoding="utf-8")
    dashboard,md=generate_dashboard(root,effective["g1"],effective["g2"],effective["g3"],parity,paradigms)
    write_json(cert/"dashboard/CURRENT.json",dashboard); (cert/"dashboard/CURRENT.md").write_text(md,encoding="utf-8")
    findings=lint_artifacts(root)
    write_json(cert/"dashboard/LINT.json",{"schema":"albanian-c10-lint-v1","findings":findings})
    packet,pmd=release_packet(root,dashboard,findings)
    write_json(cert/"release/CURRENT_RELEASE_PACKET.json",packet); (cert/"release/CURRENT_RELEASE_PACKET.md").write_text(pmd,encoding="utf-8")
    return dashboard,findings


def render_parity_markdown(parity: Sequence[dict[str, object]], module_parity: Sequence[dict[str, object]], benchmark: dict[str, object] | None = None) -> str:
    counts=Counter(str(r.get("status","")) for r in parity)
    lines=["# English / common-RGL parity dashboard","",
           "English is used as a coverage and maturity benchmark, not as a linguistic template for Albanian.","",
           "## Function inventory","","| Status | Count |","|---|---:|"]
    for status in sorted(PARITY_STATUSES):
        lines.append(f"| {status} | {counts.get(status,0)} |")
    lines += ["","All function rows start with linguistic certification `needs_review` until hash-bound Albanian evidence closes them.","",
              "## Module inventory","","| Module | Status | Owner | Rationale |","|---|---|---:|---|"]
    for r in module_parity:
        lines.append(f"| {r.get('module','')} | {r.get('status','')} | C{r.get('owner_conversation','')} | {r.get('rationale','')} |")
    if benchmark:
        m=benchmark.get("metrics",{})
        lines += ["","## Supplied-snapshot depth benchmark","","| Metric | Albanian | English |","|---|---:|---:|"]
        labels={
            "dict_abstract_functions":"Dict abstract functions",
            "morphodict_lemgrams":"MorphoDict lemgrams",
            "language_gf_files":"Language `.gf` files",
            "dict_concrete_bytes":"Dict concrete bytes",
            "morphodict_concrete_bytes":"MorphoDict concrete bytes",
            "paradigms_bytes":"Paradigms bytes",
            "extend_bytes":"Extend bytes",
        }
        for key,label in labels.items():
            if key in m:
                lines.append(f"| {label} | {m[key].get('albanian','')} | {m[key].get('english','')} |")
        note=benchmark.get("documented_reference_notes",{})
        if note:
            lines += ["",f"> Provenance discrepancy retained: prior C10 documentation records English MorphoDict as **{note.get('english_morphodict_lemgrams_in_prior_c10_docs')}**, while the supplied `gf-rgl-master` snapshot contains **{note.get('snapshot_count')}** declarations by the same counter. Snapshot evidence controls executable comparison until reconciled."]
    return "\n".join(lines)+"\n"


def render_coverage_summary(tables: dict[str, list[dict[str, object]]]) -> str:
    lines=["# C10 coverage summary","",
           "Coverage states are evidence-bound. `executed_only` is not certification and blank review counts remain explicitly unreviewed.",""]
    for title,key in (("Phenomena","phenomenon"),("Categories","category"),("Morphological cells","morphology_cells")):
        rows=tables.get(key,[])
        lines += [f"## {title}","","| Key | CASEs | Executed | Reviewed | Valid | Variant | Questionable | Invalid | Golded |","|---|---:|---:|---:|---:|---:|---:|---:|---:|"]
        for r in rows:
            lines.append(f"| {r.get('key','')} | {r.get('cases',0)} | {r.get('executed',0)} | {r.get('reviewed',0)} | {r.get('valid',0)} | {r.get('valid_variant',0)} | {r.get('questionable',0)} | {r.get('invalid',0)} | {r.get('golded',0)} |")
        lines.append("")
    return "\n".join(lines)


def generate_bug_handoffs(root: Path, reviewed_cases: Sequence[dict[str, object]], *, overwrite: bool = False) -> list[dict[str, object]]:
    """Materialize one evidence-bound handoff for each invalid/questionable CASE.

    C10 does not invent an expected form when the evidence only establishes that the
    observed output is doubtful. In that situation expected_constraint remains explicit.
    """
    out_dir=root/"validation/certification/bugs/handoffs"
    out_dir.mkdir(parents=True,exist_ok=True)
    generated=[]
    for r in reviewed_cases:
        verdict=str(r.get("verdict", ""))
        if verdict not in {"invalid","questionable"}:
            continue
        cid=str(r.get("case_id",""))
        if not cid:
            raise ValueError("reviewed bug CASE lacks case_id")
        try: owner=int(str(r.get("owner_conversation") or 0))
        except ValueError: owner=0
        if owner not in range(1,10):
            raise ValueError(f"CASE {cid} cannot be handed off: owner must be C1-C9, got {owner}")
        bug_id=str(r.get("bug_id") or f"C10-BUG-{cid}")
        payload={
            "schema":"albanian-c10-bug-handoff-v1",
            "bug_id":bug_id,
            "case_id":cid,
            "campaign_level":r.get("campaign_level",""),
            "owner_conversation":owner,
            "owner_domain":r.get("owner_domain",""),
            "source_lock_sha256":r.get("source_lock_sha256",""),
            "run_id":r.get("run_id",""),
            "language_variety":r.get("language_variety","Standard Albanian"),
            "scenario_id":r.get("scenario_id",""),
            "script_sha256":r.get("script_sha256",""),
            "case_output_sha256":r.get("case_output_sha256",""),
            "scenario_output_sha256":r.get("scenario_output_sha256",""),
            "expression":r.get("expression",""),
            "observed_output":r.get("output_text",""),
            "verdict":verdict,
            "confidence":r.get("confidence",""),
            "rationale":r.get("rationale",""),
            "evidence_refs":r.get("evidence_refs",""),
            "expected_output":"",
            "expected_constraint":"Resolve against cited Albanian evidence; C10 intentionally does not invent an unattested target form.",
            "regression_test_required":True,
            "gold_impact":"blocked_until_revalidated",
            "status":"open",
        }
        path=out_dir/f"{bug_id}.json"
        if path.exists() and not overwrite:
            existing=json.loads(path.read_text(encoding="utf-8"))
            if canonical_json(existing)!=canonical_json(payload):
                raise FileExistsError(f"handoff exists with different content: {path}")
        else:
            write_json(path,payload)
        generated.append(payload)
    index_rows=[]
    for x in generated:
        index_rows.append({k:x.get(k,"") for k in ("bug_id","case_id","campaign_level","owner_conversation","owner_domain","scenario_id","verdict","confidence","status")})
    write_csv(root/"validation/certification/bugs/HANDOFF_INDEX.tsv",index_rows,["bug_id","case_id","campaign_level","owner_conversation","owner_domain","scenario_id","verdict","confidence","status"])
    return generated


def generate_dashboard(root: Path, g1: Sequence[dict[str, object]], g2: Sequence[dict[str, object]], g3: Sequence[dict[str, object]],
                       parity: Sequence[dict[str, object]], paradigms: Sequence[dict[str, object]]) -> tuple[dict[str,object], str]:
    def stats(rows: Sequence[dict[str, object]]) -> dict[str,int]:
        v=Counter(str(r.get("verdict","")) for r in rows if r.get("verdict"))
        return {"cases":len(rows),"executed":sum(str(r.get("execution_status"))=="executed" for r in rows),
                "reviewed":sum(str(r.get("verdict")) in VERDICTS for r in rows),
                "valid":v["valid"],"valid_variant":v["valid_variant"],"questionable":v["questionable"],"invalid":v["invalid"],
                "golded":sum(str(r.get("gold_promoted")).lower()=="true" for r in rows)}
    campaign_stats={"G1":stats(g1),"G2":stats(g2),"G3":stats(g3)}
    parity_counts=Counter(str(r["status"]) for r in parity)
    linguistic_parity_counts=Counter(str(r.get("linguistic_certification","")) for r in parity)
    paradigm_tested=sum(str(r.get("test_status","")) not in {"","untested","not_executed"} for r in paradigms)
    paradigm_golded=sum(str(r.get("gold_status","")) in {"golded","pass","passing"} for r in paradigms)

    structural_path=root/"validation/certification/evidence/structural_run.json"
    structural=None; structural_pass=False; structural_stale=False
    if structural_path.is_file():
        structural=json.loads(structural_path.read_text(encoding="utf-8"))
        structural_stale=str(structural.get("working_tree_lock_sha256","")) != project_source_lock(root)
        structural_pass=(not structural_stale and str(structural.get("gf_version"))=="3.12" and
                         str(structural.get("wordbench_version"))=="1.3.4" and
                         int(structural.get("targets_pass",-1))==int(structural.get("targets_total",-2)) and
                         int(structural.get("targets_total",0))>=58 and
                         int(structural.get("required_scenarios_pass",-1))==int(structural.get("required_scenarios_total",-2)) and
                         int(structural.get("required_scenarios_total",0))>=52 and
                         int(structural.get("blocking_warnings",1))==0)

    def reviewed_clean(st: dict[str,int], expected: int) -> bool:
        return st["cases"]>=expected and st["reviewed"]==st["cases"] and st["questionable"]==0 and st["invalid"]==0
    r0=structural_pass
    # R1 additionally requires all G1 CASEs to be protected by promoted scenario golds.
    r1=r0 and reviewed_clean(campaign_stats["G1"],569) and campaign_stats["G1"]["golded"]==campaign_stats["G1"]["cases"]
    r2=r1 and reviewed_clean(campaign_stats["G2"],5000) and paradigm_tested==len(paradigms) and len(paradigms)>0
    r3=r2 and reviewed_clean(campaign_stats["G3"],20000)
    parity_core_closed=(parity_counts.get("missing",0)==0 and parity_counts.get("needs_review",0)==0 and
                        linguistic_parity_counts.get("needs_review",0)==0)
    r4=r3 and parity_core_closed
    maturity="pre-R0 evidence-backed"
    if r0: maturity="R0"
    if r1: maturity="R1"
    if r2: maturity="R2"
    if r3: maturity="R3"
    if r4: maturity="R4_candidate"

    data={
        "schema":"albanian-c10-dashboard-v2", "language_variety":"Standard Albanian",
        "baseline_archive_sha256":BASELINE_ARCHIVE_SHA256, "working_tree_lock_sha256":project_source_lock(root),
        "gf_required_version":"3.12", "wordbench_required_version":"1.3.4",
        "declared_baseline":{"tag":"albanian-s02-green-20260925","targets":"58/58","scenarios":"52/52"},
        "evidence_backed_archived_run":{"targets":"56/58 strict","scenarios":"52/52","current_fix_rerun":"not_archived_in_supplied_snapshot"},
        "structural_evidence":{"present":structural is not None,"pass":structural_pass,"stale":structural_stale,"record":structural},
        "campaigns":campaign_stats,
        "parity":dict(parity_counts), "parity_linguistic":dict(linguistic_parity_counts),
        "public_paradigm_entries":len(paradigms),"public_paradigm_tested":paradigm_tested,"public_paradigm_golded":paradigm_golded,
        "gate_evidence":{"R0":r0,"R1":r1,"R2":r2,"R3":r3,"R4_candidate":r4},
        "development_state":"S05 CONTRACTS_READY", "maturity":maturity,
        "certification_status":"ESTABLISHED_FOR_DECLARED_SCOPE" if r4 else "NOT_ESTABLISHED",
    }
    md=["# C10 maturity dashboard","",f"- Development state: **{data['development_state']}**",f"- Evidence-backed maturity: **{data['maturity']}**",f"- Linguistic certification: **{data['certification_status']}**",f"- Working-tree lock: `{data['working_tree_lock_sha256']}`","",
        "## Gates","","| Gate | Evidence status |","|---|---|" ]
    for gate in ("R0","R1","R2","R3","R4_candidate"):
        md.append(f"| {gate} | {'PASS' if data['gate_evidence'][gate] else 'NOT ESTABLISHED'} |")
    md += ["","## Campaigns","","| Campaign | CASEs | Executed | Reviewed | Valid | Variant | Questionable | Invalid | Golded |","|---|---:|---:|---:|---:|---:|---:|---:|---:|"]
    for lvl in ("G1","G2","G3"):
        st=data["campaigns"][lvl]; md.append(f"| {lvl} | {st['cases']} | {st['executed']} | {st['reviewed']} | {st['valid']} | {st['valid_variant']} | {st['questionable']} | {st['invalid']} | {st['golded']} |")
    md += ["","## Structural baseline","", "- Declared project baseline: 58/58 + 52/52.", "- Last archived evidence in supplied snapshot: 56/58 strict + 52/52; lock-safe fix present, fresh GF 3.12 evidence must be imported to establish R0.", f"- Current imported structural evidence: **{'PASS' if structural_pass else 'NOT ESTABLISHED'}**.", "- Scenario execution is never converted into linguistic certification.","",
           "## English/common RGL parity inventory","", "| Status | Functions |","|---|---:|"]
    for k in sorted(parity_counts): md.append(f"| {k} | {parity_counts[k]} |")
    md += ["",f"Public paradigm signatures inventoried: **{len(paradigms)}**; test evidence recorded for **{paradigm_tested}**.",""]
    return data, "\n".join(md)

def release_packet(root: Path, dashboard: dict[str,object], lint_findings: Sequence[dict[str,str]]) -> tuple[dict[str,object], str]:
    errors=[x for x in lint_findings if x["severity"]=="ERROR"]
    gates=dashboard.get("gate_evidence",{})
    reasons={
        "R0_structure":"Requires fresh GF 3.12 / Wordbench 1.3.4 structural evidence bound to this working-tree lock, all expected targets/scenarios passing, zero blocking warnings.",
        "R1_initial_review":"Requires R0 plus 569/569 reviewed, no invalid/questionable in scope, and all G1 CASEs protected by explicit promoted golds.",
        "R2_core":"Requires R1 plus 5,000/5,000 reviewed and every public ParadigmsSqi signature carrying test evidence.",
        "R3_lexical_stress":"Requires R2 plus 20,000/20,000 reviewed with no invalid/questionable in the declared protected scope.",
        "R4_parity_candidate":"Requires R3 plus complete English/common-RGL parity closure and no core needs_review/missing in release scope.",
    }
    mapping=(("R0_structure","R0"),("R1_initial_review","R1"),("R2_core","R2"),("R3_lexical_stress","R3"),("R4_parity_candidate","R4_candidate"))
    gate_rows={name:{"status":"pass" if bool(gates.get(key)) else "not_executed","reason":"Evidence satisfies gate." if bool(gates.get(key)) else reasons[name]} for name,key in mapping}
    release_candidate=bool(gates.get("R4_candidate")) and not errors
    packet={
        "schema":"albanian-c10-release-evidence-v1", "source_lock_sha256":dashboard["working_tree_lock_sha256"],
        "language_variety":"Standard Albanian", "gf_version_required":"3.12", "wordbench_version_required":"1.3.4",
        "development_state":"S05 CONTRACTS_READY", "release_candidate":release_candidate,
        "maturity":dashboard.get("maturity","pre-R0 evidence-backed"),
        "gates":gate_rows,
        "consistency_lint":{"errors":len(errors),"status":"pass" if not errors else "fail"},
        "known_limitations":[
            "The supplied baseline archive does not contain a fresh post-fix 58/58 GF 3.12 run.",
            "The supplied snapshot does not contain normalized outputs for all 569 review CASEs.",
            "No linguistic verdict or gold is fabricated by bootstrap or validate.",
            "Core grammar modules are outside C10 ownership and are not modified by this implementation.",
        ],
    }
    md=["# C10 release evidence packet","",f"- Source lock: `{packet['source_lock_sha256']}`",f"- Development state: **{packet['development_state']}**",f"- Evidence-backed maturity: **{packet['maturity']}**",f"- Release candidate: **{'YES' if release_candidate else 'NO'}**","", "## Gates","", "| Gate | Status | Reason |","|---|---|---|"]
    for k,v in packet["gates"].items(): md.append(f"| {k} | {v['status']} | {v['reason']} |")
    md += ["","## Consistency",f"- Linter: **{packet['consistency_lint']['status']}**, {packet['consistency_lint']['errors']} blocking error(s).","","## Certification boundary"]
    md += [f"- {x}" for x in packet["known_limitations"]]
    md += [""]
    return packet, "\n".join(md)

