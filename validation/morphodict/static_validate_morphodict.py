from pathlib import Path
import re, json, sys
ROOT=Path(__file__).resolve().parents[2]
GF=ROOT/'AlbanianSQI/GF/lib/src/morphodict'
absf=GF/'MorphoDictSqiAbs.gf'
conf=GF/'MorphoDictSqi.gf'
A=absf.read_text(encoding='utf-8'); C=conf.read_text(encoding='utf-8')
af=re.findall(r'^\s{2}(.+?)\s*:\s*([A-Za-z0-9]+)\s*;\s*$',A,re.M)
cl=re.findall(r'^\s{2}(.+?)\s*=\s*.+?;\s*$',C,re.M)
funids=[x[0] for x in af]
linids=[x for x in cl if x in set(funids)]
checks=[]
def ck(name,ok,detail=''):
 checks.append((name,ok,detail)); print(('PASS' if ok else 'FAIL'),name,detail)
ck('abstract funcs unique',len(funids)==len(set(funids)),str(len(funids)))
ck('concrete lin coverage',set(funids)==set(linids),f'fun={len(funids)} lin={len(linids)}')
ck('no variants keyword','variants' not in C)
cv=json.loads((ROOT/'docs/morphodict/COVERAGE.json').read_text(encoding='utf-8'))
ck('coverage entry count',cv['entry_count']==len(funids),str(cv['entry_count']))
ck('all 22 IrregSqi verbs included',cv['irregular_verbs_included']==22)
ck('Tosk reference represented',cv['tosk_reference_unique_lemma_pos']>200,str(cv['tosk_reference_unique_lemma_pos']))
ck('cilido explicit declined derivation','cilido_A = lin A' in C and 'SN.which_IQuant.s' in C and '+ "do"' in C)
ck('Prelude boolean scope','open Prelude, ParadigmsSqi' in C)
ck('Tosk smart entries compile-safe',cv['quality_counts'].get('compile-safe-placeholder')==155 and cv['quality_counts'].get('smart-generated',0)==0,str(cv['quality_counts']))
ck('lock-safe placeholder constructors','invariantN : Str -> N = \\x -> lin N {' in C and 'invariantA : Str -> A = \\x -> lin A {' in C and 'invariantV : Str -> V' in C)
ck('entry count substantial',len(funids)>=300,str(len(funids)))
raise SystemExit(0 if all(x[1] for x in checks) else 1)
