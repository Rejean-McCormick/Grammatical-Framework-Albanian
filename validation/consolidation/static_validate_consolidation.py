from pathlib import Path
import re, sys, tomllib, json
ROOT=Path(__file__).resolve().parents[2]
SRC=ROOT/'AlbanianSQI/GF/lib/src/albanian'
checks=[]
def ck(name, cond, detail=''):
    checks.append((name,bool(cond),str(detail)))
def text(name): return (SRC/name).read_text(encoding='utf-8',errors='replace')

res=text('ResSqi.gf'); cat=text('CatSqi.gf'); par=text('ParadigmsSqi.gf'); clause=text('ClauseSqiRes.gf')
verb=text('VerbSqi.gf'); rel=text('RelativeSqi.gf'); extra=text('ExtraSqi.gf'); scaff=text('ExtendSqiScaffolding.gf')
active=list(SRC.glob('*.gf'))
allgf='\n'.join(p.read_text(encoding='utf-8',errors='replace') for p in active)

# Repository/census invariants.
lang=list(SRC.glob('*.gf'))
api=[ROOT/'AlbanianSQI/GF/lib/src'/n for n in ['CombinatorsSqi.gf','ConstructorsSqi.gf','SymbolicSqi.gf','SyntaxSqi.gf','TrySqi.gf']]
morph=list((ROOT/'AlbanianSQI/GF/lib/src/morphodict').glob('MorphoDictSqi*.gf'))
ck('language census 51',len(lang)==51,len(lang)); ck('API facades 5',all(p.exists() for p in api),sum(p.exists() for p in api)); ck('MorphoDict targets 2',len(morph)==2,len(morph))

cfg=tomllib.loads((ROOT/'project.toml').read_text(encoding='utf-8'))['validation']
scenario_files={p.stem:p for p in (ROOT/'validation').rglob('*.gfs')}
ck('required scenarios remain 52',len(cfg['required_scenarios'])==52,len(cfg['required_scenarios']))
ck('all required scenario artifacts exist',all(x in scenario_files for x in cfg['required_scenarios']))
ck('all optional scenario artifacts resolve',all(x in scenario_files for x in cfg.get('optional_scenarios',[])),len(cfg.get('optional_scenarios',[])))

# Syntax hygiene independent of GF compiler.
ck('no merge conflict markers',not any(tok in allgf for tok in ['<<<<<<<','=======\n>>>>>>>','>>>>>>>']))
bad_controls=[]; bad_braces=[]
for p in active:
    b=p.read_bytes()
    if any(x<32 and x not in (9,10,13) for x in b): bad_controls.append(p.name)
    s=p.read_text(encoding='utf-8',errors='replace')
    if s.count('{')!=s.count('}'): bad_braces.append(p.name)
ck('no unexpected control chars',not bad_controls,','.join(bad_controls)); ck('balanced GF braces',not bad_braces,','.join(bad_braces))

# Consolidated type contract.
ck('five grammatical cases','Case = Nom | Acc | Gen | Dat | Ablat' in res)
ck('four noun morph cases','MorphCase = MNom | MAcc | MDat | MAblat' in res)
ck('Gen syncretizes at morphology boundary','Gen => MDat' in res)
ck('number-sensitive noun gender','s : Species => MorphCase => Number => Str ; g : Number => Gender' in res)
ck('grammatical CN boundary','CNoun : Type = {s : Species => Case => Number => Str ; g : Number => Gender}' in res and 'CN = CNoun' in cat)
ck('typed adjective morphology','Adj : Type = {s : Gender => Number => Str ; cls : Number => AdjClass}' in res)
ck('typed clitic cluster','CliticCluster : Type' in res and 'clitics : CliticCluster' in res)
ck('typed voice/progressivity','MorphVoice = ActiveMorph | NonActiveMorph' in res and 'Progressivity = NeutralProgressive | Progressive' in res and 'voiceUse : VoiceUse' in res)
ck('slash gap payload','VPSlash : Type = VP ** {c2 : Compl ; gapPost : Agr => Agr => Str}' in res)

# C8 valence data retained through Cat/Paradigms/Verb.
ck('VS scomp carrier','VS = Verb ** {scomp : Str}' in cat)
ck('V2S scomp carrier','V2S = Verb ** {c2,c3 : Compl ; scomp : Str}' in cat)
ck('Paradigms builds scomp','mkVSCore' in par and 'scomp=c' in par and 'mkV2SCore' in par)
ck('Verb consumes scomp','vs.scomp ++ s.s' in verb and 'v2s.scomp ++ s.s' in verb)

# C1 morphology API retained.
for sym in ['reg2N','reg3N','reg2A','reg3A','reg2V','reg3V','reg4V','mkNFullGenders','mkAFull','mkVFull','mkNonActiveVFull','legacyIrregSubjunctive']:
    ck('Paradigms '+sym, sym in par)

# C4/C5 clause capabilities retained simultaneously.
for sym in ['realizeProgressive','realizeAoristVP','realizeAoristAnteriorVP','realizeOptativeVP','realizePerfectOptativeVP','realizeAdmirativeVP','realizeImperfectAdmirativeVP','realizeGerundPolVP','realizePurposeVP']:
    ck('Clause '+sym,sym in clause)
ck('common TPast -> Imperfect','ParamX.Past => Imperfect' in res and 'ParamX.Past=>Imperfect' in clause)
ck('clitics flattened centrally','flattenClitics vp.clitics' in clause)
ck('Extra realizer references resolve',all(sym in clause for sym in set(re.findall(r'\b(realize[A-Z][A-Za-z0-9_]*VP)\b',extra))))

# Relative/public API behavior retained without English stranding.
ck('declined cili retained','<Gen,GSg Fem>  => "së" ++ "cilës"' in rel and '<Nom,GPl Fem>  => "të" ++ "cilat"' in rel)
ck('empty relative uses qe and overt cili','sc_RelativeCili' in scaff and 'Predef.PTrue => "që"' in scaff)
ck('stranding neutralized to pied-piping','sc_StrandRelSlash rp slash ->' not in scaff and 'sc_PiedPipingRelSlash rp slash' in scaff)

# Migration anti-patterns caught during consolidation.
ck('no scalar cn.g in Question','idet.s ! c ! cn.g' not in text('QuestionSqi.gf') and 'agrgP3 cn.g' not in text('QuestionSqi.gf'))
ck('no CN passed to nounForm',not re.search(r'\bnounForm\s+cn\b',allgf))
ck('no legacy pronoun weak-string fields','.acc_clit' not in allgf and '.dat_clit' not in allgf and 'acc_clit :' not in allgf and 'dat_clit :' not in allgf)

# Direct record completeness heuristics.
def balanced_block(s,start):
    o=s.find('{',start); d=0; ins=False; esc=False
    for i in range(o,len(s)):
        c=s[i]
        if ins:
            if esc: esc=False
            elif c=='\\': esc=True
            elif c=='"': ins=False
        else:
            if c=='"': ins=True
            elif c=='{': d+=1
            elif c=='}':
                d-=1
                if d==0:return s[start:i+1]
    return s[start:]
miss=[]
for p in active:
    s=p.read_text(encoding='utf-8',errors='replace')
    for m in re.finditer(r'\blin\s+V\s*\{',s):
        b=balanced_block(s,m.start())
        for f in ['morphVoice','perfectAux']:
            if f not in b: miss.append(f'{p.name}:{s.count(chr(10),0,m.start())+1}:{f}')
ck('direct lin V metadata complete',not miss,','.join(miss[:20]))

# Preservation/quarantine policy.
variants=ROOT/'development/consolidation_variants'
ck('conflicting workstream variants preserved',variants.exists() and len(list(variants.rglob('*.gf')))>=100,len(list(variants.rglob('*.gf'))) if variants.exists() else 0)

for name,ok,detail in checks:
    print(('PASS' if ok else 'FAIL'),name,detail)
failed=[x for x in checks if not x[1]]
print('SUMMARY',len(checks)-len(failed),'/',len(checks),'passed')
if failed:
    print('FAILED',json.dumps([x[0] for x in failed],ensure_ascii=False))
raise SystemExit(1 if failed else 0)
