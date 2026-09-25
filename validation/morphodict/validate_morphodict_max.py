#!/usr/bin/env python3
"""Static C2 gate for the MorphoDictSqi MAX candidate.
Native GF/Wordbench gates are reported separately and cannot be faked here.
"""
from pathlib import Path
import csv,json,re,sys,subprocess,hashlib
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/morphodict'))
from morpho_static import MorphoInspector,form_matches
GF=ROOT/'AlbanianSQI/GF/lib/src/morphodict'
DOC=ROOT/'docs/morphodict';RES=ROOT/'resources/morphodict';VAL=ROOT/'validation/morphodict'
checks=[]
def ck(name,ok,detail=''):
    checks.append((name,bool(ok),detail)); print(('PASS' if ok else 'FAIL'),name,detail)
def load_jsonl(p): return [json.loads(x) for x in p.read_text(encoding='utf-8').splitlines() if x.strip()]
A=(GF/'MorphoDictSqiAbs.gf').read_text(encoding='utf-8');C=(GF/'MorphoDictSqi.gf').read_text(encoding='utf-8')
af=re.findall(r'^\s{2}(.+?)\s*:\s*([A-Za-z0-9]+)\s*;\s*$',A,re.M);fun=[x[0] for x in af]
cl=re.findall(r'^\s{2}([^\s=]+)\s*=\s*(.+?)\s*;\s*$',C,re.M);lins=[x[0] for x in cl if x[0] in set(fun)]
lm=load_jsonl(RES/'LEMGRAMS.jsonl'); ev=load_jsonl(RES/'EVIDENCE.jsonl'); cand=load_jsonl(RES/'CANDIDATES.jsonl'); dep=load_jsonl(DOC/'DEPENDENCIES.jsonl')
met=json.loads((DOC/'METRICS.json').read_text(encoding='utf-8'));man=json.loads((DOC/'MANIFEST.json').read_text(encoding='utf-8'))
ck('abstract IDs unique',len(fun)==len(set(fun)),str(len(fun)))
ck('abstract/concrete bijection',set(fun)==set(lins),f'fun={len(fun)} lin={len(lins)}')
ck('LEMGRAMS matches active GF',len(lm)==len(fun) and {x['function_id'] for x in lm}==set(fun),str(len(lm)))
ck('active count reconciled',len(fun)==560 and man['entry_count']==560 and met['active_after']==560)
ck('no variants','variants' not in C)
ck('no compile-safe placeholder',all(x['quality']!='compile-safe-placeholder' and not x.get('placeholder') for x in lm))
ck('no invariantN/invariantA fallback','invariantN' not in C and 'invariantA' not in C)
# invariantV remains only for three pre-existing exact RGL entries, not Tosk fallback.
inv_ids=[m.group(1) for m in re.finditer(r'^\s{2}([^\s=]+)\s*=\s*invariantV\s+',C,re.M)]
ck('invariantV limited to declared baseline exact entries',set(inv_ids)=={'duhet_V','fle_V','mund_V'},','.join(inv_ids))
ck('no active multiword',not any(' ' in x['base'].strip() for x in lm))
ck('all active provenance labels present',all(x.get('source_label') for x in lm))
ck('no static C6 overclaim',all(x['certification_level'] in {'C1','C2'} for x in lm) and met['certified_C6']==0,str(met['certification_counts']))
blocked=list(csv.DictReader((DOC/'BLOCKED.csv').open(encoding='utf-8')))
ck('32 unresolved placeholders removed',len(blocked)==32 and not ({x['id'] for x in blocked}&set(fun)),str(len(blocked)))
ck('123 placeholders resolved explicitly',met['placeholders_resolved_to_explicit_existing_class']==123)
ck('placeholder count zero',met['placeholder_after']==0 and man['placeholder_count']==0)
ck('source universe fully classified',len(cand)==met['source_universe_candidate_records'] and all(x.get('terminal_state') for x in cand) and met['source_universe_unclassified']==0,str(len(cand)))
ck('dependency coverage',len(dep)==len(lm) and {x['function_id'] for x in dep}==set(fun),str(len(dep)))
ck('Tosk evidence inventory present',len(ev)>200,str(len(ev)))
# Re-check every evidence-matched numbered class against every recorded form.
ins=MorphoInspector(ROOT)
tosk={(r['lemma'],r['category']):r for r in csv.DictReader((RES/'TOSK_REFERENCE_LEMMAS.tsv').open(encoding='utf-8'),delimiter='\t')}
static_ok=True; bad=[]; resolved_count=0
for x in lm:
    if x['quality']!='evidence-matched-explicit-class': continue
    resolved_count+=1
    cls=x.get('resolved_class'); rr=ins.evaluate_class(cls,x['base']) if cls else None; tr=tosk.get((x['base'],x['category']))
    forms=[s.strip() for s in tr['observed_forms'].split(',') if s.strip()] if tr else []
    ok=bool(rr and tr and all(form_matches(s,rr.surfaces) for s in forms))
    if x['category']=='N' and ok:
        need={'masculine':'Masc','feminine':'Fem'}.get(tr['gender']); ok=not(need and rr.gender and need!=rr.gender)
    if not ok: static_ok=False; bad.append(x['function_id'])
ck('123 explicit class/evidence matches reproducible',static_ok and resolved_count==123,','.join(bad[:10]))
# Queues reconcile.
miss=list(csv.DictReader((VAL/'missing_paradigms.tsv').open(encoding='utf-8'),delimiter='\t'))
triage=list(csv.DictReader((VAL/'core_escalation_candidates.tsv').open(encoding='utf-8'),delimiter='\t'))
brev=list(csv.DictReader((VAL/'blocked_review_queue.tsv').open(encoding='utf-8'),delimiter='\t'))
conf=list(csv.DictReader((VAL/'source_conflicts.tsv').open(encoding='utf-8'),delimiter='\t'))
rev=list(csv.DictReader((VAL/'review_queue.tsv').open(encoding='utf-8'),delimiter='\t'))
ck('blocked queues reconcile',len(brev)+len(conf)==32 and len(brev)==27 and len(conf)==5,f'C2-review={len(brev)} conflicts={len(conf)}')
ck('no unproven C1 missing-class claim',len(miss)==0,'proven missing classes='+str(len(miss)))
ck('core escalation triage is narrow',len(triage)==2,','.join(x['base'] for x in triage))
blocked_ids={x['id'] for x in blocked}
scenario_text='\n'.join(x.read_text(encoding='utf-8') for x in (ROOT/'validation/scenarios').glob('*.gfs'))
ck('blocked lemgrams absent from required scenarios',not any(re.search(r'\b'+re.escape(i)+r'\b',scenario_text) for i in blocked_ids))
ck('required scenario count preserved',len(list((ROOT/'validation/scenarios').glob('*.gfs')))==52,str(len(list((ROOT/'validation/scenarios').glob('*.gfs')))))
ck('review queue covers all non-C6 active',len(rev)==len(lm),str(len(rev)))
# Four duplicate base/category families are preserved for future TSIG discrimination, not silently merged.
from collections import defaultdict
g=defaultdict(list)
for x in lm:g[(x['base'],x['category'])].append(x['function_id'])
amb={k:v for k,v in g.items() if len(v)>1}
expected={('disa','Det'),('kush','IP'),('shumë','Det'),('çfarë','IP')}
ck('base/category homograph review set stable',set(amb)==expected,str(amb))
# No source mutation hidden: baseline 592-record input remains locked.
base=load_jsonl(RES/'BASELINE_LEMGRAMS_20260925.jsonl')
ck('baseline reconstruction input locked',len(base)==592,str(len(base)))
# Python tool compilation.
procs=[]
for p in sorted((ROOT/'tools/morphodict').glob('*.py'))+sorted((ROOT/'validation/morphodict').glob('*.py')):
    r=subprocess.run([sys.executable,'-m','py_compile',str(p)],capture_output=True,text=True);procs.append((p.name,r.returncode,r.stderr))
ck('Python tools compile',all(rc==0 for _,rc,_ in procs),';'.join(n for n,rc,_ in procs if rc))
# Native GF gate: report, never fabricate.
import shutil
gf=shutil.which('gf')
if gf:
    print('INFO native GF executable available:',gf,'(run external campaign command separately)')
else:
    print('NOT_EXECUTED native GF 3.12 gate: gf executable not available in this environment')
print('SUMMARY',sum(x[1] for x in checks),'/',len(checks),'static checks passed')
raise SystemExit(0 if all(x[1] for x in checks) else 1)
