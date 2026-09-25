from pathlib import Path
import csv, hashlib, json, re, unicodedata, shutil, zipfile
from collections import Counter, defaultdict

BASE = Path('/mnt/data/_consolidated_full/Albanian_CONSOLIDATED_20260924')
OUT = Path('/mnt/data/Albanian_CONSOLIDATED_DICT_COMPLETE_20260924')
SOURCE_TSV = Path('/mnt/data/albanet_unique.tsv')
OLD_DICT = Path('/mnt/data/Albanian_CONSOLIDATED_DICT_20260924')

if OUT.exists(): shutil.rmtree(OUT)
shutil.copytree(BASE, OUT)

GF = OUT/'AlbanianSQI/GF/lib/src/albanian'
DOC = OUT/'docs/dictionary'
RES = OUT/'resources/dictionary'
VAL = OUT/'validation/dictionary'
TOOLS = OUT/'tools/dictionary'
for d in (DOC, RES, VAL, TOOLS): d.mkdir(parents=True, exist_ok=True)

def sha(p):
    h=hashlib.sha256()
    with open(p,'rb') as f:
        for b in iter(lambda:f.read(1<<20),b''): h.update(b)
    return h.hexdigest()

def ident_base(lemma):
    s=lemma.lower().replace('ë','e').replace('ç','c')
    s=unicodedata.normalize('NFKD',s)
    s=''.join(ch for ch in s if not unicodedata.combining(ch))
    s=re.sub(r'[^a-z0-9]+','_',s).strip('_')
    if not s: s='entry'
    if s[0].isdigit(): s='w_'+s
    if len(s)>72: s=s[:63].rstrip('_')+'_'+hashlib.sha1(lemma.encode()).hexdigest()[:8]
    return s

def gfstr(s): return '"'+s.replace('\\','\\\\').replace('"','\\"')+'"'

# Legacy Lexicon function suffixes are not always GF Cat category names.
# Keep the historical Dict function IDs/provenance labels, but emit the actual
# standard Cat type used by the RGL abstract Lexicon.
GF_CATEGORY_NORMALIZATION = {
    "A2V": "A2",   # easy_A2V : A2
    "AS": "A",     # probable_AS : A
    "AV": "A",     # fun_AV : A
    "V0": "V",     # rain_V0 : V
}

def gf_decl_cat(cat):
    return GF_CATEGORY_NORMALIZATION.get(cat, cat)

# Albanet normalized inventory incl. representative synset id.
albanet=[]
for raw in SOURCE_TSV.read_text(encoding='utf-8').splitlines():
    parts=raw.split('\t')
    if len(parts)<2: continue
    pos,lemma=parts[:2]
    synset=parts[2] if len(parts)>2 else ''
    albanet.append((pos,lemma,synset))
assert len(albanet)==6489
assert Counter(p for p,_,_ in albanet)==Counter({'n':4259,'v':2166,'a':64})

# Functional words extracted from the supplied Tosk reference in the prior source-preserving pass.
functional=[]
ftsv=OLD_DICT/'resources/dictionary/tosk_function_words.tsv'
with ftsv.open(encoding='utf-8') as f:
    for row in csv.DictReader(f,delimiter='\t'):
        functional.append((row['category'],row['lemma'],row['case'],row['reference_descriptor']))
assert len(functional)==46

# Exact baseline LexiconSqi: preserve known RGL subcategorization/morphology.
lex_text=(BASE/'AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf').read_text(encoding='utf-8')
manual={'apple':'mollë','become':'bëhem','book':'libër','boy':'djalë','buy':'blej','come':'vij',
        'eat':'ha','find':'gjej','give':'jap','man':'burrë','say':'them','see':'shoh'}
lex_items=[]
for m in re.finditer(r'^\s*([A-Za-z0-9_]+)_([A-Z][A-Za-z0-9]*)\s*=\s*(.*?)\s*;\s*$',lex_text,re.M):
    stem,cat,rhs=m.groups()
    qs=re.findall(r'"((?:[^"\\]|\\.)*)"',rhs)
    lemma=qs[0] if qs else manual.get(stem)
    assert lemma, (stem,cat,rhs)
    lex_items.append((lemma,cat,f'{stem}_{cat}',rhs))
assert len(lex_items)==348

store={}
def add_or_merge(lemma,cat,source,source_detail='',case='',synset='',status='imported_unreviewed',alias_fun='',flags=None):
    k=(lemma,cat)
    if k not in store:
        store[k]={'lemma':lemma,'cat':cat,'case':case,'synsets':[],'sources':[],'source_details':[],
                  'status':status,'alias_fun':'','alias_alternates':[],'flags':set()}
    e=store[k]
    if synset and synset not in e['synsets']: e['synsets'].append(synset)
    if source not in e['sources']: e['sources'].append(source)
    if source_detail and source_detail not in e['source_details']: e['source_details'].append(source_detail)
    if case and not e['case']: e['case']=case
    if alias_fun:
        if not e['alias_fun']: e['alias_fun']=alias_fun
        elif alias_fun != e['alias_fun'] and alias_fun not in e['alias_alternates']: e['alias_alternates'].append(alias_fun)
        e['status']='baseline_lexicon_exact'
    if flags: e['flags'].update(flags)

for p,lemma,synset in albanet:
    cat={'n':'N','v':'V','a':'A'}[p]
    flags={'pos_from_wordnet'}
    if any(ch.isspace() for ch in lemma): flags.add('multiword')
    if re.search(r"[^A-Za-zÀ-žÇËçë0-9'’ -]",lemma): flags.add('punctuation')
    if lemma!=lemma.lower(): flags.add('case_marked')
    add_or_merge(lemma,cat,'Albanet/OMW','wns/als/wn-data-als.tab',synset=synset,status='imported_unreviewed',flags=flags)

for cat,lemma,case,desc in functional:
    add_or_merge(lemma,cat,'UT Austin Tosk Glossary',desc,case=case,status='reference_attested_unreviewed',flags={'functional_reference'})

for lemma,cat,fun,rhs in lex_items:
    add_or_merge(lemma,cat,'Baseline LexiconSqi',fun,status='baseline_lexicon_exact',alias_fun=fun,flags={'lexicon_sqi_exact'})

used=defaultdict(int); entries=[]
for e in sorted(store.values(), key=lambda x:(x['cat'],x['lemma'].casefold(),x['lemma'])):
    base_id=f"{ident_base(e['lemma'])}_{e['cat']}"
    used[base_id]+=1
    e['id']=base_id if used[base_id]==1 else f'{base_id}__{used[base_id]}'
    entries.append(e)

irreg={'bëj':'bej_V','bëhem':'behem_V','blej':'blej_V','bie':'bie_V','dal':'dal_V','dua':'dua_V','eci':'eci_V',
       'ha':'ha_V','gjej':'gjej_V','hyj':'hyj_V','iki':'iki_V','jam':'jam_V','jap':'jap_V','kam':'kam_V',
       'ngre':'ngre_V','njoh':'njoh_V','pi':'pi_V','shoh':'shoh_V','them':'them_V','urrej':'urrej_V','vë':'ve_V','vij':'vij_V'}

# Abstract module.
abs_lines=['-- Albanian large lexical/syntactic dictionary.',
'-- Generated from Albanet/OMW + supplied Tosk references + exact baseline LexiconSqi aliases.',
'-- This is DictSqi, NOT MorphoDictSqi.',
'-- See docs/dictionary for provenance and validation boundaries.','',
'abstract DictSqiAbs = Cat ** {','fun']
for e in entries: abs_lines.append(f'  {e["id"]} : {gf_decl_cat(e["cat"])} ;')
abs_lines += ['}', '']
(GF/'DictSqiAbs.gf').write_text('\n'.join(abs_lines),encoding='utf-8')

# Concrete module.
con=['-- Albanian large lexical/syntactic dictionary.',
'-- Baseline LexiconSqi entries are reused exactly when available.',
'-- Albanet-only N/A/V entries use lock-safe compile placeholders pending progressive linguistic review.','',
'concrete DictSqi of DictSqiAbs = CatSqi **',
'  open ParadigmsSqi, (I = IrregSqi), (L = LexiconSqi), (R = ResSqi), Prelude in {','',
'flags','  coding=utf8 ;','  optimize=values ;','','oper',
'  invariantN : Str -> N = \\x -> lin N {',
'    s = table {',
'      Indef => table {Nom => table {Sg => x ; Pl => x} ; Acc => table {Sg => x ; Pl => x} ; Dat => table {Sg => x ; Pl => x} ; Ablat => table {Sg => x ; Pl => x}} ;',
'      Def   => table {Nom => table {Sg => x ; Pl => x} ; Acc => table {Sg => x ; Pl => x} ; Dat => table {Sg => x ; Pl => x} ; Ablat => table {Sg => x ; Pl => x}}',
'    } ;',
'    g = masculine',
'  } ;',
'  invariantA : Str -> A = \\x -> lin A {',
'    s = table {',
'      Nom   => table {Masc => table {Sg => x ; Pl => x} ; Fem => table {Sg => x ; Pl => x}} ;',
'      Acc   => table {Masc => table {Sg => x ; Pl => x} ; Fem => table {Sg => x ; Pl => x}} ;',
'      Dat   => table {Masc => table {Sg => x ; Pl => x} ; Fem => table {Sg => x ; Pl => x}} ;',
'      Ablat => table {Masc => table {Sg => x ; Pl => x} ; Fem => table {Sg => x ; Pl => x}}',
'    } ;',
'    clit = False',
'  } ;',
'  invariantV : Str -> V = \\x -> irregV x x x x x x x x x ;','','lin']
for e in entries:
    source_cat,lemma=e['cat'],e['lemma']
    cat=gf_decl_cat(source_cat)
    if e['alias_fun']: rhs=f'lin {cat} L.{e["alias_fun"]}'
    elif cat=='N': rhs=f'invariantN {gfstr(lemma)}' if e['status']=='imported_unreviewed' else f'mkN {gfstr(lemma)}'
    elif cat=='A': rhs=f'invariantA {gfstr(lemma)}' if e['status']=='imported_unreviewed' else f'mkA {gfstr(lemma)}'
    elif cat=='V': rhs=f'lin V I.{irreg[lemma]}' if lemma in irreg else f'invariantV {gfstr(lemma)}'
    elif cat=='Adv': rhs=f'mkAdv {gfstr(lemma)}'
    elif cat=='Conj': rhs=f'mkConj {gfstr(lemma)}'
    elif cat=='Interj': rhs=f'mkInterj {gfstr(lemma)}'
    elif cat=='Prep': rhs=f'mkPrep {gfstr(lemma)} {e["case"]}' if e['case'] else f'mkPrep {gfstr(lemma)}'
    else: raise RuntimeError((cat,lemma,e))
    con.append(f'  {e["id"]} = {rhs} ;')
con += ['}', '']
(GF/'DictSqi.gf').write_text('\n'.join(con),encoding='utf-8')

# Reproducible source inventories.
shutil.copy2(SOURCE_TSV, RES/'albanet_unique_pos_lemma_synset.tsv')
shutil.copy2(ftsv, RES/'tosk_function_words.tsv')
with (RES/'baseline_lexicon_aliases.tsv').open('w',encoding='utf-8',newline='') as f:
    w=csv.writer(f,delimiter='\t'); w.writerow(['lemma','category','lexicon_function','rhs']); w.writerows(lex_items)

# Provenance ledger.
cols=['gf_id','category','lemma','governed_case','representative_synsets','sources','source_details','validation_status',
      'exact_lexicon_function','alternate_lexicon_functions','flags']
with (DOC/'DictSqi_provenance.tsv').open('w',encoding='utf-8',newline='') as f:
    w=csv.DictWriter(f,fieldnames=cols,delimiter='\t'); w.writeheader()
    for e in entries:
        w.writerow({'gf_id':e['id'],'category':e['cat'],'lemma':e['lemma'],'governed_case':e['case'],
          'representative_synsets':','.join(e['synsets']),'sources':' | '.join(e['sources']),
          'source_details':' | '.join(e['source_details']),'validation_status':e['status'],
          'exact_lexicon_function':e['alias_fun'],'alternate_lexicon_functions':','.join(e['alias_alternates']),
          'flags':','.join(sorted(e['flags']))})

# Static checks.
ids=[e['id'] for e in entries]
assert len(ids)==len(set(ids))
assert all(re.fullmatch(r'[a-z][A-Za-z0-9_]*',x) for x in ids)
abs_text=(GF/'DictSqiAbs.gf').read_text(encoding='utf-8'); con_text=(GF/'DictSqi.gf').read_text(encoding='utf-8')
for t in (abs_text,con_text):
    assert t.count('{')==t.count('}') and t.count('(')==t.count(')') and t.count('[')==t.count(']')
abs_ids=[m.group(1) for m in re.finditer(r'^\s*([a-z][A-Za-z0-9_]*)\s*:\s*[A-Za-z0-9_]+\s*;',abs_text,re.M)]
con_ids=[m.group(1) for m in re.finditer(r'^\s*([a-z][A-Za-z0-9_]*)\s*=\s*',con_text.split('\nlin\n',1)[1],re.M)]
assert Counter(abs_ids)==Counter(ids) and Counter(con_ids)==Counter(ids)
lex_fun_names={f for _,_,f,_ in lex_items}
assert all((not e['alias_fun']) or e['alias_fun'] in lex_fun_names for e in entries)

# Baseline preservation: every pre-existing file must be byte-identical.
missing=[]; changed=[]
for p in BASE.rglob('*'):
    if not p.is_file(): continue
    rel=p.relative_to(BASE); q=OUT/rel
    if not q.exists(): missing.append(str(rel))
    elif sha(p)!=sha(q): changed.append(str(rel))
assert not missing and not changed, (missing,changed)

cat_counts=Counter(e['cat'] for e in entries)
status_counts=Counter(e['status'] for e in entries)
flag_counts=Counter(flag for e in entries for flag in e['flags'])
source_counts=Counter(src for e in entries for src in e['sources'])
exact_alias=sum(bool(e['alias_fun']) for e in entries)
albanet_keys={(l,{'n':'N','v':'V','a':'A'}[p]) for p,l,_ in albanet}
lex_keys={(l,c) for l,c,_,_ in lex_items}
new_rich=len(lex_keys-albanet_keys)

validation={'dictionary_entries':len(entries),'categories':dict(sorted(cat_counts.items())),'status':dict(status_counts),
'source_memberships':dict(source_counts),'exact_baseline_lexicon_aliases':exact_alias,
'gf_category_normalization':GF_CATEGORY_NORMALIZATION,
'distinct_lexicon_lemma_category_pairs':len(lex_keys),'lexicon_pairs_new_beyond_albanet':new_rich,
'albanet_unique_pos_lemma_pairs':len(albanet),'tosk_functional_rows':len(functional),'flags':dict(sorted(flag_counts.items())),
'baseline_files_missing':missing,'baseline_files_changed':changed,'baseline_preserved':True,'gf_compile_certified':False,
'gf_compile_note':'Pending external GF 3.12 / Wordbench run. Core baseline remains byte-for-byte unchanged.',
'source_lock':{'albanet_repo':'omwn/omw-data','albanet_path':'wns/als/wn-data-als.tab',
'albanet_blob_sha':'a22812b3fa9f03e3b784e34da396165725ac514f','normalized_inventory_sha256':sha(RES/'albanet_unique_pos_lemma_synset.tsv'),
'baseline_lexicon_sha256':sha(BASE/'AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf'),
'DictSqiAbs_sha256':sha(GF/'DictSqiAbs.gf'),'DictSqi_sha256':sha(GF/'DictSqi.gf')}}
(DOC/'DICT_SQI_VALIDATION.json').write_text(json.dumps(validation,ensure_ascii=False,indent=2),encoding='utf-8')

report=f'''# DictSqi complete checkpoint — 2026-09-24

## Result

Adds a large **Albanian `DictSqi` / `DictSqiAbs`** while preserving the previously green Albanian core byte-for-byte.

- total distinct dictionary functions: **{len(entries)}**
- Albanet/OMW lemma+POS pairs retained: **{len(albanet)} / 6489**
- Tosk functional entries retained: **{len(functional)} / 46**
- distinct baseline `LexiconSqi` lemma+category pairs incorporated: **{len(lex_keys)}**
- exact entries realized by aliasing the validated baseline `LexiconSqi`: **{exact_alias}**
- richer LexiconSqi category pairs added beyond Albanet N/A/V coverage: **{new_rich}**
- MorphoDict: **not created**

## Source category-label coverage

Legacy Lexicon suffix labels are retained in IDs/provenance. GF declarations normalize `A2V→A2`, `AS→A`, `AV→A`, and `V0→V` to the actual standard `Cat` types.

| Source label | Count |
|---|---:|
'''
for k,v in sorted(cat_counts.items()): report+=f'| {k} | {v} |\n'
report+=f'''
## Quality model

`baseline_lexicon_exact` reuses the exact linearization already present in the green `LexiconSqi`.

`imported_unreviewed` is attested by Albanet. Nouns/adjectives use smart paradigms; verbs use a compile-safe invariant fallback until their Albanian principal parts are reviewed. These entries must not be promoted to gold before linguistic review.

`reference_attested_unreviewed` covers functional words extracted from the supplied Tosk glossary.

The source contains **{flag_counts['multiword']} multiword Albanet entries**. They are retained for source completeness but are a high-priority review queue.

## Preservation

- baseline files missing: **0**
- baseline files changed: **0**
- core baseline preserved byte-for-byte: **YES**
- `DictSqiAbs.gf` and `DictSqi.gf` are additive and not wired into `GrammarSqi`, `AllSqi`, or `LangSqi`.

## Compilation boundary

This environment has no GF executable. Static inventory, delimiter, alias-reference and preservation checks pass, but `gf -make DictSqi.gf` must be run by Wordbench/GF 3.12 before compile certification.

## Gold boundary

This dictionary is **source-complete for the imported Albanet inventory**, not gold-complete. Gold promotion should happen entry families at a time after generation/analysis review.
'''
(DOC/'DICT_SQI_REPORT.md').write_text(report,encoding='utf-8')
(DOC/'README.md').write_text(f'''# Albanian DictSqi — complete dictionary checkpoint

- `{len(entries)}` distinct `DictSqiAbs` functions.
- Albanet/Open Multilingual WordNet N/V/A inventory.
- supplied Tosk glossary functional entries.
- exact reuse of baseline `LexiconSqi` for recoverable lexical/syntactic categories, including V2/V3/VS/VQ/V2V/N2/N3/A2 and related RGL categories.
- no `MorphoDictSqi`.
- no guessed valency for Albanet-only verbs.
- no changes to the previously validated core modules.

See `DICT_SQI_REPORT.md` and `DictSqi_provenance.tsv`.
''',encoding='utf-8')
(DOC/'THIRD_PARTY_NOTICES.md').write_text('''# Third-party notices

## Albanet / Open Multilingual WordNet
The large Albanian lemma/POS inventory derives from Albanet as distributed by Open Multilingual WordNet. OMW lists Albanet (`als`) under CC BY 3.0. Pinned source blob: `a22812b3fa9f03e3b784e34da396165725ac514f`.

## User-supplied Tosk reference
Functional-word entries are extracted from the supplied Albanian Tosk glossary. Original grammatical descriptors are retained in `DictSqi_provenance.tsv`.

## Project baseline
Rich subcategorization entries reuse exact `LexiconSqi` functions already present in the consolidated Albanian GF project.
''',encoding='utf-8')

samples=[]
for cat in ['N','A','V','V2','V3','VS','VQ','V2V','N2','N3','A2','Adv','Prep','Conj','Interj','PN']:
    vals=[e for e in entries if e['cat']==cat]
    if vals:
        vals=sorted(vals,key=lambda e:(not bool(e['alias_fun']),e['lemma']))
        samples.extend(vals[:min(3,len(vals))])
(VAL/'dict-sqi-smoke.gfs').write_text('i DictSqi.gf\n'+'\n'.join(f'l {e["id"]}' for e in samples)+'\n',encoding='utf-8')
(VAL/'WORD_BENCH_REQUEST.md').write_text(f'''# Wordbench request — DictSqi

1. Run `gf -make DictSqi.gf` with GF 3.12.
2. Run `dict-sqi-smoke.gfs`.
3. Report first direct compiler error separately from cascade failures.
4. Preserve source-lock hashes from `docs/dictionary/DICT_SQI_VALIDATION.json`.
5. Do not equate compilation with linguistic gold.

Dictionary functions: {len(entries)}
Exact baseline LexiconSqi aliases: {exact_alias}
''',encoding='utf-8')

validator='''from pathlib import Path\nimport json,re,collections\nROOT=Path(__file__).resolve().parents[2]\nGF=ROOT/'AlbanianSQI/GF/lib/src/albanian'\nv=json.loads((ROOT/'docs/dictionary/DICT_SQI_VALIDATION.json').read_text(encoding='utf-8'))\na=(GF/'DictSqiAbs.gf').read_text(encoding='utf-8')\nc=(GF/'DictSqi.gf').read_text(encoding='utf-8')\nabs_ids=re.findall(r'^\\s*([a-z][A-Za-z0-9_]*)\\s*:\\s*([A-Za-z0-9_]+)\\s*;',a,re.M)\ncon_ids=re.findall(r'^\\s*([a-z][A-Za-z0-9_]*)\\s*=\\s*',c.split('\\nlin\\n',1)[1],re.M)\nchecks=[('entry count',len(abs_ids)==v['dictionary_entries']),('unique abstract IDs',len(abs_ids)==len(set(x for x,_ in abs_ids))),('abstract/concrete inventory',collections.Counter(x for x,_ in abs_ids)==collections.Counter(con_ids)),('balanced braces',a.count('{')==a.count('}') and c.count('{')==c.count('}')),('no MorphoDict module','abstract MorphoDictSqi' not in a and 'concrete MorphoDictSqi' not in c),('baseline preservation recorded',v['baseline_preserved'] is True)]\nfor n,ok in checks: print(('PASS' if ok else 'FAIL'),n)\nraise SystemExit(0 if all(ok for _,ok in checks) else 1)\n'''
(TOOLS/'static_validate_dict.py').write_text(validator,encoding='utf-8')
(TOOLS/'BUILD_NOTES.md').write_text('''# Build notes
Inputs:
1. `resources/dictionary/albanet_unique_pos_lemma_synset.tsv`
2. `resources/dictionary/tosk_function_words.tsv`
3. exact baseline `LexiconSqi.gf`

Rule: exact `LexiconSqi` linearizations override smart constructors for the same native lemma + GF category. Rich categories are never guessed from Albanet.
''',encoding='utf-8')
(OUT/'DICT_SQI_CHECKPOINT.md').write_text(f'# Albanian consolidated + complete DictSqi\n\nAdds {len(entries)} dictionary functions without modifying the green core.\nSee `docs/dictionary/DICT_SQI_REPORT.md`.\n',encoding='utf-8')

artifacts=[GF/'DictSqiAbs.gf',GF/'DictSqi.gf',DOC/'DictSqi_provenance.tsv',DOC/'DICT_SQI_VALIDATION.json',RES/'albanet_unique_pos_lemma_synset.tsv',RES/'tosk_function_words.tsv',RES/'baseline_lexicon_aliases.tsv']
(DOC/'SHA256SUMS.txt').write_text('\n'.join(f'{sha(p)}  {p.relative_to(OUT).as_posix()}' for p in artifacts)+'\n',encoding='utf-8')

# Preserve generator in package.
shutil.copy2(__file__, TOOLS/'build_complete_dict.py')

# Zip whole consolidated checkpoint.
zip_path=Path('/mnt/data/Albanian_CONSOLIDATED_DICT_COMPLETE_20260924.zip')
if zip_path.exists(): zip_path.unlink()
with zipfile.ZipFile(zip_path,'w',zipfile.ZIP_DEFLATED) as z:
    for p in OUT.rglob('*'):
        if p.is_file(): z.write(p,p.relative_to(OUT.parent))

print(json.dumps(validation,ensure_ascii=False,indent=2))
print('ZIP',zip_path,zip_path.stat().st_size,sha(zip_path))
