#!/usr/bin/env python3
"""Static architectural guardrails for the Albanian nominal subsystem.

This validator does not replace GF 3.12.  It checks representation invariants
that are easy to regress with broad textual edits and makes canonical gaps
visible instead of silently filling them.
"""
from pathlib import Path
import re, sys

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "AlbanianSQI/GF/lib/src/albanian"

def read(name): return (SRC/name).read_text(encoding="utf-8")

def require(ok, msg):
    print(("PASS " if ok else "FAIL ") + msg)
    if not ok: failures.append(msg)

failures=[]
res=read("ResSqi.gf")
cat=read("CatSqi.gf")
noun=read("NounSqi.gf")
par=read("ParadigmsSqi.gf")
struct=read("StructuralSqiNominal.gf")
extsc=read("ExtendSqiScaffolding.gf")
allgf="\n".join(p.read_text(encoding="utf-8",errors="replace") for p in SRC.glob("*.gf"))

require("Case = Nom | Acc | Gen | Dat | Ablat" in res, "five grammatical cases including Gen")
require("MorphCase = MNom | MAcc | MDat | MAblat" in res, "four morphological noun cases")
require(re.search(r"Gen\s*=>\s*MDat",res) is not None, "Gen maps to MDat only at morphology boundary")
require("s : Species => MorphCase => Number => Str ; g : Number => Gender" in res, "Noun stores MorphCase and number-sensitive gender")
require("CNoun : Type = {s : Species => Case => Number => Str ; g : Number => Gender}" in res, "CN carries grammatical Case")
require("CN = CNoun" in cat, "CatSqi CN uses grammatical CNoun")
require("Adj : Type = {s : Gender => Number => Str ; cls : Number => AdjClass}" in res, "Adj lexical table is Gender x Number with typed class")
require("AdjClass = Articulated | Unarticulated" in res, "typed articulated/unarticulated adjective class")
require("nyje : Species => Case => Gender => Number => Str" in res, "single typed nyje service")
require("GenNum" not in allgf and "GSg" not in allgf and "GPl" not in allgf, "legacy GenNum/GSg/GPl removed")
require(".clit" not in allgf, "legacy adjective .clit flag removed")
require("np.s!Gen" in re.sub(r"\s+","",noun), "PossNP selects grammatical Gen on possessor")
require("mkNFullGenders" in par and "mkNAmbig" in par, "public ambigeneric noun constructors")
require(re.search(r"mkPN\s*:\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Gender\s*->\s*PN",par) is not None, "PN API exposes five-case explicit constructor")
require(re.search(r"mkLN\s*:\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Gender\s*->\s*Number\s*->\s*LN",par) is not None, "LN API exposes five-case explicit constructor")
require(re.search(r"mkGN\s*:\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Str\s*->\s*Gender\s*->\s*GN",par) is not None, "GN API exposes five-case explicit constructor")
require('"këtë"  "këta"      "këtë"  "këto"' in struct, "proximal demonstrative accusative plurals match supplied Lesson 30")
require('possSg "mie" "time" "sime"' in noun, "1SG feminine possessive matches supplied table")
require('possSg "yt" "tët" "tët"' in noun, "2SG masculine possessive matches supplied table")
require("headlessNominalFallbackGender" in res and "coordinationFallbackAgr" in res, "unresolved agreement fallbacks are centralized and named")
require("NumeralGov" not in allgf, "no NumeralGov invented without Albanian minimal pairs")
require("modifier.s!R.Indef!R.MNom!P.Sg" in re.sub(r"\s+","",extsc), "compound lexical N remains in MorphCase space")
doc=read("DocumentationSqi.gf")
require("case <x.g ! Sg,x.g ! Pl> of" in doc, "documentation handles number-sensitive noun gender")
require('rowspan=\\"5\\"' in doc, "noun documentation table spans all five grammatical cases")

# Detect the most dangerous post-migration anti-pattern: constructing a lexical
# N with a Case-indexed lambda through nounForm.  Direct nounForm calls elsewhere
# are allowed because they are grammatical realization boundaries.
for path in SRC.glob("*.gf"):
    txt=path.read_text(encoding="utf-8",errors="replace")
    if re.search(r"lin\s+N\s*\{[^}]{0,800}nounForm",txt,re.S):
        require(False, f"no nounForm inside lexical lin N record ({path.name})")



# Baseline census and scenario integrity.  These are structure checks only;
# execution remains the responsibility of GF 3.12 / Wordbench.
import hashlib
lang_targets=list((ROOT/"AlbanianSQI/GF/lib/src/albanian").glob("*.gf"))
api_targets=list((ROOT/"AlbanianSQI/GF/lib/src").glob("*Sqi.gf"))
morph_targets=list((ROOT/"AlbanianSQI/GF/lib/src/morphodict").glob("MorphoDictSqi*.gf"))
require(len(lang_targets)==51, f"language target census remains 51 (got {len(lang_targets)})")
require(len(api_targets)==5, f"API facade census remains 5 (got {len(api_targets)})")
require(len(morph_targets)==2, f"MorphoDict target census remains 2 (got {len(morph_targets)})")
scenarios=sorted((ROOT/"validation/scenarios").glob("*.gfs"))
require(len(scenarios)==52, f"scenario census remains 52 (got {len(scenarios)})")

hash_ok=True
for scenario in scenarios:
    txt=scenario.read_text(encoding="utf-8",errors="replace")
    for h,rel in re.findall(r"^-- GF_WORDBENCH_INPUT_SHA256 ([0-9a-f]{64}) (validation/inputs/[^\r\n]+)$",txt,re.M):
        target=ROOT/rel
        if not target.exists() or hashlib.sha256(target.read_bytes()).hexdigest()!=h:
            print(f"FAIL stale scenario input hash: {scenario.name} -> {rel}")
            hash_ok=False
require(hash_ok,"all embedded Wordbench input hashes are current")

scenario_symbols_ok=True
for scenario in scenarios:
    txt=scenario.read_text(encoding="utf-8",errors="replace")
    m=re.search(r"^i\s+([A-Za-z0-9_]+)\.gf\s*$",txt,re.M)
    if not m:
        continue
    concrete_name=m.group(1)
    concrete_path=ROOT/"validation/inputs"/(concrete_name+".gf")
    if not concrete_path.exists():
        print(f"FAIL missing scenario concrete: {scenario.name} -> {concrete_path.name}")
        scenario_symbols_ok=False; continue
    concrete=concrete_path.read_text(encoding="utf-8",errors="replace")
    am=re.search(r"concrete\s+\w+\s+of\s+(\w+)\s*=",concrete)
    if not am:
        print(f"FAIL cannot resolve abstract for {concrete_path.name}")
        scenario_symbols_ok=False; continue
    abstract_path=concrete_path.with_name(am.group(1)+".gf")
    if not abstract_path.exists():
        print(f"FAIL missing abstract {abstract_path.name} for {concrete_path.name}")
        scenario_symbols_ok=False; continue
    abstract=abstract_path.read_text(encoding="utf-8",errors="replace")
    # Dictionary/MorphoDict smoke scenarios linearize arbitrary dictionary
    # functions rather than campaign Probe functions; their own validators own
    # that coverage.
    if not re.search(r"\bcat\s+Probe\b", abstract):
        continue
    abs_ids=set(re.findall(r"^\s*([A-Za-z][A-Za-z0-9_]*)\s*:\s*Probe\s*;",abstract,re.M))
    con_ids=set(re.findall(r"^\s*([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{",concrete,re.M))
    scenario_ids=set(re.findall(r"^l\s+([A-Za-z][A-Za-z0-9_]*)\s*$",txt,re.M))
    missing_abs=scenario_ids-abs_ids
    missing_con=scenario_ids-con_ids
    if missing_abs or missing_con:
        print(f"FAIL scenario symbol coverage {scenario.name}: abstract={sorted(missing_abs)} concrete={sorted(missing_con)}")
        scenario_symbols_ok=False
require(scenario_symbols_ok,"all scenario linearization symbols exist in abstract and concrete inputs")

if failures:
    print(f"\n{len(failures)} nominal architecture checks failed")
    sys.exit(1)
print("\nPASS nominal architecture guardrails")
