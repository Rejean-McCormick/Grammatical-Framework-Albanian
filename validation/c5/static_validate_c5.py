from __future__ import annotations
from pathlib import Path
import csv, hashlib, json, re, sys, tomllib

ROOT = Path(__file__).resolve().parents[2]
SRCROOT = ROOT/'AlbanianSQI/GF/lib/src'
SRC = SRCROOT/'albanian'
MORPHODICT = SRCROOT/'morphodict'
SCEN = ROOT/'validation/scenarios'
INPUTS = ROOT/'validation/inputs'
PROJECT = ROOT/'project.toml'
REF = ROOT/'validation/c5/C5_REFERENCE_EXPECTATIONS.tsv'
REG = ROOT/'validation/c5/C5_PREPOSITION_REGISTRY.tsv'
SREG = ROOT/'validation/c5/C5_STRUCTURAL_PREPOSITION_REGISTRY.tsv'
APIREG = ROOT/'validation/c5/C5_API_PARITY_REGISTRY.tsv'
MAN = ROOT/'validation/c5/C5_VALIDATION_MANIFEST.json'

checks=[]
def ck(name, cond, detail=''):
    checks.append((name,bool(cond),str(detail)))

def txt(p: Path): return p.read_text(encoding='utf-8',errors='replace')

def tsv(p: Path):
    with p.open(encoding='utf-8',newline='') as f:
        return list(csv.DictReader(f,delimiter='\t'))

# Extract GF table blocks and top-level labels, ignoring nested tables and strings.
def table_blocks(s: str):
    out=[]
    for m in re.finditer(r'\btable\s*\{',s):
        start=m.end()-1; depth=0; in_str=False; esc=False
        for i in range(start,len(s)):
            ch=s[i]
            if in_str:
                if esc: esc=False
                elif ch=='\\': esc=True
                elif ch=='"': in_str=False
                continue
            if ch=='"': in_str=True; continue
            if ch=='{': depth+=1
            elif ch=='}':
                depth-=1
                if depth==0:
                    out.append((m.start(),i+1,s[m.start():i+1])); break
    return out

def top_labels(block: str):
    b=block[block.find('{')+1:-1]
    labels=[]; depth=0; in_str=False; esc=False; i=0
    while i<len(b):
        ch=b[i]
        if in_str:
            if esc: esc=False
            elif ch=='\\': esc=True
            elif ch=='"': in_str=False
            i+=1; continue
        if ch=='"': in_str=True; i+=1; continue
        if ch=='{': depth+=1; i+=1; continue
        if ch=='}': depth-=1; i+=1; continue
        if depth==0:
            m=re.match(r'\s*([A-Za-z][A-Za-z0-9_]*)\s*=>',b[i:])
            if m:
                labels.append(m.group(1)); i+=m.end(); continue
        i+=1
    return labels

res=txt(SRC/'ResSqi.gf')
allgf='\n'.join(txt(p) for p in SRC.glob('*.gf'))
ck('Case has 5 syntax values', 'Case = Nom | Acc | Gen | Dat | Ablat' in res)
ck('MorphCase syncretic layer exists', 'MorphCase = MNom | MAcc | MDat | MAblat' in res and 'Gen => MDat' in res)
ck('Gender-preserving plural agreement exists', 'GenNum = GSg Gender | GPl Gender' in res)
ck('Typed CliticCluster exists', 'CliticCluster : Type' in res and 'dat, acc : WeakArg' in res and 'refl : Bool' in res)
ck('Central clitic flattener exists', 'flattenClitics : CliticCluster -> Str' in res)
ck('Central të contraction exists', 'teWithClitics : CliticCluster -> Str' in res)
ck('No legacy acc_clit field', 'acc_clit' not in allgf)
ck('No legacy dat_clit field', 'dat_clit' not in allgf)
ck('No active subjcl field', re.search(r'\bsubjcl\s*:',allgf) is None)
ck('No active cl : Str field', re.search(r'\bcl\s*:\s*Str\b',allgf) is None)
ck('po separate from cluster', 'progressive : Bool' in res and 'CliticCluster : Type = {dat, acc : WeakArg ; refl : Bool}' in res)
ck('Dat utterance remains Dat', 'sc_UttDatIP : IP -> Utt = \\ip -> lin Utt {s=ip.s!R.Dat} ;' in txt(SRC/'ExtendSqiScaffolding.gf'))

# All explicit Case/MorphCase tables in active Albanian GF must be exhaustive at their own table depth.
case_labels={'Nom','Acc','Gen','Dat','Ablat'}
morph_labels={'MNom','MAcc','MDat','MAblat'}
case_blocks=0; morph_blocks=0; incomplete=[]
for p in SRC.glob('*.gf'):
    s=txt(p)
    for pos,_end,block in table_blocks(s):
        labs=set(top_labels(block))
        if labs & case_labels:
            case_blocks+=1
            if not case_labels <= labs:
                incomplete.append(f'{p.name}:{s.count(chr(10),0,pos)+1}:Case:{sorted(labs)}')
        if labs & morph_labels:
            morph_blocks+=1
            if not morph_labels <= labs:
                incomplete.append(f'{p.name}:{s.count(chr(10),0,pos)+1}:MorphCase:{sorted(labs)}')
ck('All explicit Case/MorphCase tables exhaustive', not incomplete, '; '.join(incomplete[:8]))
ck('Case/MorphCase table audit exercised substantial source', case_blocks >= 20 and morph_blocks >= 100, f'Case={case_blocks} MorphCase={morph_blocks}')

# Exact source-locked 6x{e,i,u} cluster matrix must live in the sole flattening helpers.
for fn,expected in {
    'datAccSg': ['ma','ta','ia','na" ++ "e','jua','ua'],
    'datAccPl': ["m'i","t'i",'ia','na" ++ "i','jua','ua'],
    'datRefl': ["m'u","t'u",'iu','na" ++ "u','ju','ju'],
}.items():
    marker=f'{fn} : WeakArg -> Str'
    present=marker in res
    ck(f'{fn} definition present', present)
    if present:
        tail=res.split(marker,1)[1]
        body=tail.split('  } ;',1)[0]
        for surf in expected:
            ck(f'{fn} contains {surf}', surf in body)

for surf in ['"e" => "ta"', '"i" => "t\'i"', '"u" => "t\'u"', '"jua" => "t\'jua"', '"ua" => "t\'ua"']:
    ck(f'të contraction {surf}', surf in res)

# Source-locked reference inventory.
rows=tsv(REF)
m=[r for r in rows if r['case_id'].startswith('C5M')]
ck('18 double-clitic reference cells', len(m)==18, len(m))
ck('all 18 source-locked', all(r['status']=='SOURCE_LOCKED' for r in m))
source=[r for r in tsv(REG) if r['source_status'].startswith('SOURCE_LOCKED')]
ck('14 source-attested prep government rows', len(source)==14, len(source))

# Structural prepositions: all common-RGL entries must be inventoried; none may be UNASSESSED.
struct=txt(SRC/'StructuralSqiClause.gf')
struct_defs={}
for name,surface,case in re.findall(r'^\s*([A-Za-z0-9_]+_Prep)\s*:\s*Compl\s*=\s*mkCompl\s*"([^"]*)"\s*(Nom|Acc|Gen|Dat|Ablat)\s*;',struct,re.M):
    struct_defs[name]=(surface,case,'OrdinaryCompl')
if re.search(r'^\s*possess_Prep\s*:\s*Compl\s*=\s*mkGenitiveCompl\s*;',struct,re.M):
    struct_defs['possess_Prep']=('<zero+nyje>','Gen','GenitiveCompl')
srows=tsv(SREG)
smap={r['constructor']:r for r in srows}
ck('21 Structural prepositions implemented', len(struct_defs)==21, len(struct_defs))
ck('21 Structural prepositions uniquely classified', len(srows)==21 and len(smap)==21, f'rows={len(srows)} unique={len(smap)}')
ck('No Structural preposition UNASSESSED', all(r['status']!='UNASSESSED' for r in srows))
ck('Structural registry covers implementation exactly', set(smap)==set(struct_defs), f'missing={sorted(set(struct_defs)-set(smap))} extra={sorted(set(smap)-set(struct_defs))}')
for name,(surface,case,kind) in sorted(struct_defs.items()):
    r=smap.get(name,{})
    ck(f'Structural prep shape {name}', r.get('surface')==surface and r.get('case')==case and r.get('kind')==kind, f'impl={surface}/{case}/{kind} registry={r}')

# Typed genitive must own kinship complements; lexical i/e pseudo-prepositions are forbidden there.
lex=txt(SRC/'LexiconSqi.gf')
ck('Typed genitive Prep helper exists', 'genitivePrep : Prep = lin Prep R.mkGenitiveCompl' in lex)
for sym in ['brother_N2','father_N2','mother_N2']:
    ck(f'{sym} uses typed genitive complement', re.search(rf'\b{sym}\s*=.*\bgenitivePrep\b',lex) is not None)
ck('No kinship mkPrep i/e pseudo-genitive remains', not re.search(r'(brother_N2|father_N2|mother_N2).*mkPrep\s+"[ie]"',lex))

# FunRP common-RGL semantics: head NP carries outer case, RP carries Prep-governed case.
rel=txt(SRC/'RelativeSqi.gf')
ck('FunRP head/gap case routing', 'np.s ! c ++ prep.s ++ rp.s ! prep.c ! g' in rel)

# C5 API parity matrix is fully statically assessed and every concrete owner defines its symbol.
apirows=tsv(APIREG)
ck('C5 API parity registry has 21 rows', len(apirows)==21, len(apirows))
ck('C5 API parity has no UNASSESSED row', all(r['static_status']=='STATIC_ASSESSED' for r in apirows))
for r in apirows:
    sym=r['symbol']; fn=r['implementation_file']; p=SRC/fn
    if sym in {'personal_pronouns','prepositions'}:
        cond = p.exists()
    else:
        cond = p.exists() and re.search(rf'(?m)^\s*{re.escape(sym)}\b',txt(p)) is not None
    ck(f'API owner defines {sym}', cond, fn)

# Scenarios and SHA locks.
manifest=json.loads(txt(MAN))
new=manifest['new_required_scenarios']
ck('5 C5 scenarios declared', len(new)==5, len(new))
with PROJECT.open('rb') as f:
    project_obj=tomllib.load(f)
required=project_obj['validation']['required_scenarios']
ck('project requires 57 scenarios', len(required)==57, len(required))
for s in new:
    sf=SCEN/f'{s}.gfs'
    ck(f'scenario exists {s}', sf.exists())
    ck(f'project requires {s}', s in required)
    if sf.exists():
        body=txt(sf)
        locks=re.findall(r'GF_WORDBENCH_INPUT_SHA256\s+([0-9a-f]{64})\s+(\S+)',body)
        ok=True; ds=[]
        for expected, relp in locks:
            p=ROOT/relp
            actual=hashlib.sha256(p.read_bytes()).hexdigest() if p.exists() else 'MISSING'
            ok &= actual==expected
            if actual!=expected: ds.append(f'{relp}:{actual}')
        ck(f'SHA locks {s}', bool(locks) and ok, ';'.join(ds))

count=len(list(SCEN.glob('*.gfs')))
ck('scenario inventory = 57 (52 historical + 5 C5)', count==57, count)

# Exact GF census expected by the coordinated baseline.
lang=list(SRC.glob('*.gf'))
api=[SRCROOT/x for x in ['CombinatorsSqi.gf','ConstructorsSqi.gf','SymbolicSqi.gf','SyntaxSqi.gf','TrySqi.gf']]
morph=list(MORPHODICT.glob('MorphoDictSqi*.gf'))
ck('GF census shape = 51 language + 5 API + 2 MorphoDict', len(lang)==51 and sum(p.exists() for p in api)==5 and len(morph)==2, f'{len(lang)}+{sum(p.exists() for p in api)}+{len(morph)}')

# Basic structural sanity on active GF sources.
for p in SRC.glob('*.gf'):
    s=txt(p)
    ck(f'brace balance {p.name}', s.count('{')==s.count('}'), f"{s.count('{')}/{s.count('}')}")

failed=[x for x in checks if not x[1]]
for name,ok,detail in checks:
    print(('PASS' if ok else 'FAIL'), name, detail)
print(f'CHECKS {len(checks)} FAILED {len(failed)}')
sys.exit(1 if failed else 0)
