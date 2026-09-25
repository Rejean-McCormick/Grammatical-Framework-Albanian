#!/usr/bin/env python3
"""Build the MorphoDictSqi MAX C2 deliverables from locked local sources.

The build is conservative by design:
- existing non-placeholder entries are preserved byte-semantically;
- compile-safe N/A/V placeholders are promoted only when an existing numbered
  Albanian morphology class reproduces *all* recorded Tosk forms and known noun
  gender; the current smart-dispatch class is preferred when it matches;
- if smart dispatch does not match, an alternative class is accepted only when
  it is the unique numbered class satisfying the same evidence;
- unresolved entries are removed from the active dictionary and recorded as
  blocked/source-conflict cases.  No fallback inflection is invented.

This script performs static source/evidence reconciliation.  It does not claim
GF 3.12 compilation or C6 linguistic certification; those are external gates.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import re
import sys
import unicodedata
from collections import Counter, defaultdict
from datetime import date
from pathlib import Path
from typing import Any

import yaml

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(HERE))
from morpho_static import MorphoInspector, form_matches  # noqa: E402

GF_DIR = ROOT / "AlbanianSQI/GF/lib/src/morphodict"
ALB_DIR = ROOT / "AlbanianSQI/GF/lib/src/albanian"
DOC = ROOT / "docs/morphodict"
RES = ROOT / "resources/morphodict"
VAL = ROOT / "validation/morphodict"
DICT_RES = ROOT / "resources/dictionary"

TODAY = "2026-09-25"
CAMPAIGN = "CMP-C2-MAX-20260925"


def sha256_bytes(b: bytes) -> str:
    return hashlib.sha256(b).hexdigest()


def sha256_file(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def jdump(obj: Any) -> str:
    return json.dumps(obj, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def jsonl_write(path: Path, rows: list[dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="\n") as f:
        for row in rows:
            f.write(jdump(row) + "\n")


def read_coverage() -> list[dict[str, str]]:
    with (DOC / "COVERAGE.csv").open(encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def read_tosk() -> list[dict[str, str]]:
    with (RES / "TOSK_REFERENCE_LEMMAS.tsv").open(encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f, delimiter="\t"))


def parse_abs() -> tuple[list[str], dict[str, str]]:
    text = (GF_DIR / "MorphoDictSqiAbs.gf").read_text(encoding="utf-8")
    order: list[str] = []
    cats: dict[str, str] = {}
    for m in re.finditer(r"^\s{2}(.+?)\s*:\s*([A-Za-z0-9]+)\s*;\s*$", text, re.M):
        order.append(m.group(1))
        cats[m.group(1)] = m.group(2)
    return order, cats


def parse_lins() -> dict[str, str]:
    text = (GF_DIR / "MorphoDictSqi.gf").read_text(encoding="utf-8")
    out: dict[str, str] = {}
    for m in re.finditer(r"^\s{2}([^\s=]+)\s*=\s*(.+?)\s*;\s*$", text, re.M):
        out[m.group(1)] = m.group(2).strip()
    return out


def observed_forms(tosk_row: dict[str, str]) -> list[str]:
    return [unicodedata.normalize("NFC", x.strip()) for x in tosk_row["observed_forms"].split(",") if x.strip()]


def class_matches(inspector: MorphoInspector, row: dict[str, str], trow: dict[str, str], cls: str | None) -> bool:
    if not cls:
        return False
    result = inspector.evaluate_class(cls, row["base"])
    if result is None:
        return False
    forms = observed_forms(trow)
    if not all(form_matches(x, result.surfaces) for x in forms):
        return False
    if row["cat"] == "N":
        required = {"masculine": "Masc", "feminine": "Fem"}.get(trow.get("gender", ""))
        if required and result.gender and required != result.gender:
            return False
    return True


def resolve_placeholders(rows: list[dict[str, str]], tosk_by_key: dict[tuple[str, str], dict[str, str]], inspector: MorphoInspector):
    resolved: dict[str, dict[str, Any]] = {}
    blocked: dict[str, dict[str, Any]] = {}
    for row in rows:
        if row["quality"] != "compile-safe-placeholder":
            continue
        key = (row["base"], row["cat"])
        trow = tosk_by_key.get(key)
        if not trow:
            blocked[row["id"]] = {
                "reason": "BLOCKED_INSUFFICIENT_EVIDENCE",
                "detail": "placeholder has no Tosk evidence row",
                "smart_class": None,
                "matches": [],
            }
            continue
        smart = inspector.smart_route(row["cat"], row["base"])
        if class_matches(inspector, row, trow, smart):
            resolved[row["id"]] = {
                "class": smart,
                "method": "smart-route-evidence-match",
                "observed_forms": observed_forms(trow),
            }
            continue
        matches = [c for c in inspector.classes_for(row["cat"]) if class_matches(inspector, row, trow, c)]
        if len(matches) == 1:
            resolved[row["id"]] = {
                "class": matches[0],
                "method": "unique-numbered-class-evidence-match",
                "observed_forms": observed_forms(trow),
            }
            continue
        reason = "BLOCKED_INSUFFICIENT_EVIDENCE"
        detail = f"smart={smart or 'none'}; matching numbered classes={len(matches)}"
        # Deterministic conflict flags for evidence rows whose observed base differs visibly.
        formset = set(observed_forms(trow))
        base = row["base"]
        if row["cat"] in {"N", "A"} and formset and not any(base == f or base.casefold() == f.casefold() for f in formset):
            known_orthography = {
                "shetëror_A", "ndërsë_N", "pranvëre_N", "svetigradas_N"
            }
            if row["id"] in known_orthography:
                reason = "BLOCKED_SOURCE_CONFLICT"
                detail = "lemma/orthography in source row conflicts with observed form family; manual source review required"
        if row["id"] == "ndarje_N":
            reason = "BLOCKED_SOURCE_CONFLICT"
            detail = "recorded masculine gender conflicts with all evidence-matching classes, which are feminine"
        blocked[row["id"]] = {
            "reason": reason,
            "detail": detail,
            "smart_class": smart,
            "matches": matches,
            "observed_forms": observed_forms(trow),
        }
    return resolved, blocked


def concrete_prelude() -> str:
    # This prelude is intentionally explicit.  It is independent of the previous
    # generated MorphoDict body and therefore supports deterministic rebuilds.
    return '''--# -path=.:../albanian:alltenses
-- MorphoDictSqi MAX. Generated from machine-readable lemgram records.
-- C2 policy: one morphological lemgram per table; no semantic valence duplication.
concrete MorphoDictSqi of MorphoDictSqiAbs =
  CatSqi [N,A,V,Adv,Prep,PN,Interj,Conj,Subj,Det,IDet,IAdv,IP,NP,Pron,Quant,IQuant,Predet] **
  open Prelude, ParadigmsSqi, (I = IrregSqi), (SN = StructuralSqiNominal), (R = ResSqi) in {

flags coding = utf8 ;
flags optimize = all_subs ;

oper
  forceGender : N -> Gender -> N = \\n,gen -> n ** {g = gen} ;
  invariantV : Str -> V = \\x -> irregV x x x x x x x x x ;

  appleNForms : NForms = {
    indefNomSg="mollë"; indefNomPl="mollë"; indefAccSg="mollë"; indefAccPl="mollë";
    indefDatSg="molle"; indefDatPl="mollëve"; indefAblSg="molle"; indefAblPl="mollësh";
    defNomSg="molla"; defNomPl="mollët"; defAccSg="mollën"; defAccPl="mollët";
    defDatSg="mollës"; defDatPl="mollëve"; defAblSg="mollës"; defAblPl="mollëve"
  } ;
  bookNForms : NForms = {
    indefNomSg="libër"; indefNomPl="libra"; indefAccSg="libër"; indefAccPl="libra";
    indefDatSg="libri"; indefDatPl="librave"; indefAblSg="libri"; indefAblPl="librash";
    defNomSg="libri"; defNomPl="librat"; defAccSg="librin"; defAccPl="librat";
    defDatSg="librit"; defDatPl="librave"; defAblSg="librit"; defAblPl="librave"
  } ;
  boyNForms : NForms = {
    indefNomSg="djalë"; indefNomPl="djem"; indefAccSg="djalë"; indefAccPl="djem";
    indefDatSg="djali"; indefDatPl="djemve"; indefAblSg="djali"; indefAblPl="djemsh";
    defNomSg="djali"; defNomPl="djemtë"; defAccSg="djalin"; defAccPl="djemtë";
    defDatSg="djalit"; defDatPl="djemve"; defAblSg="djalit"; defAblPl="djemve"
  } ;
  manNForms : NForms = {
    indefNomSg="burrë"; indefNomPl="burra"; indefAccSg="burrë"; indefAccPl="burra";
    indefDatSg="burri"; indefDatPl="burrave"; indefAblSg="burri"; indefAblPl="burrash";
    defNomSg="burri"; defNomPl="burrat"; defAccSg="burrin"; defAccPl="burrat";
    defDatSg="burrit"; defDatPl="burrave"; defAblSg="burrit"; defAblPl="burrave"
  } ;

lin
'''


def write_gf(active: list[dict[str, Any]]) -> None:
    abs_lines = [
        "-- MorphoDictSqi MAX — generated; one function per active lemgram.",
        "-- Semantic senses and valence distinctions are intentionally collapsed.",
        "abstract MorphoDictSqiAbs =",
        "  Cat [N,A,V,Adv,Prep,PN,Interj,Conj,Subj,Det,IDet,IAdv,IP,NP,Pron,Quant,IQuant,Predet] **",
        "{",
        "fun",
    ]
    abs_lines.extend(f"  {r['id']} : {r['cat']} ;" for r in active)
    abs_lines.append("}")
    (GF_DIR / "MorphoDictSqiAbs.gf").write_text("\n".join(abs_lines) + "\n", encoding="utf-8", newline="\n")

    lines = [concrete_prelude().rstrip("\n")]
    for r in active:
        lines.append(f"  {r['id']} = {r['gf_expression']} ;")
    lines.append("}")
    (GF_DIR / "MorphoDictSqi.gf").write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")


def source_conflict_type(lemgram_id: str) -> str:
    return {
        "shetëror_A": "ORTHOGRAPHY",
        "ndërsë_N": "LEMMA",
        "pranvëre_N": "ORTHOGRAPHY",
        "svetigradas_N": "ORTHOGRAPHY",
        "ndarje_N": "GENDER",
    }.get(lemgram_id, "FORM")


def certification_for(entry: dict[str, Any]) -> str:
    # C2 is the highest level that can be established by this static build.
    # Generic smart constructors remain C1 because the exact resolved branch is
    # not frozen in this campaign; explicit/irregular/structural expressions are C2.
    expr = entry["gf_expression"]
    if entry["quality"] == "evidence-matched-explicit-class":
        return "C2"
    if re.match(r"mk[NAV]\d{3}\s+", expr) or "I." in expr or "irregV " in expr or "mkNFull " in expr or "SN." in expr:
        return "C2"
    if entry["cat"] not in {"N", "A", "V"}:
        return "C2"
    return "C1"


def build_source_records() -> list[dict[str, Any]]:
    return [
        {
            "source_id": "SRC-RGL-CURRENT",
            "kind": "rgl-current",
            "path": "docs/morphodict/RGL_LEXICON_MAPPING.csv",
            "sha256": sha256_file(DOC / "RGL_LEXICON_MAPPING.csv"),
            "license": "project/RGL source",
            "role": "existing Albanian RGL lexical analyses and active lemgram anchors",
            "redistribution": "project source",
        },
        {
            "source_id": "SRC-TOSK-UT",
            "kind": "linguistic-reference",
            "path": "resources/morphodict/TOSK_REFERENCE_LEMMAS.tsv",
            "sha256": sha256_file(RES / "TOSK_REFERENCE_LEMMAS.tsv"),
            "license": "not identified in supplied reference bundle",
            "role": "evidence/review only; no assumption of bulk redistribution rights",
            "redistribution": "derived evidence already present in supplied project; do not expand extraction without licence review",
        },
        {
            "source_id": "SRC-ALBANET-OMW",
            "kind": "lexical-candidate-inventory",
            "path": "resources/dictionary/albanet_unique_pos_lemma_synset.tsv",
            "sha256": sha256_file(DICT_RES / "albanet_unique_pos_lemma_synset.tsv"),
            "license": "CC BY 3.0 per project THIRD_PARTY_NOTICES.md",
            "role": "large lemma/POS candidate universe; does not itself prove inflection",
            "redistribution": "allowed subject to attribution/CC BY terms",
        },
    ]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--apply", action="store_true", help="write the reconciled active GF files and machine-readable artifacts")
    args = ap.parse_args()

    DOC.mkdir(parents=True, exist_ok=True)
    RES.mkdir(parents=True, exist_ok=True)
    VAL.mkdir(parents=True, exist_ok=True)

    baseline_path = RES / "BASELINE_LEMGRAMS_20260925.jsonl"
    if baseline_path.exists():
        baseline = [json.loads(line) for line in baseline_path.read_text(encoding="utf-8").splitlines() if line.strip()]
        baseline.sort(key=lambda r: r["order"])
        rows = [{k: str(r.get(k, "")) for k in ("id","base","cat","quality","source","note")} for r in baseline]
        abs_order = [r["id"] for r in baseline]
        abs_cats = {r["id"]: r["cat"] for r in baseline}
        lin_expr = {r["id"]: r["gf_expression"] for r in baseline}
    else:
        rows = read_coverage()
        abs_order, abs_cats = parse_abs()
        lin_expr = parse_lins()
    old_by_id = {r["id"]: r for r in rows}
    inspector = MorphoInspector(ROOT)
    tosk_rows = read_tosk()
    tosk_by_key = {(r["lemma"], r["category"]): r for r in tosk_rows}
    resolved, blocked = resolve_placeholders(rows, tosk_by_key, inspector)

    active: list[dict[str, Any]] = []
    blocked_rows: list[dict[str, Any]] = []
    for order, ident in enumerate(abs_order):
        old = old_by_id[ident]
        if ident in blocked:
            b = blocked[ident]
            trow = tosk_by_key.get((old["base"], old["cat"]), {})
            blocked_rows.append({
                "id": ident,
                "base": old["base"],
                "cat": old["cat"],
                "status": b["reason"],
                "detail": b["detail"],
                "source": old["source"],
                "observed_forms": ",".join(b.get("observed_forms", [])),
                "smart_class": b.get("smart_class") or "",
                "matching_classes": ",".join(b.get("matches", [])),
                "gender": trow.get("gender", ""),
            })
            continue
        item: dict[str, Any] = {
            "id": ident,
            "base": old["base"],
            "cat": old["cat"],
            "quality": old["quality"],
            "source": old["source"],
            "gf_expression": lin_expr[ident],
            "note": old["note"],
            "order": order,
            "placeholder": False,
        }
        if ident in resolved:
            info = resolved[ident]
            item["gf_expression"] = f'{info["class"]} "{old["base"]}"'
            item["quality"] = "evidence-matched-explicit-class"
            item["note"] = (
                f'Tosk observed forms {", ".join(info["observed_forms"])}; '
                f'{info["class"]} selected by {info["method"]}. '
                "Static evidence match only; GF 3.12 rerun and linguistic review remain required for C6."
            )
            item["resolved_class"] = info["class"]
            item["resolution_method"] = info["method"]
        item["certification_level"] = certification_for(item)
        item["compile_status"] = "requires-post-campaign-gf312-run" if ident in resolved else "declared-baseline-not-reproved-by-this-build"
        active.append(item)

    # Active machine-readable lemgrams.
    lemgrams: list[dict[str, Any]] = []
    for item in active:
        key = (item["base"], item["cat"])
        trow = tosk_by_key.get(key)
        evidence_ids = []
        if trow:
            evidence_ids.append("EVD-TOSK-" + sha256_bytes((item["base"] + "\0" + item["cat"]).encode("utf-8"))[:16])
        lemgrams.append({
            "schema_version": "LGM-SQI-MAX-1",
            "lemgram_id": "LGM-" + item["id"],
            "function_id": item["id"],
            "base": item["base"],
            "category": item["cat"],
            "gf_expression": item["gf_expression"],
            "quality": item["quality"],
            "source_label": item["source"],
            "evidence_ids": evidence_ids,
            "certification_level": item["certification_level"],
            "compile_status": item["compile_status"],
            "placeholder": False,
            "resolved_class": item.get("resolved_class"),
            "table_signature": None,
            "review_record": None,
            "notes": item["note"],
            "order": item["order"],
        })

    evidence: list[dict[str, Any]] = []
    for tr in sorted(tosk_rows, key=lambda r: (r["lemma"].casefold(), r["category"])):
        evid = "EVD-TOSK-" + sha256_bytes((tr["lemma"] + "\0" + tr["category"]).encode("utf-8"))[:16]
        evidence.append({
            "schema_version": "EVD-SQI-MAX-1",
            "evidence_id": evid,
            "source_id": "SRC-TOSK-UT",
            "lemma": tr["lemma"],
            "category": tr["category"],
            "gender": tr["gender"] or None,
            "observed_forms": observed_forms(tr),
            "raw_descriptions": tr["descriptions"],
            "dialect": "standard_tosk",
            "mapping_status": "raw-description-preserved; feature mapping requires reviewed FMAP-1 row",
        })

    # Source universe / candidates.
    candidates: list[dict[str, Any]] = []
    active_key = {(r["base"], r["cat"]): r for r in active}
    blocked_key = {(r["base"], r["cat"]): r for r in blocked_rows}

    # RGL mapping candidates, one row per source symbol/mapped lemgram relation.
    with (DOC / "RGL_LEXICON_MAPPING.csv").open(encoding="utf-8", newline="") as f:
        for rr in csv.DictReader(f):
            mids = [x.strip() for x in rr["morphodict_ids"].split("|") if x.strip()]
            if not mids:
                status = "EXCLUDED_RGL_MAPPING"
            elif all(mid in {x["id"] for x in active} for mid in mids):
                status = "BLOCKED_CERTIFICATION_PENDING"
            else:
                status = "BLOCKED_RECONCILIATION"
            candidates.append({
                "candidate_id": "CAN-RGL-" + sha256_bytes((rr["source_symbol"] + "\0" + rr["source_category"]).encode())[:16],
                "source_id": "SRC-RGL-CURRENT",
                "lemma": rr["source_symbol"],
                "source_category": rr["source_category"],
                "morphodict_ids": mids,
                "terminal_state": status,
                "reason": rr["reason"],
            })

    # Tosk unique lemma/POS inventory.
    allowed = {"N", "A", "V", "Adv", "Prep", "PN", "Interj", "Conj", "Subj", "Det", "IDet", "IAdv", "IP", "NP", "Pron", "Quant", "IQuant", "Predet"}
    for tr in sorted(tosk_rows, key=lambda r: (r["lemma"].casefold(), r["category"])):
        key = (tr["lemma"], tr["category"])
        if " " in tr["lemma"].strip():
            state, reason = "EXCLUDED_MULTIWORD", "multiword excluded by MorphoDictSqi policy"
        elif tr["category"] not in allowed:
            state, reason = "EXCLUDED_CATEGORY", "category outside current MorphoDictSqi contract"
        elif key in blocked_key:
            state, reason = blocked_key[key]["status"], blocked_key[key]["detail"]
        elif key in active_key:
            state, reason = "BLOCKED_CERTIFICATION_PENDING", "active lemgram exists but C6 requires GF 3.12 + review/gates"
        else:
            state, reason = "BLOCKED_INSUFFICIENT_EVIDENCE", "reference evidence insufficient for a unique active morphology table"
        candidates.append({
            "candidate_id": "CAN-TOSK-" + sha256_bytes((tr["lemma"] + "\0" + tr["category"]).encode("utf-8"))[:16],
            "source_id": "SRC-TOSK-UT",
            "lemma": tr["lemma"],
            "source_category": tr["category"],
            "morphodict_category": tr["category"] if tr["category"] in allowed else None,
            "observed_forms": observed_forms(tr),
            "terminal_state": state,
            "reason": reason,
        })

    # Albanet candidate universe: lemma/POS only, no inflectional promotion.
    posmap = {"n": "N", "v": "V", "a": "A"}
    with (DICT_RES / "albanet_unique_pos_lemma_synset.tsv").open(encoding="utf-8", newline="") as f:
        for fields in csv.reader(f, delimiter="\t"):
            if len(fields) < 2:
                continue
            pos, lemma = fields[0], fields[1]
            synset = fields[2] if len(fields) > 2 else ""
            cat = posmap.get(pos)
            key = (lemma, cat) if cat else None
            if " " in lemma.strip():
                state, reason = "EXCLUDED_MULTIWORD", "multiword candidate excluded by default C2 policy"
            elif not cat:
                state, reason = "EXCLUDED_CATEGORY", "POS has no active MorphoDict mapping"
            elif key in active_key:
                state, reason = "BLOCKED_CERTIFICATION_PENDING", "lexical candidate overlaps active lemgram; Albanet does not independently prove inflection"
            else:
                state, reason = "BLOCKED_INSUFFICIENT_EVIDENCE", "Albanet supplies lemma/POS/synset but no inflectional table evidence"
            candidates.append({
                "candidate_id": "CAN-ALBANET-" + sha256_bytes((pos + "\0" + lemma + "\0" + synset).encode("utf-8"))[:16],
                "source_id": "SRC-ALBANET-OMW",
                "lemma": lemma,
                "source_category": pos,
                "morphodict_category": cat,
                "synset": synset,
                "terminal_state": state,
                "reason": reason,
            })

    # Paradigm registry: all explicit numbered NAV classes used after reconciliation.
    class_to_entries: dict[str, list[str]] = defaultdict(list)
    for item in active:
        m = re.match(r"(mk[NAV]\d{3})\s+", item["gf_expression"])
        if m:
            class_to_entries[m.group(1)].append(item["id"])
    route_patterns: dict[str, list[str]] = defaultdict(list)
    for cat, pairs in inspector.routes.items():
        for pat, cls in pairs:
            route_patterns[cls].append(pat)
    registry = {
        "schema_version": "PAR-SQI-MAX-1",
        "generated": TODAY,
        "policy": "P3 is required for bulk C6 promotion; this static campaign cannot assign P3 without GF/golds/review.",
        "classes": [],
    }
    for cls in sorted(class_to_entries):
        evid_entries = [x for x in class_to_entries[cls] if x in resolved]
        maturity = "P2" if evid_entries else "P1"
        registry["classes"].append({
            "paradigm_id": "PAR-" + cls,
            "constructor": cls,
            "category": cls[2],
            "implementation_sha256": inspector.class_hash(cls),
            "maturity": maturity,
            "smart_route_patterns": route_patterns.get(cls, []),
            "active_lemgrams": len(class_to_entries[cls]),
            "evidence_matched_lemgrams": evid_entries,
            "gf312_campaign_compile": None,
            "gold_status": "not-established-by-C2-static-build",
            "bulk_C6_allowed": False,
        })

    # Dependencies.
    dependencies: list[dict[str, Any]] = []
    source_hash = {x["source_id"]: x["sha256"] for x in build_source_records()}
    for lm in lemgrams:
        cls = lm.get("resolved_class")
        if not cls:
            m = re.match(r"(mk[NAV]\d{3})\s+", lm["gf_expression"])
            cls = m.group(1) if m else None
        dependencies.append({
            "lemgram_id": lm["lemgram_id"],
            "function_id": lm["function_id"],
            "source_ids": ["SRC-TOSK-UT"] if lm["evidence_ids"] else (["SRC-RGL-CURRENT"] if "RGL" in lm["source_label"] else []),
            "source_hashes": {s: source_hash[s] for s in (["SRC-TOSK-UT"] if lm["evidence_ids"] else (["SRC-RGL-CURRENT"] if "RGL" in lm["source_label"] else []))},
            "evidence_ids": lm["evidence_ids"],
            "paradigm_id": "PAR-" + cls if cls else None,
            "gf_expression_sha256": sha256_bytes(lm["gf_expression"].encode("utf-8")),
            "table_signature": None,
            "review_record": None,
            "gate": "GF312+Wordbench+review required before C6",
        })

    # Queues.
    missing: list[dict[str, Any]] = []  # proven missing productive classes only; none established statically in this campaign
    core_triage: list[dict[str, Any]] = []
    blocked_review: list[dict[str, Any]] = []
    conflicts: list[dict[str, Any]] = []
    review: list[dict[str, Any]] = []
    for b in blocked_rows:
        if b["status"] == "BLOCKED_SOURCE_CONFLICT":
            conflicts.append({
                "case_id": "CONFLICT-" + b["id"],
                "lemgram_id": b["id"],
                "conflict_type": source_conflict_type(b["id"]),
                "base": b["base"],
                "category": b["cat"],
                "observed_forms": b["observed_forms"],
                "detail": b["detail"],
                "resolution": "OPEN",
            })
        else:
            blocked_review.append({
                "case_id": "BREV-" + b["id"],
                "lemgram_id": b["id"],
                "base": b["base"],
                "category": b["cat"],
                "observed_forms": b["observed_forms"],
                "smart_class": b["smart_class"],
                "evidence_matching_classes": b["matching_classes"],
                "reason": b["detail"],
                "owner_conversation": "C2 MorphoDict evidence review",
                "status": "OPEN",
            })
            if not b["matching_classes"]:
                core_triage.append({
                    "case_id": "C1TRIAGE-" + b["id"],
                    "category": b["cat"],
                    "base": b["base"],
                    "observed_forms": b["observed_forms"],
                    "current_smart_class": b["smart_class"],
                    "reason": "no numbered class matched all recorded evidence in the conservative static evaluator; determine whether this is an evaluator/mapping gap, source issue, irregular lexeme, or genuinely missing productive class before opening a C1 class request",
                    "status": "TRIAGE_REQUIRED",
                })
    for item in active:
        if item["certification_level"] != "C6":
            review.append({
                "case_id": "REV-" + item["id"],
                "lemgram_id": item["id"],
                "base": item["base"],
                "category": item["cat"],
                "source": item["source"],
                "proposed_expression": item["gf_expression"],
                "current_level": item["certification_level"],
                "blocking_reason": "GF 3.12 campaign compile/introspection and C5 linguistic review not established by this environment",
                "review_action": "compile -> evidence/table introspection -> linguistic review -> global regression gate",
            })

    cert_counts = Counter(x["certification_level"] for x in active)
    cand_states = Counter(x["terminal_state"] for x in candidates)
    metrics = {
        "schema_version": "METRICS-SQI-MAX-1",
        "campaign_id": CAMPAIGN,
        "generated": TODAY,
        "baseline_declared": {"gf": "3.12", "wordbench": "1.3.4", "targets": "58/58", "scenarios": "52/52", "tag": "albanian-s02-green-20260925"},
        "active_before": len(rows),
        "active_after": len(active),
        "placeholder_before": sum(r["quality"] == "compile-safe-placeholder" for r in rows),
        "placeholder_after": 0,
        "placeholders_resolved_to_explicit_existing_class": len(resolved),
        "placeholders_removed_to_blocked_queue": len(blocked),
        "blocked_breakdown": dict(Counter(b["status"] for b in blocked_rows)),
        "certification_counts": dict(cert_counts),
        "certified_C6": cert_counts.get("C6", 0),
        "variants_count_static": 0,
        "unprovenanced_active_count": 0,
        "unwaived_multiword_active_count": sum(" " in x["base"].strip() for x in active),
        "source_universe_candidate_records": len(candidates),
        "source_universe_terminal_states": dict(cand_states),
        "source_universe_unclassified": sum(not x["terminal_state"] for x in candidates),
        "category_counts": dict(sorted(Counter(x["cat"] for x in active).items())),
        "quality_counts": dict(sorted(Counter(x["quality"] for x in active).items())),
        "limitations": [
            "GF executable is unavailable in this build environment; no new GF 3.12 compile is claimed.",
            "No entry is promoted to C6 by static analysis alone.",
            "table_signature remains null until native GF introspection produces canonical tables.",
            "UT Austin source bundle has no explicit redistribution licence in supplied material; it is used as review evidence only.",
        ],
    }

    if args.apply:
        # Write active GF first.
        write_gf(active)

        # Machine-readable core.
        jsonl_write(RES / "LEMGRAMS.jsonl", lemgrams)
        jsonl_write(RES / "EVIDENCE.jsonl", evidence)
        jsonl_write(RES / "CANDIDATES.jsonl", candidates)
        sources = build_source_records()
        (RES / "SOURCES.yaml").write_text(yaml.safe_dump({"schema_version": "SRC-SQI-MAX-1", "sources": sources}, allow_unicode=True, sort_keys=False), encoding="utf-8")
        source_counts = Counter(x["source_id"] for x in candidates)
        universe = {
            "schema_version": "UNIVERSE-SQI-MAX-1",
            "campaign_id": CAMPAIGN,
            "sources": [{"source_id": s["source_id"], "candidate_records": source_counts.get(s["source_id"], 0), "sha256": s["sha256"]} for s in sources],
            "total_candidate_records": len(candidates),
            "terminal_state_counts": dict(cand_states),
            "unclassified": metrics["source_universe_unclassified"],
            "terminal_policy": "Each source record is classified C6-equivalent, blocked, or excluded. Current campaign has no newly established C6 because native GF/review gates were unavailable.",
        }
        (RES / "SOURCE_UNIVERSE.yaml").write_text(yaml.safe_dump(universe, allow_unicode=True, sort_keys=False), encoding="utf-8")

        # Coverage v2.
        coverage_rows = []
        for item in active:
            coverage_rows.append({
                "id": item["id"], "base": item["base"], "cat": item["cat"], "quality": item["quality"],
                "source": item["source"], "expr": item["gf_expression"], "certification": item["certification_level"],
                "compile_status": item["compile_status"], "note": item["note"],
            })
        with (DOC / "COVERAGE.csv").open("w", encoding="utf-8", newline="") as f:
            w = csv.DictWriter(f, fieldnames=list(coverage_rows[0].keys()))
            w.writeheader(); w.writerows(coverage_rows)
        coverage_json = {
            "schema": "MorphoDictSqi-coverage-v2",
            "generated": TODAY,
            "campaign_id": CAMPAIGN,
            "entry_count": len(active),
            "category_counts": metrics["category_counts"],
            "quality_counts": metrics["quality_counts"],
            "certification_counts": metrics["certification_counts"],
            "placeholder_count": 0,
            "blocked_count": len(blocked_rows),
            "source_universe_records": len(candidates),
            "entries": coverage_rows,
            "blocked": blocked_rows,
            "policy": {
                "variants": 0,
                "multiword": "excluded by default",
                "semantic_valence": "collapsed",
                "C6": "not established by static build; native GF + evidence + review + global gates required",
            },
        }
        (DOC / "COVERAGE.json").write_text(json.dumps(coverage_json, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

        # Blocked / excluded / queues.
        with (DOC / "BLOCKED.csv").open("w", encoding="utf-8", newline="") as f:
            fields = ["id","base","cat","status","detail","source","observed_forms","smart_class","matching_classes","gender"]
            w=csv.DictWriter(f,fieldnames=fields); w.writeheader(); w.writerows(blocked_rows)
        (DOC / "PARADIGM_REGISTRY.yaml").write_text(yaml.safe_dump(registry, allow_unicode=True, sort_keys=False), encoding="utf-8")
        jsonl_write(DOC / "DEPENDENCIES.jsonl", dependencies)
        (DOC / "METRICS.json").write_text(json.dumps(metrics, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

        def write_tsv(path: Path, rows_: list[dict[str, Any]], fields: list[str]):
            with path.open("w", encoding="utf-8", newline="") as f:
                w=csv.DictWriter(f,delimiter="\t",fieldnames=fields,extrasaction="ignore"); w.writeheader(); w.writerows(rows_)
        write_tsv(VAL / "review_queue.tsv", review, ["case_id","lemgram_id","base","category","source","proposed_expression","current_level","blocking_reason","review_action"])
        write_tsv(VAL / "blocked_review_queue.tsv", blocked_review, ["case_id","lemgram_id","base","category","observed_forms","smart_class","evidence_matching_classes","reason","owner_conversation","status"])
        write_tsv(VAL / "missing_paradigms.tsv", missing, ["missing_class_id","category","base","observed_forms","smart_class","evidence_matching_classes","reason","owner_conversation","status"])
        write_tsv(VAL / "core_escalation_candidates.tsv", core_triage, ["case_id","category","base","observed_forms","current_smart_class","reason","status"])
        write_tsv(VAL / "source_conflicts.tsv", conflicts, ["case_id","lemgram_id","conflict_type","base","category","observed_forms","detail","resolution"])

        # Candidate morphology-gold rows owned by C10, never silently promoted to gold.
        gold_candidates=[]
        for item in active:
            tr=tosk_by_key.get((item["base"],item["cat"]))
            if tr and observed_forms(tr):
                for form in observed_forms(tr):
                    gold_candidates.append({"lemgram_id":item["id"],"category":item["cat"],"observed_form":form,"raw_description":tr["descriptions"],"status":"PROPOSED_C10_REVIEW"})
        write_tsv(VAL / "GOLD_MORPHOLOGY_CANDIDATES.tsv", gold_candidates, ["lemgram_id","category","observed_form","raw_description","status"])

        # Bootstrap config stays compatibility-only, explicitly non-certifying.
        (GF_DIR / "MorphoDictSqi.config").write_text('''# Compatibility/bootstrap config only. NOT a certification source.\n# MAX generation is driven by resources/morphodict/LEMGRAMS.jsonl.\n# A one-form smart constructor cannot by itself establish C2/C6.\nN : N mkN 0\nA : A mkA 0\nV : V mkV 0\nAdv : Adv mkAdv 0\nPrep : Prep mkPrep 0\nPN : PN mkPN 0\nInterj : Interj mkInterj 0\nConj : Conj mkConj 0\nSubj : Subj mkSubj 0\nIAdv : IAdv mkIAdv 0\n''', encoding="utf-8", newline="\n")

        # Manifest/report.
        manifest = {
            "name": "MorphoDictSqi_MAX_C2_20260925",
            "campaign_id": CAMPAIGN,
            "entry_count": len(active),
            "categories": metrics["category_counts"],
            "quality_counts": metrics["quality_counts"],
            "certification_counts": metrics["certification_counts"],
            "placeholder_count": 0,
            "blocked_count": len(blocked_rows),
            "resolved_existing_class_count": len(resolved),
            "source_universe_records": len(candidates),
            "gf312_new_run": "NOT_EXECUTED_IN_THIS_ENVIRONMENT",
            "wordbench_new_run": "NOT_EXECUTED_IN_THIS_ENVIRONMENT",
            "c6_policy": "no static-only promotion",
        }
        (DOC / "MANIFEST.json").write_text(json.dumps(manifest, indent=2, ensure_ascii=False)+"\n",encoding="utf-8")

        # Campaign report machine output.
        camp = DOC / "campaigns" / CAMPAIGN
        camp.mkdir(parents=True, exist_ok=True)
        report = {
            "campaign_id": CAMPAIGN,
            "resolved": resolved,
            "blocked": blocked_rows,
            "metrics": metrics,
            "changed_gf": ["AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf","AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf"],
        }
        (camp / "REPORT.json").write_text(json.dumps(report,indent=2,ensure_ascii=False)+"\n",encoding="utf-8")

    print(json.dumps({
        "active_before": len(rows), "active_after": len(active), "resolved": len(resolved), "blocked": len(blocked),
        "resolved_categories": dict(Counter(old_by_id[i]["cat"] for i in resolved)),
        "blocked_categories": dict(Counter(old_by_id[i]["cat"] for i in blocked)),
        "candidate_records": len(candidates), "candidate_states": dict(cand_states),
        "certification_counts": dict(cert_counts),
    }, indent=2, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
