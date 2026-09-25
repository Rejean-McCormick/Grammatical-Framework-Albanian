#!/usr/bin/env python3
from __future__ import annotations
from pathlib import Path
import re, sys, json

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "AlbanianSQI/GF/lib/src"
ALB = SRC / "albanian"
errors=[]; checks=[]

def check(name, cond, detail=""):
    checks.append((name,bool(cond),detail))
    if not cond: errors.append(f"{name}: {detail}")

def text(p): return p.read_text(encoding="utf-8")

# Protected baseline count must not be changed by C9 test additions.
check("protected_scenario_count", len(list((ROOT/"validation/scenarios").glob("*.gfs"))) == 52,
      f"found {len(list((ROOT/'validation/scenarios').glob('*.gfs')))}")

struct=text(ALB/"StructuralSqiClause.gf")
check("from_Prep_nga_nom", 'from_Prep : Compl = mkCompl "nga" Nom ;' in struct)
check("agent_Prep_nga_nom", 'by8agent_Prep : Compl = mkCompl "nga" Nom ;' in struct)
# Case-government cells explicitly supported by the supplied Lesson 20 table.
for name,form,case in [
    ("in_Prep","në","Acc"), ("with_Prep","me","Acc"),
    ("without_Prep","pa","Acc"), ("for_Prep","për","Acc"),
    ("on_Prep","mbi","Acc"), ("under_Prep","nën","Acc"),
    ("part_Prep","prej","Ablat"), ("during_Prep","gjatë","Ablat"),
    ("before_Prep","para","Ablat"), ("between_Prep","midis","Ablat"),
]:
    check("prep_government_"+name, f'{name} : Compl = mkCompl "{form}" {case} ;' in struct, f"{form}/{case}")
nominal=text(ALB/"StructuralSqiNominal.gf")
check("this_quant_acc_pl_masc", '"këtë"  "këta"' in nominal)
check("this_quant_acc_pl_fem", '"këtë"  "këto"' in nominal)
check("some_sg_standard_ndonje", 'someSg_Det = SR.mkDetInv "ndonjë" Sg' in nominal)
check("some_pl_disa", 'somePl_Det = SR.mkDetInv "disa" Pl' in nominal)
check("it_pron_unspecified_gender_fem_default", 'mkPron "ajo" "atë" "asaj" "asaj" "e" "i" (GSg Fem) P3' in nominal)
check("they_pron_unspecified_gender_fem_default", 'mkPron "ato" "ato" "atyre" "atyre" "i" "u" GPl P3' in nominal)
# Distal demonstrative cells from the same supplied Lesson 30 paradigm.
for fragment in [
    '"ai"   "ata"   "ajo"  "ato"',
    '"atë"  "ata"   "atë"  "ato"',
    '"atij" "atyre" "asaj" "atyre"',
]:
    check("that_quant_table_"+str(len([c for c in checks if c[0].startswith("that_quant_table_")])), fragment in nominal, fragment)
# High-confidence free-pronoun cells from the supplied personal-pronoun table.
for fragment in [
    'mkPron "unë" "mua" "mua" "meje"',
    'mkPron "ti" "ty" "ty" "teje"',
    'mkPron "ne" "ne" "neve" "nesh"',
]:
    check("pronoun_table_"+str(len([c for c in checks if c[0].startswith("pronoun_table_")])), fragment in nominal, fragment)

comb=text(SRC/"CombinatorsSqi.gf")
check("combinators_subtracts_appCN", "Combinators - [appCN, appCNc]" in comb)
check("combinators_uses_noun_owner", "(Noun = NounSqi)" in comb)
check("combinators_appCN_possnp", re.search(r'appCN\s*:[^=]+=[^;]+PossNP\s+cn\s+x',comb,re.S) is not None)
check("combinators_appCNc_possnp", "PossNP cn np" in comb)

trys=text(SRC/"TrySqi.gf")
for sig in ["mkAdv : Str -> Adv", "mkAdN : CAdv -> AdN", "mkAdN : Str -> AdN", "mkOrd : Str -> Ord"]:
    check("try_overload_"+sig.split(':')[0].strip()+"_"+str(len([c for c in checks if c[0].startswith('try_overload_')])), sig in trys, sig)
for excluded in ["mkCard","mkDet","mkIAdv","mkIDet","mkIP","mkPConj","mkQuant","mkVoc"]:
    check("try_keeps_lowlevel_excluded_"+excluded, re.search(r'ParadigmsSqi\s*-\s*\[(.*?)\]',trys,re.S) and excluded in re.search(r'ParadigmsSqi\s*-\s*\[(.*?)\]',trys,re.S).group(1))

extend=text(ALB/"ExtendSqi.gf")
check("extend_owns_SlashBareV2S", re.search(r'ExtendFunctor\s*-\s*\[(.*?)\]',extend,re.S) and "SlashBareV2S" in re.search(r'ExtendFunctor\s*-\s*\[(.*?)\]',extend,re.S).group(1))
check("extend_wires_SlashBareV2S", "SlashBareV2S x1 x2 = lin VPSlash (sc_SlashBareV2S" in extend)

scaf=text(ALB/"ExtendSqiScaffolding.gf")
check("pied_relative_preposition_uses_explicit_cili", "Predef.eqStr slash.c2.s []" in scaf and "sc_RelativeCili slash.c2.c agr.gn" in scaf)
check("strand_question_no_postposed_prep", "sc_PiedPipingQuestSlash ip slash" in scaf)
check("strand_relative_no_postposed_prep", "sc_PiedPipingRelSlash rp slash" in scaf)
check("empty_relative_explicit", "sc_RelativeCili slash.c2.c agr.gn" in scaf)
check("empty_relative_no_prep_uses_qe", 'Predef.PTrue => "që" ++ slash.s!t!a!p' in scaf)
for form in ["i cili","të cilin","të cilit","e cila","të cilën","së cilës","të cilët","të cilëve"]:
    check("relative_form_"+re.sub(r'\W+','_',form), f'"{form}"' in scaf, form)
smoke_abs = text(ROOT/"validation/c9/inputs/AlbC9ResourceSmoke.gf")
smoke_cnc = text(ROOT/"validation/c9/inputs/AlbC9ResourceSmokeSqi.gf")
check("empty_relative_no_prep_smoke_declared", "C9_EMPTY_REL_NOPREP" in smoke_abs)
check("empty_relative_no_prep_smoke_implemented", "probeSlashBare" in smoke_cnc and "C9_EMPTY_REL_NOPREP" in smoke_cnc)
check("pronoun_default_smokes_declared", "C9_IT_PRON_NOM" in smoke_abs and "C9_THEY_PRON_NOM" in smoke_abs)
check("pronoun_default_smokes_implemented", "St.it_Pron.s ! Nom" in smoke_cnc and "St.they_Pron.s ! Nom" in smoke_cnc)

doc=text(ALB/"DocumentationSqi.gf")
check("documentation_InflectionCl", re.search(r'\bInflectionCl\s+x\s*=\s*\{',doc) is not None)
for tense in ["ParamX.Pres","ParamX.Past","ParamX.Fut","ParamX.Cond"]:
    check("documentation_cl_"+tense.split('.')[-1], tense in doc)
check("documentation_cl_polarity", "! Pos" in doc and "! Neg" in doc)

# Public facade-only smoke contract.
api_smoke = ROOT/"validation/c9/api/AlbC9PublicAPISmokeSqi.gf"
check("public_api_smoke_exists", api_smoke.exists(), str(api_smoke))
if api_smoke.exists():
    api = text(api_smoke)
    for module in ["SyntaxSqi","ConstructorsSqi","CombinatorsSqi","TrySqi","SymbolicSqi","LexiconSqi"]:
        check("public_api_import_"+module, module in api, module)
    for forbidden in ["ResSqi","CatSqi","ExtendSqiScaffolding"]:
        check("public_api_avoids_internal_"+forbidden, forbidden not in api, forbidden)
    for probe in ["API_SYNTAX_SENTENCE","API_CONSTRUCTORS_SENTENCE","API_COMBINATOR_POSSESSION","API_TRY_ADV","API_TRY_ADN","API_TRY_ORD","API_SYMBOLIC_NP"]:
        check("public_api_probe_"+probe, probe in api, probe)

# Documentation / Markup / Symbol release-surface smoke contract.
release_abs = ROOT/"validation/c9/release/AlbC9ReleaseSurfaceSmoke.gf"
release_cnc = ROOT/"validation/c9/release/AlbC9ReleaseSurfaceSmokeSqi.gf"
release_gfs = ROOT/"validation/c9/release/c9-release-surface-smoke.gfs"
for name,path in [("release_abs",release_abs),("release_cnc",release_cnc),("release_gfs",release_gfs)]:
    check(name+"_exists", path.exists(), str(path))
if release_abs.exists():
    check("release_abstract_composes_lang_symbol", "Lang, Symbol" in text(release_abs))
if release_cnc.exists():
    rc=text(release_cnc)
    check("release_concrete_composes_LangSqi", "LangSqi" in rc)
    check("release_concrete_composes_SymbolSqi", "SymbolSqi" in rc)
if release_gfs.exists():
    rg=text(release_gfs)
    for token in ["InflectionN","InflectionA","InflectionV","InflectionPrep","InflectionCl","MarkupNP","MarkupCN","MarkupAP","MarkupS","SymbPN","SymbS"]:
        check("release_probe_"+token, token in rg, token)

# Static surface parity against supplied abstract snapshot, using function-name presence.
rgl = Path('/mnt/data/c9_work/rgl/gf-rgl-master/src/abstract')
areas = {
  'Structural': ('Structural.gf', ALB/'StructuralSqi.gf'),
  'Extend': ('Extend.gf', ALB/'ExtendSqi.gf'),
  'Markup': ('Markup.gf', ALB/'MarkupSqi.gf'),
  'Symbol': ('Symbol.gf', ALB/'SymbolSqi.gf'),
  'Documentation': ('Documentation.gf', ALB/'DocumentationSqi.gf'),
}
# Aggregators inherit/wire names indirectly, so for Structural also search companion modules; Extend direct coordinator expected.
search_text = {
 'Structural': '\n'.join(text(p) for p in ALB.glob('StructuralSqi*.gf')),
 'Extend': extend,
 'Markup': text(ALB/'MarkupSqi.gf'),
 'Symbol': text(ALB/'SymbolSqi.gf'),
 'Documentation': doc,
}

def abstract_fun_names(s):
    # strip line comments; capture identifiers preceding ':' in fun blocks.
    s=re.sub(r'--.*','',s)
    names=[]
    in_fun=False
    for line in s.splitlines():
        st=line.strip()
        if st.startswith('fun'):
            in_fun=True; st=st[3:].strip()
        elif re.match(r'^(cat|flags|def|data|param|oper|lincat|lin)\b',st):
            in_fun=False
        if in_fun:
            # declarations may be comma grouped. Extract each name before comma/colon conservatively.
            if ':' in st:
                left=st.split(':',1)[0]
                for n in re.findall(r'\b[A-Za-z_][A-Za-z0-9_]*\b',left):
                    if n not in {'fun'}: names.append(n)
    return sorted(set(names))

parity={}
for area,(af,_) in areas.items():
    ap=rgl/af
    if not ap.exists():
        continue
    names=abstract_fun_names(text(ap))
    missing=[n for n in names if re.search(r'\b'+re.escape(n)+r'\b', search_text[area]) is None]
    parity[area]={'abstract_count':len(names),'missing_static':missing}
    check("surface_"+area+"_no_missing_static", not missing, ', '.join(missing))

# Basic delimiter balance on changed GF files; not a substitute for GF parser.
changed=[
 SRC/'CombinatorsSqi.gf', SRC/'TrySqi.gf', ALB/'StructuralSqiClause.gf', ALB/'StructuralSqiNominal.gf', ALB/'ExtendSqi.gf',
 ALB/'ExtendSqiScaffolding.gf', ALB/'DocumentationSqi.gf',
 ROOT/'validation/c9/inputs/AlbC9ResourceSmoke.gf', ROOT/'validation/c9/inputs/AlbC9ResourceSmokeSqi.gf',
 ROOT/'validation/c9/api/AlbC9PublicAPISmoke.gf', ROOT/'validation/c9/api/AlbC9PublicAPISmokeSqi.gf',
 ROOT/'validation/c9/release/AlbC9ReleaseSurfaceSmoke.gf', ROOT/'validation/c9/release/AlbC9ReleaseSurfaceSmokeSqi.gf'
]
for p in changed:
    s=text(p)
    # remove strings and line comments before coarse delimiter counting.
    x=re.sub(r'"(?:\\.|[^"\\])*"','""',s)
    x=re.sub(r'--.*','',x)
    for op,cl in [('(',')'),('[',']'),('{','}')]:
        check(f"balance_{p.name}_{op}", x.count(op)==x.count(cl), f"{op}={x.count(op)} {cl}={x.count(cl)}")

report={
 'status':'PASS' if not errors else 'FAIL',
 'checks':len(checks),
 'failed':errors,
 'parity':parity,
 'note':'Static validation only; GF 3.12 compiler and Wordbench execution were not available in this environment.'
}
print(json.dumps(report,ensure_ascii=False,indent=2))
Path(__file__).with_name('reports').mkdir(exist_ok=True)
(Path(__file__).with_name('reports')/'STATIC_VALIDATION.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n",encoding='utf-8')
sys.exit(1 if errors else 0)
