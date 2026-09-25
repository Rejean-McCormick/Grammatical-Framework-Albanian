#!/usr/bin/env python3
from pathlib import Path
import json,csv
ROOT=Path(__file__).resolve().parents[2]
rows=[json.loads(x) for x in (ROOT/'resources/morphodict/LEMGRAMS.jsonl').read_text(encoding='utf8').splitlines() if x.strip()]
counts={'N':16,'A':16,'V':57,'PN':4,'IP':4,'Pron':4,'NP':4,'Quant':16,'IQuant':16,'Det':8,'IDet':8,'Prep':1,'Adv':1,'IAdv':1,'Interj':1,'Conj':1,'Subj':1,'Predet':1}
out=ROOT/'validation/morphodict/GF_TABLE_INTROSPECTION_REQUEST.tsv'
with out.open('w',encoding='utf8',newline='') as f:
 w=csv.writer(f,delimiter='\t');w.writerow(['function_id','category','expected_surface_cells','status'])
 for r in rows:w.writerow([r['function_id'],r['category'],counts.get(r['category'],''),'REQUIRED_FOR_TSIG_C6'])
print(out,len(rows))
