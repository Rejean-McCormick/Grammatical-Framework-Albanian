from __future__ import annotations
from pathlib import Path
import hashlib, re, sys

ROOT=Path(__file__).resolve().parents[2]
SRC=ROOT/'AlbanianSQI/GF/lib/src/albanian'
errors=[]
def need(cond,msg):
    if not cond: errors.append(msg)
def txt(name): return (SRC/name).read_text(encoding='utf-8')

res=txt('ResSqi.gf'); clause=txt('ClauseSqiRes.gf'); verb=txt('VerbSqi.gf')
morph=txt('MorphoSqi.gf'); paradigms=txt('ParadigmsSqi.gf'); idiom=txt('IdiomSqi.gf')
bridge=txt('ExtendSqiVPBridge.gf'); extraabs=txt('ExtraSqiAbs.gf'); extra=txt('ExtraSqi.gf')

need('Tense = Pres | Perfect | Imperfect | Aorist' in res,'internal Tense must distinguish Perfect/Imperfect/Aorist')
need('ParamX.Past => Imperfect' in res,'common TPast must map to Imperfect')
need('ParamX.Past => Aorist' not in res,'common TPast must never map to Aorist')
need('MorphVoice = ActiveMorph | NonActiveMorph' in res,'MorphVoice missing')
need('VoiceUse = PlainUse | PassiveUse | ReflexiveUse | ReciprocalUse' in res,'VoiceUse missing')
need('Progressivity = NeutralProgressive | Progressive' in res,'Progressivity missing')
need('perfectAux : MorphVoice' in res and 'beAux' in res and 'haveAux' in res,'voice-sensitive perfect auxiliary selection missing')
need('aorAnteriorAux : MorphVoice' in res,'explicit aorist-anterior auxiliary selection missing')

# Every morphology V literal must carry a voice tag.
records=len(re.findall(r'\blin V\s*\{',morph))
tags=len(re.findall(r'morphVoice\s*=\s*(?:ActiveMorph|NonActiveMorph)',morph))
need(records==tags,f'MorphoSqi lin V records/tags differ: {records}/{tags}')
nonactive={'031','037','039','040','041','046','061','063','096','097','123','124'}
starts=[(m.start(),m.group(1)) for m in re.finditer(r'(?m)^mkV(\d{3}) base =',morph)]
for i,(pos,num) in enumerate(starts):
    if num not in nonactive: continue
    end=starts[i+1][0] if i+1<len(starts) else len(morph)
    need('NonActiveMorph' in morph[pos:end],f'mkV{num} must be tagged NonActiveMorph')
need('behem_V = irregVFullNA' in txt('IrregSqi.gf'),'exact bëhem must be NonActiveMorph')

# Particle ownership / progressive anti-overgeneration.
need('ProgrVP vp = vp ** {progressivity=Progressive}' in idiom,'ProgrVP must set typed progressivity only')
need('cl="po"' not in idiom and 'subjcl="të" ++ "po"' not in idiom,'IdiomSqi must not inject po/të po')
need('progressivity = R.Progressive' in bridge,'ProgrVPSlash must set typed progressivity')
need('cl="po"' not in bridge,'Extend bridge must not inject po into clitic string')
need('<PlainUse,ParamX.Fut>' not in clause.split('realizeProgressive',1)[1].split('-- Main finite realization',1)[0],
     'progressive helper must not license future')
need('<PlainUse,ParamX.Cond>' not in clause.split('realizeProgressive',1)[1].split('-- Main finite realization',1)[0],
     'progressive helper must not license conditional')
need('Anter => nonExist' in clause,'progressive anterior must be nonExist')
need('Progressive => nonExist' in clause,'unsupported progressive moods must be blocked')

# Public semantic voice is separate from lexical morphological voice.
need('voiceUse = ReflexiveUse' in verb,'ReflVP must mark ReflexiveUse')
need('voiceUse = PassiveUse' in verb,'PassV2 must mark PassiveUse')
need('voiceUse = R.PassiveUse' in bridge,'Extend PassVPSlash must mark PassiveUse')
need('morphVoice = v.morphVoice' in verb,'baseVP must preserve lexical MorphVoice')

# Explicit Albanian extensions are present without changing common Tense.
for fn in ['AlbAoristS','AlbAoristAnteriorS','AlbOptativeS','AlbPerfectOptativeS','AlbAdmirativeS','AlbImperfectAdmirativeS','AlbGerundAdv','AlbPurposeAdv']:
    need(fn in extraabs and fn in extra,f'{fn} missing in Extra surface')

# Ordinary GF function abstraction must use \x ->; table abstraction uses \\x =>.
for p in [*SRC.glob('*.gf'), *(ROOT/'validation/verbal_advanced').glob('*.gf')]:
    src=p.read_text(encoding='utf-8')
    need(not re.search(r'\\\\[A-Za-z_][A-Za-z0-9_,]*\s*->',src),
         f'invalid table-abstraction slash before function arrow in {p.relative_to(ROOT)}')

# Direct old internal Past access must be gone from the working source/validation inputs.
for p in [*SRC.glob('*.gf'), *(ROOT/'validation/inputs').glob('*Sqi.gf')]:
    s=p.read_text(encoding='utf-8')
    bad=re.findall(r'(?<!ParamX\.)(?<!P\.)\bPast\b',s)
    # ResSqi module header intentionally subtracts ParamX Past by bare name.
    if p.name=='ResSqi.gf':
        s2=s.replace('ParamX-[Tense,Past,Pres]','ParamX-[Tense,Pres]')
        bad=re.findall(r'(?<!ParamX\.)(?<!P\.)\bPast\b',s2)
    need(not bad,f'legacy internal Past token remains in {p.relative_to(ROOT)}')

# Required baseline scenario count stays exactly 52.
project=(ROOT/'project.toml').read_text(encoding='utf-8')
m=re.search(r'required_scenarios\s*=\s*\[(.*?)\]',project,re.S)
if m:
    scenario_ids=re.findall(r'"([^"]+)"',m.group(1))
    need(len(scenario_ids)==52,f'project required_scenarios must remain 52, got {len(scenario_ids)}')
else:
    errors.append('required_scenarios not found in project.toml')
need('optional_scenarios = ["alb-verb-advanced"]' in project,
     'advanced verbal scenario must be registered as optional, not required')

# All source locks embedded in the 52 baseline .gfs files must match bytes.
sha_re=re.compile(r'^-- GF_WORDBENCH_INPUT_SHA256 ([0-9a-f]{64}) (.+)$',re.M)
for gfs in (ROOT/'validation/scenarios').glob('*.gfs'):
    for digest,rel in sha_re.findall(gfs.read_text(encoding='utf-8')):
        p=ROOT/rel
        need(p.exists(),f'{gfs.name}: locked input missing: {rel}')
        if p.exists():
            actual=hashlib.sha256(p.read_bytes()).hexdigest()
            need(actual==digest,f'{gfs.name}: SHA mismatch for {rel}: {digest} != {actual}')

# Public common Verb API coverage stays complete (29 operations in the supplied RGL abstract).
verb_ops=['UseV','ComplVV','ComplVS','ComplVQ','ComplVA','SlashV2a','Slash2V3','Slash3V3',
          'SlashV2V','SlashV2S','SlashV2Q','SlashV2A','ComplSlash','SlashVV','SlashV2VNP',
          'ReflVP','UseComp','PassV2','AdvVP','ExtAdvVP','AdVVP','AdvVPSlash','AdVVPSlash',
          'VPSlashPrep','CompAP','CompNP','CompAdv','CompCN','UseCopula']
for op in verb_ops:
    need(re.search(r'(?m)^\s*'+re.escape(op)+r'\b.*=',verb) is not None, f'common Verb operation missing: {op}')

# Canonical compile census remains 51 language + 5 API + 2 MorphoDict = 58.
srcroot=ROOT/'AlbanianSQI/GF/lib/src'
language=list((srcroot/'albanian').glob('*.gf'))
api=[srcroot/x for x in ['CombinatorsSqi.gf','ConstructorsSqi.gf','SymbolicSqi.gf','SyntaxSqi.gf','TrySqi.gf']]
morphodict=list((srcroot/'morphodict').glob('MorphoDictSqi*.gf'))
need(len(language)==51,f'language GF census must remain 51, got {len(language)}')
need(sum(x.exists() for x in api)==5,'API facade census must remain 5')
need(len(morphodict)==2,f'MorphoDict GF census must remain 2, got {len(morphodict)}')

# Advanced scenario source locks must match too.
advanced_gfs=ROOT/'validation/scenarios/alb-verb-advanced.gfs'
if advanced_gfs.exists():
    for digest,rel in sha_re.findall(advanced_gfs.read_text(encoding='utf-8')):
        target=ROOT/rel
        need(target.exists(),f'advanced scenario locked input missing: {rel}')
        if target.exists():
            actual=hashlib.sha256(target.read_bytes()).hexdigest()
            need(actual==digest,f'advanced scenario SHA mismatch for {rel}: {digest} != {actual}')

# Advanced matrix/campaign identities must be complete, sequential and aligned.
exp=ROOT/'validation/verbal_advanced/VERBAL_MATRIX_EXPECTATIONS.tsv'
need(exp.exists(),'advanced verbal matrix expectations missing')
if exp.exists():
    import csv
    with exp.open(encoding='utf-8', newline='') as fh:
        matrix=list(csv.DictReader(fh, delimiter='\t'))
    expected_ids=[f'V{i:03d}' for i in range(1,99)]
    matrix_ids=[r.get('case_id','') for r in matrix]
    need(matrix_ids==expected_ids, 'advanced matrix IDs must be exactly V001..V098 in order')
    allowed_status={'gold-candidate','linguistic-review-required','external-source-backed'}
    need(all(r.get('status') in allowed_status for r in matrix),'advanced matrix contains unknown status')
    abs_src=(ROOT/'validation/inputs/AlbVerbAdvanced.gf').read_text(encoding='utf-8')
    conc_src=(ROOT/'validation/inputs/AlbVerbAdvancedSqi.gf').read_text(encoding='utf-8')
    gfs_src=(ROOT/'validation/scenarios/alb-verb-advanced.gfs').read_text(encoding='utf-8')
    abs_ids=re.findall(r'(?m)^\s*(V\d{3})\s*:\s*Probe\s*;',abs_src)
    conc_ids=re.findall(r'(?m)^\s*(V\d{3})\s*=\s*\{s\s*=',conc_src)
    gfs_ids=re.findall(r'(?m)^l\s+(V\d{3})\s*$',gfs_src)
    need(abs_ids==expected_ids, 'advanced abstract must define V001..V098 exactly once/in order')
    need(conc_ids==expected_ids, 'advanced concrete must linearize V001..V098 exactly once/in order')
    need(gfs_ids==expected_ids, 'advanced .gfs must execute V001..V098 exactly once/in order')
    need(len(matrix)>=80,f'advanced verbal matrix too small: {len(matrix)}')

if errors:
    print('FAIL')
    for e in errors: print('-',e)
    sys.exit(1)
print('PASS')
print(f'Morpho V records tagged: {records}/{tags}')
print('Baseline required scenarios: 52')
print('Advanced verbal matrix cases:', len(matrix) if exp.exists() else 0)
