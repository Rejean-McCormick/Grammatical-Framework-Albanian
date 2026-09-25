#!/usr/bin/env python3
from __future__ import annotations

import hashlib
import re
import sys
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "AlbanianSQI/GF/lib/src/albanian"


def text(rel: str) -> str:
    return (ROOT / rel).read_text(encoding="utf-8")


def require(cond: bool, msg: str) -> None:
    if not cond:
        raise AssertionError(msg)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def extract_block(s: str, start: str, end: str) -> str:
    a = s.index(start)
    b = s.index(end, a)
    return s[a:b]


def main() -> int:
    clause = text("AlbanianSQI/GF/lib/src/albanian/ClauseSqiRes.gf")
    sentence = text("AlbanianSQI/GF/lib/src/albanian/SentenceSqi.gf")
    question = text("AlbanianSQI/GF/lib/src/albanian/QuestionSqi.gf")
    relative = text("AlbanianSQI/GF/lib/src/albanian/RelativeSqi.gf")
    adjective = text("AlbanianSQI/GF/lib/src/albanian/AdjectiveSqi.gf")
    scaff = text("AlbanianSQI/GF/lib/src/albanian/ExtendSqiScaffolding.gf")
    vps = text("AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPS.gf")

    # Architecture owner / semantic helpers.
    for sym in [
        "fallbackAgr", "clausalSubjectAgr", "embedIndicative",
        "markPolarQuestion", "markRelativeClause", "frontWh",
        "frontGovernedIP", "frontGovernedRP", "assembleFinalPredicate",
        "mkClause", "realizeVP", "realizeSubjVP",
    ]:
        require(sym in clause, f"ClauseSqiRes missing canonical helper {sym}")

    # Public modules must delegate ordinary realization rather than re-spell it.
    require("mkClause sc.s clausalSubjectAgr" in sentence,
            "PredSCVP must use the dedicated clausal-subject agreement")
    require("EmbedS s = {s = embedIndicative s.s}" in sentence,
            "EmbedS must use canonical indicative embedding")
    require('"që" ++ sslash.s' not in sentence,
            "SlashVS must not hardcode its own indicative complementizer")
    require("markPolarQuestion" in question and '"a" ++ cl.s' not in question,
            "QuestCl must delegate the polar marker")
    require("frontGovernedIP cl.c2 ip.s" in question,
            "QuestSlash must preserve government through the shared helper")
    require("markRelativeClause" in relative,
            "RelCl must delegate the relative marker")
    require("frontGovernedRP cl.c2 rp.s" in relative,
            "RelSlash must preserve government through the shared helper")

    # SC owns embedding.  This catches the previous qё qё / qё të composition.
    sent_ap = extract_block(adjective, "    SentAP ap sc", "\n    } ;")
    require('"që"' not in sent_ap, "SentAP must not prepend a second qё")
    require("++ sc.s" in sent_ap, "SentAP must consume the SC surface directly")

    # Canonical stranding policy: operations with an explicit IP/RP neutralize
    # to pied-piping. EmptyRelSlash stays explicitly marked as uncertified debt.
    strand_q = extract_block(scaff, "  sc_StrandQuestSlash", "\n  } ;")
    strand_r = extract_block(scaff, "  sc_StrandRelSlash", "\n  } ;")
    empty_r = extract_block(scaff, "  sc_EmptyRelSlash", "\n  } ;")
    require("frontGovernedIP" in strand_q, "StrandQuestSlash not neutralized")
    require("frontGovernedRP" in strand_r, "StrandRelSlash not neutralized")
    require("uncertified" in scaff and "markRelativeClause" in empty_r,
            "EmptyRelSlash debt must remain explicit and mechanically visible")

    # VPS/RS/QS surfaces reuse the final predicate assembly point.
    require(vps.count("assembleFinalPredicate") >= 4,
            "ExtendSqiVPS still contains duplicate final predicate assemblers")

    # No cross-workstream representation migration in this patch.
    expected_unchanged = {
        "AlbanianSQI/GF/lib/src/albanian/CatSqi.gf":
            "8fb7b05b7ad8af60f19894cafdfdc878a885467d969e9e308fb4efae86199210",
        "AlbanianSQI/GF/lib/src/albanian/ResSqi.gf":
            "0ce1f35dcedb68d6084d30e781d013b5aa1376526095d7659f5b640ce8e23727",
    }
    for rel, expected in expected_unchanged.items():
        got = sha256(ROOT / rel)
        require(got == expected, f"unexpected representation migration: {rel} {got}")

    # Shared abstract API coverage is locked: 19 Sentence + 17 Question + 5 Relative.
    expected_api = {
        "SentenceSqi.gf": [
            "PredVP", "PredSCVP", "SlashVP", "AdvSlash", "SlashPrep", "SlashVS",
            "ImpVP", "AdvImp", "EmbedS", "EmbedQS", "EmbedVP", "UseCl", "UseQCl",
            "UseRCl", "UseSlash", "AdvS", "ExtAdvS", "SSubjS", "RelS",
        ],
        "QuestionSqi.gf": [
            "QuestCl", "QuestVP", "QuestSlash", "QuestIAdv", "QuestIComp", "IdetCN",
            "IdetIP", "AdvIP", "IdetQuant", "PrepIP", "AdvIAdv", "CompIAdv", "CompIP",
            "ComplSlashIP", "AdvQVP", "AddAdvQVP", "QuestQVP",
        ],
        "RelativeSqi.gf": ["RelCl", "RelVP", "RelSlash", "IdRP", "FunRP"],
    }
    covered = 0
    for name, functions in expected_api.items():
        source = (SRC / name).read_text(encoding="utf-8")
        for fun in functions:
            require(re.search(rf"(?m)^\s*{re.escape(fun)}\b[^=]*=", source) is not None,
                    f"missing shared abstract function {fun} in {name}")
            covered += 1
    require(covered == 41, f"unexpected shared API coverage count: {covered}")

    # Baseline scenario set remains 52 required; C7 final campaign is additive.
    project = tomllib.loads(text("project.toml"))
    required = project["validation"]["required_scenarios"]
    optional = project["validation"]["optional_scenarios"]
    require(len(required) == 52, f"required scenario baseline changed: {len(required)}")
    require("alb-clause-final" in optional, "missing optional C7 final scenario")

    scenario = text("validation/scenarios/alb-clause-final.gfs")
    cases = re.findall(r'^ps "CASE (C7F\d{3}) ', scenario, flags=re.M)
    require(len(cases) == 18 and len(set(cases)) == 18,
            f"expected 18 unique C7 final CASEs, got {len(cases)}")
    for rel in ["validation/inputs/AlbClauseFinal.gf", "validation/inputs/AlbClauseFinalSqi.gf"]:
        digest = sha256(ROOT / rel)
        require(f"GF_WORDBENCH_INPUT_SHA256 {digest} {rel}" in scenario,
                f"scenario SHA lock mismatch for {rel}")

    # Simple structural sanity for every changed GF source: comments stripped,
    # braces balanced. GF 3.12 remains authoritative for syntax/type acceptance.
    changed = [
        "ClauseSqiRes.gf", "SentenceSqi.gf", "QuestionSqi.gf", "RelativeSqi.gf",
        "VerbSqi.gf", "AdjectiveSqi.gf", "ExtendSqiScaffolding.gf",
        "ExtendSqiVPS.gf", "ConstructionSqi.gf", "IdiomSqi.gf",
    ]
    for name in changed:
        s = (SRC / name).read_text(encoding="utf-8")
        code = re.sub(r'--.*', '', s)
        require(code.count('{') == code.count('}'), f"unbalanced braces in {name}")

    print("C7 clause static validation: PASS")
    print("- canonical clause helpers present")
    print("- no CatSqi/ResSqi representation migration")
    print("- SentAP embedding ownership repaired")
    print("- explicit stranding operations neutralized where representable")
    print("- shared Sentence/Question/Relative coverage: 41/41")
    print("- 52 required scenarios preserved")
    print("- optional alb-clause-final: 18 SHA-locked CASEs")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except AssertionError as exc:
        print(f"C7 clause static validation: FAIL: {exc}", file=sys.stderr)
        raise SystemExit(1)
