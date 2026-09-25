#!/usr/bin/env python3
"""Static contract validator for Albanian RGL Morphology MAX.

This does not replace GF 3.12 compilation. It catches source-shape drift that is
cheap and deterministic to verify before handing the overlay to GF Wordbench.
"""
from __future__ import annotations
from pathlib import Path
import re, sys, json

HERE = Path(__file__).resolve().parent
ROOT = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else (HERE.parent / "source").resolve()
ALB = ROOT / "AlbanianSQI/GF/lib/src/albanian"
MORPHODICT = ROOT / "AlbanianSQI/GF/lib/src/morphodict"

failures: list[str] = []
notes: list[str] = []

def text(path: Path) -> str:
    return path.read_text(encoding="utf-8")

def require(cond: bool, msg: str) -> None:
    if not cond: failures.append(msg)

def require_contains(s: str, needle: str, where: str) -> None:
    require(needle in s, f"{where}: missing expected source contract: {needle}")

def class_blocks(s: str, prefix: str) -> dict[int, str]:
    pat = re.compile(rf"(?m)^mk{prefix}(\d{{3}})\s*:\s*")
    ms = list(pat.finditer(s)); out = {}
    for i,m in enumerate(ms):
        end = ms[i+1].start() if i+1 < len(ms) else len(s)
        out[int(m.group(1))] = s[m.start():end]
    return out

res = text(ALB/"ResSqi.gf")
morph = text(ALB/"MorphoSqi.gf")
par = text(ALB/"ParadigmsSqi.gf")
irr = text(ALB/"IrregSqi.gf")

# Central feature contracts.
for needle in [
    "Case = Nom | Acc | Dat | Gen | Ablat",
    "GenNum = GSg Gender | GPl Gender",
    "s : Species => Case => Number => Str",
    "g : Number => Gender",
    "AdjClass = Articulated | Unarticulated",
    "Adj : Type = {s : Case => Gender => Number => Str ; cls : AdjClass}",
    "MorphVoice = ActiveMorph | NonActiveMorph",
    "PerfectAux = AuxKam | AuxJam",
    "morphVoice : MorphVoice",
    "perfectAux : PerfectAux",
    "Tense = Pres | Perfect | Imperfect | Aorist",
]: require_contains(res, needle, "ResSqi.gf")

require("Gen => table {Sg => f5 ;  Pl => f6}" in res and "Gen => table {Sg => f13 ; Pl => f14}" in res,
        "ResSqi.mkNounGenders must explicitly preserve Gen while reusing Dat surface forms")
require_contains(res, "selectPerfectAux", "ResSqi.gf")
require_contains(res, "perfectAuxFinite", "ResSqi.gf")
require_contains(res, "perfectAuxSubj", "ResSqi.gf")
require_contains(res, "nyje : Species => Case => Gender => Number => Str", "ResSqi.gf")
require("link_clitic :" in res and "= nyje" in res, "ResSqi: migration alias link_clitic -> nyje must remain explicit")

# Productive class census and per-class shape.
nb = class_blocks(morph,"N"); ab = class_blocks(morph,"A"); vb = class_blocks(morph,"V")
require(len(nb)==563 and sorted(nb)==list(range(1,564)), f"MorphoSqi noun census: expected 563 contiguous classes, got {len(nb)}")
require(len(ab)==36 and sorted(ab)==list(range(1,37)), f"MorphoSqi adjective census: expected 36 contiguous classes, got {len(ab)}")
require(len(vb)==135 and sorted(vb)==list(range(1,136)), f"MorphoSqi verb census: expected 135 contiguous classes, got {len(vb)}")
for i,b in nb.items():
    # mkN089 delegates to the immediately preceding mkN089_core helper; all other
    # classes either realize directly or delegate to a numbered class.
    if i == 89:
        core = re.search(r"(?ms)mkN089_core\s*:.*?(?=^mkN089\s*:)", morph)
        bb = core.group(0) if core else b
    elif re.search(r"=\s*mkN\d{3}\b", b):
        target = int(re.search(r"=\s*mkN(\d{3})\b", b).group(1))
        bb = nb.get(target,b)
    else:
        bb = b
    require("Gen" in bb, f"mkN{i:03d}: missing Gen branch")
    require(re.search(r"\bg\s*=\s*table\s*\{\s*Sg\s*=>", bb) is not None, f"mkN{i:03d}: noun gender must be number-indexed")
for i,b in ab.items():
    require("cls =" in b, f"mkA{i:03d}: missing AdjClass metadata")
    # Productive A classes must be exhaustive over Case either by wildcard or explicit Gen.
    require("_ => table" in b or "Gen" in b, f"mkA{i:03d}: adjective case table not exhaustive")
for i,b in vb.items():
    if re.search(r"=\s*mkV\d{3}\b", b):
        target = int(re.search(r"=\s*mkV(\d{3})\b", b).group(1))
        bb = vb.get(target,b)
    else:
        bb = b
    require("morphVoice =" in bb, f"mkV{i:03d}: missing morphVoice")
    require("perfectAux =" in bb, f"mkV{i:03d}: missing perfectAux")

nonactive = sorted(i for i,b in vb.items() if "morphVoice = NonActiveMorph" in b)
expected_nonactive = [31,37,39,40,41,46,61,63,96,97,123,124]
require(nonactive == expected_nonactive,
        f"MorphoSqi non-active structural set drifted: expected {expected_nonactive}, got {nonactive}")
notes.append(f"productive_classes=N:{len(nb)} A:{len(ab)} V:{len(vb)}; structural_nonactive={len(nonactive)}")

# Public smart-paradigm contract.
for needle in [
    "genitive", "Case = Gen",
    "reg2NRaw", "reg2ARaw", "reg2VRaw",
    "reg2N : Str -> Str -> N", "reg2A : Str -> Str -> A", "reg2V : Str -> Str -> V",
    "reg3N : Str -> Str -> Str -> N", "reg3A : Str -> Str -> Str -> A",
    "reg3V : Str -> Str -> Str -> V", "reg4V : Str -> Str -> Str -> Str -> V",
    "Predef.eqStr", "incompatible plural principal part", "incompatible participle principal part",
    "mkNFullGenders", "mkNAmbig", "AForms : Type", "mkAFull", "unartA",
    "mkVFull", "mkNonActiveVFull",
    "legacyIrregSubjunctive", "LEGACY-COMPATIBILITY ONLY",
]: require_contains(par, needle, "ParadigmsSqi.gf")

# Guard regression: every supplied principal part must be observed in a comparison.
for fn in ["reg2N","reg2A","reg2V","reg3N","reg3A","reg3V","reg4V"]:
    m = re.search(rf"(?ms)^{fn}\s*:.*?(?=^\w+\s*:|^-- Worst-case|^-- Exact|\Z)", par)
    require(m is not None and "Predef.eqStr" in m.group(0), f"{fn}: strict principal-part guard missing")

# No obsolete adjective bool field in active language code.
all_alb = "\n".join(text(p) for p in ALB.glob("*.gf"))
require(re.search(r"\.clit\b", all_alb) is None, "obsolete Adj.clit field still consumed")
# link_clitic may survive only as compatibility declaration in ResSqi.
link_hits=[]
for p in ALB.glob("*.gf"):
    for n,line in enumerate(text(p).splitlines(),1):
        if "link_clitic" in line: link_hits.append((p.name,n,line.strip()))
require(all(h[0]=="ResSqi.gf" for h in link_hits), f"link_clitic has active consumers: {link_hits}")

# Five-case exhaustiveness heuristic for explicit Case tables/branches.
case4 = re.compile(r"Nom\s*=>|Acc\s*=>|Dat\s*=>|Ablat\s*=>")
missing=[]
for p in list(ALB.glob("*.gf"))+list(MORPHODICT.glob("*.gf")):
    lines=text(p).splitlines()
    for i in range(len(lines)):
        window="\n".join(lines[i:i+28])
        if all(tok in window for tok in ["Nom =>","Acc =>","Dat =>","Ablat =>"]) and "Gen =>" not in window and "_ =>" not in window:
            # limit false duplicates by recording start lines where Nom is on the first line
            if "Nom =>" in lines[i]: missing.append(f"{p.name}:{i+1}")
require(not missing, "explicit five-case table(s) missing Gen: "+", ".join(missing[:20]))

# Consumer propagation for number-sensitive noun gender and verb auxiliary metadata.
for f in ["NounSqi.gf","SymbolSqi.gf","QuestionSqi.gf","ConjunctionSqi.gf","ConstructionSqi.gf"]:
    s=text(ALB/f)
    # Consumers may copy the entire gender table (g=cn.g), but whenever a
    # concrete agreement gender is selected from CN it must be indexed by Number.
    bad=[]
    for n,line in enumerate(s.splitlines(),1):
        if "cn.g" in line and "g=cn.g" not in line.replace(" ","") and "g = cn.g" not in line:
            if "cn.g !" not in line and "cn.g!" not in line:
                bad.append(n)
    require(not bad, f"{f}: scalar cn.g consumer remains at lines {bad}")
for f in ["VerbSqi.gf","ClauseSqiRes.gf"]:
    s=text(ALB/f)
    require("perfectAux" in s and "morphVoice" in s, f"{f}: verb metadata not propagated")
require("perfectAuxFinite vp.perfectAux" in text(ALB/"ClauseSqiRes.gf"), "ClauseSqiRes: analytic anterior does not consume perfectAux")

# Irregular policy: exact entries should use exact constructors; compact legacy is counted and frozen.
compact_irreg = re.findall(r"(?m)^\s*([A-Za-z0-9_]+_V)\s*=\s*irregV\b", irr)
expected_compact = ["bej_V","bie_V","dal_V","eci_V","hyj_V","iki_V","ngre_V","njoh_V","pi_V","urrej_V","ve_V"]
require(compact_irreg == expected_compact, f"IrregSqi compact legacy set changed: {compact_irreg}")
for name in ["behem_V"]:
    require(re.search(rf"\b{name}\s*=\s*mkNonActiveVFull\b", irr) is not None, f"{name}: expected full non-active constructor")
for name in ["blej_V","dua_V","ha_V","gjej_V","jam_V","jap_V","kam_V","shoh_V","them_V","vij_V"]:
    require(re.search(rf"\b{name}\s*=\s*mkVFull\b", irr) is not None, f"{name}: expected exact mkVFull")
notes.append(f"IrregSqi exact_full=11; compact_legacy={len(compact_irreg)}")

# Direct compact-constructor debt outside IrregSqi must stay explicitly enumerable.
debt=[]
for p in list(ALB.glob("*.gf"))+list(MORPHODICT.glob("*.gf")):
    if p.name in {"ParadigmsSqi.gf","IrregSqi.gf"}: continue
    for n,line in enumerate(text(p).splitlines(),1):
        if re.search(r"\birregV\b", line): debt.append(f"{p.relative_to(ROOT)}:{n}")
expected_suffixes={
 "AlbanianSQI/GF/lib/src/albanian/DictSqi.gf:30",
 "AlbanianSQI/GF/lib/src/albanian/StructuralSqiVerbal.gf:6",
 "AlbanianSQI/GF/lib/src/albanian/StructuralSqiVerbal.gf:12",
 "AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf:28",
 "AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf:122",
}
require(set(debt)==expected_suffixes, f"unexpected direct irregV debt locations: {debt}")
notes.append(f"direct_legacy_irregV_debt={len(debt)}")

# Validation campaign was migrated to the explicit Perfect internal table.
val_hits=[]
for p in (ROOT/"validation/inputs").glob("*.gf"):
    if re.search(r"\.Indicative\s*!\s*Past\b", text(p)): val_hits.append(p.name)
require(not val_hits, f"validation still indexes obsolete internal Past: {val_hits}")

require("MX019" in text(ROOT/"validation/morphology_max/AlbMorphologyMaxSqi.gf") and
        "legacyDi.Subjunctive" in text(ROOT/"validation/morphology_max/AlbMorphologyMaxSqi.gf"),
        "morphology-max probes must cover legacy di subjunctive compatibility")
require("MX020" in text(ROOT/"validation/morphology_max/AlbMorphologyMaxSqi.gf") and
        "legacyPi.Subjunctive" in text(ROOT/"validation/morphology_max/AlbMorphologyMaxSqi.gf"),
        "morphology-max probes must cover legacy pi subjunctive compatibility")

# Lightweight delimiter sanity for GF files, ignoring comments/strings approximately.
def balanced_source(p: Path):
    s=text(p)
    # remove -- line comments and quoted strings (sufficient for delimiter smoke)
    s=re.sub(r'--[^\n]*','',s)
    s=re.sub(r'"(?:\\.|[^"\\])*"','""',s)
    pairs={')':'(',']':'[','}':'{'}; stack=[]
    for idx,ch in enumerate(s):
        if ch in '([{': stack.append((ch,idx))
        elif ch in ')]}':
            if not stack or stack[-1][0]!=pairs[ch]: return False
            stack.pop()
    return not stack
bad_bal=[str(p.relative_to(ROOT)) for p in list(ALB.glob('*.gf'))+list(MORPHODICT.glob('*.gf')) if not balanced_source(p)]
require(not bad_bal, f"delimiter sanity failed: {bad_bal}")

report={"ok":not failures,"notes":notes,"failures":failures}
print(json.dumps(report,ensure_ascii=False,indent=2))
if failures: sys.exit(1)
