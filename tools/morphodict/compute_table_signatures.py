#!/usr/bin/env python3
"""Compute TSIG-1 signatures from native-GF table introspection JSONL.

Input records must contain: function_id, category, cells (mapping), inherent
(mapping). This utility never synthesizes missing cells; category completeness is
validated separately. Output is deterministic NFC-normalized canonical JSON + SHA256.
"""
from pathlib import Path
import argparse,hashlib,json,unicodedata,csv

def norm(x):
    if isinstance(x,str): return unicodedata.normalize('NFC',x)
    if isinstance(x,dict): return {k:norm(x[k]) for k in sorted(x)}
    if isinstance(x,list): return [norm(v) for v in x]
    return x

def canon(rec):
    obj={'tsig_version':'TSIG-1','category':rec['category'],'cells':norm(rec.get('cells',{})),'inherent':norm(rec.get('inherent',{}))}
    raw=json.dumps(obj,ensure_ascii=False,sort_keys=True,separators=(',',':')).encode('utf-8')
    return hashlib.sha256(raw).hexdigest(),raw.decode('utf-8')

def main():
    ap=argparse.ArgumentParser();ap.add_argument('input');ap.add_argument('--output',required=True);ap.add_argument('--duplicates')
    a=ap.parse_args(); rows=[]; groups={}
    for line in Path(a.input).read_text(encoding='utf-8').splitlines():
        if not line.strip():continue
        r=json.loads(line); sig,raw=canon(r); row={'function_id':r['function_id'],'category':r['category'],'table_signature':sig,'canonical_json':raw};rows.append(row);groups.setdefault((r['category'],sig),[]).append(r['function_id'])
    with Path(a.output).open('w',encoding='utf-8',newline='') as f:
        w=csv.DictWriter(f,delimiter='\t',fieldnames=['function_id','category','table_signature','canonical_json']);w.writeheader();w.writerows(rows)
    dups=[{'category':k[0],'table_signature':k[1],'function_ids':v} for k,v in groups.items() if len(v)>1]
    if a.duplicates: Path(a.duplicates).write_text(json.dumps(dups,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
    print(json.dumps({'tables':len(rows),'duplicate_signature_groups':len(dups)},indent=2))
if __name__=='__main__':main()
