from pathlib import Path
import re, sys
ROOT = Path(__file__).resolve().parents[1] / 'payload/AlbanianSQI/GF/lib/src/albanian'
checks=[]
def check(name, ok, detail=''):
    checks.append((name, bool(ok), detail))

def text(name): return (ROOT/name).read_text(encoding='utf-8')

res=text('ResSqi.gf'); clause=text('ClauseSqiRes.gf'); para=text('ParadigmsSqi.gf')
conj=text('ConjunctionSqi.gf'); sym=text('SymbolSqi.gf'); noun=text('NounSqi.gf')
struct=text('StructuralSqiNominal.gf'); idiom=text('IdiomSqi.gf')
alltxt='\n'.join(p.read_text(encoding='utf-8') for p in ROOT.glob('*.gf'))

check('five-case parameter', 'Case = Nom | Acc | Gen | Dat | Ablat' in res)
check('number-sensitive plural gender', 'GenNum = GSg Gender | GPl Gender' in res)
check('number-sensitive noun gender', 'g : Number => Gender' in res)
check('typed clitic cluster', 'CliticCluster : Type' in res and 'clitics : CliticCluster' in res)
check('flat VP cl field removed', not re.search(r'\bcl\s*:\s*Str', res))
check('subjcl removed', 'subjcl' not in alltxt)
check('central dative+accusative fusion', all(x in res for x in ['<"më","e"> => "ma"','<"të","e"> => "ta"','<"i","u">  => "iu"','<"ju","e"> => "jua"']))
check('central të contraction', all(x in res for x in ['"e" => "ta"','"i" => "t\'i"','"u" => "t\'u"','"jua" => "t\'jua"']))
check('typed voice state', 'Voice = ActiveVoice | NonActiveVoice' in res and 'VoiceUse = PlainVoice | PassiveVoice | ReflexiveVoice' in res)
check('typed perfect auxiliary', 'PerfectAux = AuxKam | AuxJam' in res and 'perfectAuxFinite' in res and 'perfectAuxSubj' in res)
check('active defaults to kam', 'voice = ActiveVoice' in res and 'perfAux = AuxKam' in res)
check('non-active marks jam', 'markNonActiveVerb' in res and 'perfAux=AuxJam' in res)
check('aorist non-active u slot', '<NonActiveVoice,Aorist>' in res and '{refl="u"}' in res)
check('clause realizes typed clitics', 'flattenClitics' in clause and 'subjHead' in clause and 'negSubjHead' in clause)
check('imperative ordering centralized', 'impHead' in clause and '"mos" ++ vp.preverb ++ flattenClitics vp.clitics' in clause)
check('perfect realization uses typed auxiliary', clause.count('perfectAuxSubj') >= 2 and clause.count('perfectAuxFinite') >= 2)
check('progressive uses preverb state', 'ProgrVP vp = addPreverbVP vp "po"' in idiom)
check('CN coordination gender number-sensitive', '[CN] = {first,last : Species => Case => Number => Str ; g : Number => Gender}' in conj)
check('symbol plural agreement preserves gender', 'Pl => GPl g' in sym)
check('symbol tables include genitive', 'Gen   => cn.s ! Indef ! Gen' in sym and 'det.s ! Gen' in sym)
check('possessive NP requests Gen', 'np.s!Gen' in noun)
check('structural interrogatives include Gen', (struct.count('Gen =>') + struct.count('Gen=>')) >= 6 and 'Gen=>"kujt"' in struct)
check('paradigm pronoun includes Gen', 'Gen=>dat' in para)
check('paradigm N full includes Gen', 'Gen => table {Sg => f.indefDatSg' in para and 'Gen => table {Sg => f.defDatSg' in para)
check('paradigm exact verbs carry voice state', para.count('perfAux = AuxKam') >= 2)
check('voice annotation API exposed', all(x in para for x in ['markNonActiveV','markPassiveV','markReflexiveV']))

# Very lightweight delimiter sanity after stripping comments and strings.
def strip(src):
    src=re.sub(r'--.*','',src)
    src=re.sub(r'"(?:\\.|[^"\\])*"','""',src)
    return src
for p in sorted(ROOT.glob('*.gf')):
    st=strip(p.read_text(encoding='utf-8'))
    ok=(st.count('{')==st.count('}') and st.count('(')==st.count(')') and st.count('[')==st.count(']'))
    check(f'delimiter balance {p.name}', ok, f"{{ {st.count('{')}/{st.count('}')} ( {st.count('(')}/{st.count(')')} [ {st.count('[')}/{st.count(']')}")

failed=[c for c in checks if not c[1]]
for name,ok,detail in checks:
    print(('PASS' if ok else 'FAIL') + '  ' + name + ((' — '+detail) if detail else ''))
print(f'\nSummary: {len(checks)-len(failed)}/{len(checks)} checks passed')
if failed:
    sys.exit(1)
