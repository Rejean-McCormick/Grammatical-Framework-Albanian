#!/usr/bin/env python3
"""Map supplied Tosk evidence descriptions to the current Albanian GF feature space.

The mapper is intentionally conservative. Ambiguous source alignment or absent
case/mood information stays ambiguous; nothing is silently completed.
"""
from pathlib import Path
import csv, re
ROOT=Path(__file__).resolve().parents[2]
SRC=ROOT/'resources/morphodict/TOSK_REFERENCE_LEMMAS.tsv'
OUT=ROOT/'docs/morphodict/FEATURE_MAPPING.tsv'

CASE={'nominative':'Nom','accusative':'Acc','dative':'Dat','ablative':'Ablat','genitive':'Dat'}
NUM={'singular':'Sg','plural':'Pl'}
GEND={'masculine':'Masc','feminine':'Fem'}
PERS={'1st':'P1','2nd':'P2','3rd':'P3'}

def map_desc(cat,d):
    low=d.lower()
    note=''
    if cat=='N':
        c=next((v for k,v in CASE.items() if k in low),None)
        n=next((v for k,v in NUM.items() if k in low),None)
        g=next((v for k,v in GEND.items() if k in low),None)
        sp='Def' if 'definite' in low and 'indefinite' not in low else ('Indef' if 'indefinite' in low else None)
        if 'genitive' in low:
            note='source genitive maps to the current morphological Dat/oblique cell; syntactic genitive linking is handled outside N morphology'
        if c and n and sp:
            return 'exact',f's.{sp}.{c}.{n};g={g or "?"}',note
        return 'ambiguous',f's.{sp or "*"}.{c or "*"}.{n or "*"};g={g or "?"}',note
    if cat=='A':
        n=next((v for k,v in NUM.items() if k in low),None)
        g=next((v for k,v in GEND.items() if k in low),None)
        # UT descriptions generally omit case, so preserve ambiguity over Case.
        if n and g:
            return 'ambiguous',f's.*.{g}.{n}', 'source adjective description does not determine GF Case'
        return 'unmapped','', 'insufficient adjective feature description'
    if cat=='V':
        if 'participle' in low:
            return 'exact','participle',''
        p=next((v for k,v in PERS.items() if k in low),None)
        n=next((v for k,v in NUM.items() if k in low),None)
        if 'subjunctive' in low:
            return ('exact' if p and n else 'ambiguous'),f'Subjunctive.{n or "*"}.{p or "*"}','voice label retained as evidence metadata; current Verb table has no voice dimension'
        if 'indicative' in low:
            if 'imperfect' in low: tense='Imperfect'
            elif 'past definite' in low: tense='Aorist'
            elif 'present' in low: tense='Pres'
            elif re.search(r'\bpast\b',low): tense='Past'
            else: tense='*'
            status='exact' if p and n and tense!='*' else 'ambiguous'
            return status,f'Indicative.{tense}.{n or "*"}.{p or "*"}','voice label retained as evidence metadata; current Verb table has no voice dimension'
        return 'unmapped','', 'verb description does not map uniquely to current Verb cells'
    if cat=='Prep':
        c=next((v for k,v in CASE.items() if k in low),None)
        return ('exact' if c else 'ambiguous'),f'c={c or "*"};s',('genitive government is represented by current Dat/oblique case' if 'genitive' in low else '')
    if cat in {'Adv','Interj','Conj','Subj','IAdv','Predet'}:
        return 'exact','s','invariant/closed-category surface evidence'
    return 'unmapped','', 'category requires category-specific reviewed mapping'

rows=[]
for r in csv.DictReader(SRC.open(encoding='utf-8'),delimiter='\t'):
    forms=[x.strip() for x in r['observed_forms'].split(',') if x.strip()]
    descs=[x.strip() for x in r['descriptions'].split('|') if x.strip()]
    if len(forms)!=len(descs):
        rows.append({'lemma':r['lemma'],'category':r['category'],'surface':'|'.join(forms),'raw_description':' | '.join(descs),'mapping_status':'ambiguous','gf_feature_path':'','note':f'source has {len(forms)} distinct forms but {len(descs)} analyses; alignment is not one-to-one'})
        continue
    for form,desc in zip(forms,descs):
        status,path,note=map_desc(r['category'],desc)
        rows.append({'lemma':r['lemma'],'category':r['category'],'surface':form,'raw_description':desc,'mapping_status':status,'gf_feature_path':path,'note':note})
OUT.parent.mkdir(parents=True,exist_ok=True)
with OUT.open('w',encoding='utf-8',newline='') as f:
    fields=['lemma','category','surface','raw_description','mapping_status','gf_feature_path','note']
    w=csv.DictWriter(f,delimiter='\t',fieldnames=fields);w.writeheader();w.writerows(rows)
from collections import Counter
print('rows',len(rows),'status',dict(Counter(r['mapping_status'] for r in rows)))
