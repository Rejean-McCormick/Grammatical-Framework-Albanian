# Test coverage register — Conversation 9

## 1. Protected baseline suite

The supplied Albanian snapshot contains **52** required `.gfs` scenarios. They are protected regression assets:

`alb-adj-01.gfs`, `alb-adj-02.gfs`, `alb-adj-03.gfs`, `alb-adj-04.gfs`, `alb-adj-05.gfs`, `alb-clitic-ditransitive.gfs`, `alb-clitic-negative.gfs`, `alb-clitic-objects.gfs`, `alb-clitic-vp.gfs`, `alb-complement-control.gfs`, `alb-construction-01.gfs`, `alb-construction-02.gfs`, `alb-cross-01.gfs`, `alb-cross-02.gfs`, `alb-cross-03.gfs`, `alb-dict-smoke.gfs`, `alb-morphodict-smoke.gfs`, `alb-names-preps.gfs`, `alb-noun-01.gfs`, `alb-noun-02.gfs`, `alb-noun-03.gfs`, `alb-noun-04.gfs`, `alb-noun-05.gfs`, `alb-noun-06.gfs`, `alb-noun-07.gfs`, `alb-noun-08.gfs`, `alb-noun-09.gfs`, `alb-noun-10.gfs`, `alb-numerals.gfs`, `alb-question-wh.gfs`, `alb-question-yesno.gfs`, `alb-relative-object.gfs`, `alb-relative-subject.gfs`, `alb-subordination.gfs`, `alb-syntax-adverbial.gfs`, `alb-syntax-basic.gfs`, `alb-syntax-complements-a.gfs`, `alb-syntax-complements-b.gfs`, `alb-syntax-coordination.gfs`, `alb-syntax-copular.gfs`, `alb-syntax-v2.gfs`, `alb-syntax-v3.gfs`, `alb-verb-01.gfs`, `alb-verb-02.gfs`, `alb-verb-03.gfs`, `alb-verb-04.gfs`, `alb-verb-05.gfs`, `alb-verb-06.gfs`, `alb-verb-07.gfs`, `alb-verb-08.gfs`, `alb-verb-09.gfs`, `alb-verb-10.gfs`

Their existence does **not** automatically certify every C9 row. A baseline scenario counts toward C9 certification only after its assertions/outputs are explicitly mapped to the relevant row/test ID.

## 2. C9 focused test families

| Test family | Capability | Existing candidate overlap | Required new evidence | Current C9 status |
|---|---|---|---|---|
| `T-C9-STR-PREP` | prepositions/government | `alb-names-preps.gfs` | case/government contrast table | planned |
| `T-C9-STR-NOMINAL` | pronouns/interrogatives/case | question + clitic scenarios | full/free pronoun and case contrasts | planned |
| `T-C9-STR-DETQUANT` | determiners/quantifiers/predets | noun/numeral scenarios | definiteness/number/nyje contrasts | planned |
| `T-C9-STR-LINKING` | conjunction/subordination | `alb-subordination.gfs`, coordination | mood/subordinator contrasts | planned |
| `T-C9-STR-ADVERBIAL` | deictic/degree/discourse adverbs | adverbial scenarios | directional/deictic contrasts | planned |
| `T-C9-STR-VERBAL` | modals/structural verbs | `alb-complement-control.gfs` | VV complement strategy by modal | planned |
| `T-C9-STR-MISC` | utterance/vocative/title tail | syntax basic | focused reachability + review | planned |
| `T-C9-EXT-GENITIVE` | GenNP/GenIP/GenRP/GenMod* | no dedicated baseline | genitive/article/case contrasts | missing_dedicated_test |
| `T-C9-EXT-SLASH` | pied-piping/stranding/relative/question | relative + question scenarios | explicit strategy comparison | missing_dedicated_test |
| `T-C9-EXT-VPSVPI` | VPS/VPI/VPS2/VPI2 | complement-control overlap | coordination, subjunctive/complement, shared object | missing_dedicated_test |
| `T-C9-EXT-EXISTENTIAL` | existential families | construction scenarios may overlap | agreement/definiteness/polarity | missing_dedicated_test |
| `T-C9-EXT-FOCUS` | focus/fronting | none identified | acceptability/order contrasts | missing_dedicated_test |
| `T-C9-EXT-VPBRIDGE` | participle/passive/progressive/purpose/by/without | verb scenarios may overlap | voice/TAM/agent/complement contrasts | missing_dedicated_test |
| `T-C9-EXT-RNP` | reflexive/RNP possession/coordination | clitic overlap only | person/agreement/reflexive possession | missing_dedicated_test |
| `T-C9-EXT-LEXTAIL` | gender/politeness/DAP tail | no dedicated baseline | targeted lexical/API tests | planned |
| `T-C9-EXT-LISTS` | ListComp/ListImp boundaries | coordination overlap | lock-safe list construction + behavior | planned |
| `T-C9-EXT-SCAFFOLD` | remaining Extend scaffolding | mixed baseline | function-specific tests by row | planned |
| `T-C9-EXTRA-COMPAT` | common Extra compatibility | none explicit | parity with retained Extra surface | planned |
| `T-C9-API-SYNTAX` | facade-only Syntax | none | application-author smoke grammar | missing |
| `T-C9-API-CONSTRUCTORS` | Constructors facade | none | generic constructor reachability | missing |
| `T-C9-API-COMBINATORS` | generic/specialized combinators | none | `appCN/appCNc` Albanian semantics | missing |
| `T-C9-API-TRY` | Try exports/overloads/collisions | none | export census + representative calls | missing |
| `T-C9-API-SYMBOLIC` | Symbolic facade | none | mixed number/symbol constructions | missing |
| `T-C9-MARKUP` | rich-category markup | none | table-cell/nested markup tests | missing |
| `T-C9-SYMBOL` | symbols/numeric NPs | numerals only | case/agreement/list behavior | missing |
| `T-C9-DOCUMENTATION` | inflection/document rendering | none | representative N/A/V/Prep/Cl tables | missing |

## 3. Test-case record schema

When a concrete test is added, record:

```text
TEST_ID: T-C9-<family>-NNN
MATRIX_ROWS: [...]
SOURCE_LOCK:
INPUT_GRAMMAR:
SCENARIO:
EXPECTED_CONTRAST:
NEGATIVE/ALTERNATIVE CASE:
LINGUISTIC_EVIDENCE: [...]
RESULT:
GOLD_PATH: optional
REVIEW_STATUS:
```

## 4. Coverage rule

A high-risk matrix row cannot reach `gold_certified` unless at least one test case names that row explicitly. Family-level scenario success is insufficient when multiple functions could produce the same output.
