from pathlib import Path
import json,re,collections
ROOT=Path(__file__).resolve().parents[2]
GF=ROOT/'AlbanianSQI/GF/lib/src/albanian'
v=json.loads((ROOT/'docs/dictionary/DICT_SQI_VALIDATION.json').read_text(encoding='utf-8'))
a=(GF/'DictSqiAbs.gf').read_text(encoding='utf-8')
c=(GF/'DictSqi.gf').read_text(encoding='utf-8')
abs_ids=re.findall(r'^\s*([a-z][A-Za-z0-9_]*)\s*:\s*([A-Za-z0-9_]+)\s*;',a,re.M)
con_ids=re.findall(r'^\s*([a-z][A-Za-z0-9_]*)\s*=\s*',c.split('\nlin\n',1)[1],re.M)
checks=[('entry count',len(abs_ids)==v['dictionary_entries']),('unique abstract IDs',len(abs_ids)==len(set(x for x,_ in abs_ids))),('abstract/concrete inventory',collections.Counter(x for x,_ in abs_ids)==collections.Counter(con_ids)),('balanced braces',a.count('{')==a.count('}') and c.count('{')==c.count('}')),('no MorphoDict module','abstract MorphoDictSqi' not in a and 'concrete MorphoDictSqi' not in c),('baseline preservation recorded',v['baseline_preserved'] is True),('legacy suffix types normalized',all(x not in dict(abs_ids) or dict(abs_ids)[x]==typ for x,typ in {'lehte_A2V':'A2','mundshem_AS':'A','zbavites_AV':'A','bie_shi_V0':'V'}.items())),('unreviewed imports use lock-safe placeholders','invariantN : Str -> N = \\x -> lin N {' in c and 'invariantA : Str -> A = \\x -> lin A {' in c and 'invariantV : Str -> V' in c and 'bota_N = invariantN' in c and 'autoritar_A = invariantA' in c and 'aftesi_mendore_V = invariantV' in c)]
for n,ok in checks: print(('PASS' if ok else 'FAIL'),n)
raise SystemExit(0 if all(ok for _,ok in checks) else 1)
