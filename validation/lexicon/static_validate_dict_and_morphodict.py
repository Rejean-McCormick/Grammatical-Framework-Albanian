from pathlib import Path
import subprocess,sys,hashlib
ROOT=Path(__file__).resolve().parents[2]
checks=[
 ROOT/'AlbanianSQI/GF/lib/src/albanian/DictSqiAbs.gf',
 ROOT/'AlbanianSQI/GF/lib/src/albanian/DictSqi.gf',
 ROOT/'AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf',
 ROOT/'AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf',
]
for p in checks:
 print(('PASS' if p.exists() else 'FAIL'),'exists',p.relative_to(ROOT))
 if not p.exists(): sys.exit(1)
for rel in ['tools/dictionary/static_validate_dict.py','validation/morphodict/static_validate_morphodict.py']:
 r=subprocess.run([sys.executable,str(ROOT/rel)],cwd=ROOT)
 if r.returncode: sys.exit(r.returncode)
print('PASS unified DictSqi + MorphoDictSqi static validation')
