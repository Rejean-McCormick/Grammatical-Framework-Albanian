# Albanian RGL — Model-Language Comparison

**Status:** supporting engineering evidence, not linguistic authority  
**Synchronized:** 2026-09-21  
**Corpus:** supplied `ModelLanguageGF(1).zip` (11 model-language text dumps, including integral duplicates for some languages)

---

## 1. Authority rule

Model languages are used only after the exact Albanian abstract signature, current Albanian lincat/resource contract, inherited `ExtendFunctor` path, and compiler evidence have been inspected.

They can establish or corroborate:

- normal GF implementation idioms;
- common ways to preserve category structure;
- candidate subsystem boundaries;
- examples of inherited versus local engineering patterns.

They **cannot** establish:

- Albanian word order;
- Albanian agreement or clitic placement;
- Albanian case selection;
- whether a particular inherited family is linguistically sufficient for Albanian;
- a golden Albanian output.

A model-language pattern is therefore a candidate implementation pattern, never a reason to override contradictory Albanian evidence.

---

## 2. Syntax-integrity comparison

A raw pattern census over the supplied 11 files gives:

| Pattern | Observed occurrences |
|---|---:|
| table abstraction `\\x => ...` | 2101 |
| ordinary function abstraction `\x -> ...` | 1847 |
| single-backslash `\x => ...` | 0 |
| `[] => ...` as a pattern | 0 |
| `=> []` as an empty result | 243 |
| `"" => ...` as an empty-string pattern | 2 |

The corpus contains duplicate/integral dumps, so these counts are **corpus observations, not counts of unique GF declarations**. Their value is the categorical contrast: the supplied model sources consistently distinguish function abstraction from table abstraction and do not use `[]` as an empty `Str` pattern.

For Albanian this corroborates, but does not replace, the local type/compiler rule:

```gf
\x -> expr       -- ordinary function abstraction
\\x => expr      -- table abstraction
"" => expr       -- empty Str pattern in a case over Str
_ => []          -- empty surface result
```

Every Albanian scan hit still requires local expected-type or scrutinee-type confirmation before editing.

---

## 3. Subsystem use

### RNP / reflexive NP

Bulgarian remains a useful **minimal engineering reference** where its category structure matches the Albanian question being studied. German can provide richer structural alternatives. Neither is a linguistic template for Albanian reflexives or possessives.

### AP/CN and rich-category bridges

Prefer examples that preserve rich category records instead of flattening to `Str`. A model implementation is useful only when the relevant source and target category roles are compatible with current Albanian lincats.

### Existentials, clauses, questions, relatives

Use model languages to inspect composition architecture, not to import word order or surface particles. Albanian core clause/question resources and Albanian reference material control linguistic realization.

### VPS/VPI/VPS2/VPI2

Model languages may help compare two engineering alternatives:

1. coherent inherited ownership; or
2. coherent local family ownership with a dedicated companion.

They do **not** decide which alternative Albanian needs. That decision requires exact `ExtendFunctor` coverage, current Albanian lincats/producers/consumers, current compiler/PMCFG evidence, and targeted Albanian scenarios.

### Verb → VP morphology boundary and PMCFG

The supplied model corpus gives strong **engineering** evidence for the current candidate (12) representation.

**Romanian** encodes conjunctive/subjunctive morphology in the verb-form inventory itself:

```gf
Subjo SPres Sg P1
Subjo SPres Sg P2
Subjo SPres Sg P3
...
```

Its VP realization then selects `verb ! Subjo SPres ...`; `ComplVV` composes that structured form with clitic/complement state. It does not recover subjunctive mood by inspecting an indicative surface string.

**Bulgarian** builds a structured VP through `predV` and realizes embedded verbal material through helpers such as `daComplex`. Object/clitic state is carried separately. Again, syntax composes a prepared verbal representation rather than pattern-matching a realized indicative string to infer mood.

**Greek** is an important qualification. Its VP can retain a lexical verb (`vp.v`), but the verb morphology itself already indexes mood (`VPres Con ...`). `ComplVV` selects the conjunctive form directly. Therefore **a nested verb record is not inherently invalid**; what current Albanian evidence rejects is the combination of a failing GF 3.12 nested projection and late mood inference from `Str`.

**German** centralizes verbal realization behind VP helpers such as `predV`, `useVP`, and `useInfVP`. Consumers reuse that interface rather than reconstructing lexical mood independently.

The transferable principle is therefore:

```text
morphology encodes the grammatical distinction
        ↓
VP preserves the structured information required by syntax
        ↓
syntax selects/composes it
```

not:

```text
syntax inspects a realized indicative string
        ↓
guesses another mood
```

For current Albanian, GF 3.12 run `20260921_201720` makes the more direct VP-table boundary preferable because PMCFG crashes while descending `VP.v.Indicative`. Candidate (12) therefore copies all currently represented verb-form tables into VP/VPSlash instead of keeping only a flattened string.

---

## 4. Anti-copy rule

Before adapting a model-language fragment, record:

1. exact Albanian abstract signature;
2. exact Albanian expected concrete type;
3. inherited/default implementation, if any;
4. the Albanian-specific reason the default is insufficient;
5. which structural idea is being borrowed;
6. which surface/linguistic details are **not** being borrowed;
7. the compile and Albanian scenario tests that will validate the adaptation.

If those items cannot be stated, do not transfer the model-language code.

---

## 5. Current conclusion

The supplied model languages strongly corroborate both the syntax-integrity repair (`\x ->` versus `\\x =>`, and `""` versus `[]` in a `Str` pattern) and the **engineering direction** of ALB-DEC-047: mood should be represented structurally before syntax consumes it. They do not establish Albanian subjunctive forms, clitic placement, VPS-family ownership, or any golden surface output.

For operational order use `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`; for current source facts use `CURRENT_REPAIR_STATE.md`.


## Compiler confirmation of the representation recommendation

GF 3.12 run `20260921_212128` provides direct Albanian compiler evidence for the engineering recommendation above. After moving finite subjunctive morphology into `Verb.Subjunctive` and copying structured verbal tables across the Verb→VP boundary, the Global Scan reaches **40 PASS / 7 FAIL** and reports **no `GeneratePMCFG` crash**. The previous `CProj "cl"` and `CProj "Indicative" (CProj "v" ...)` signatures are absent.

This compiler result upgrades the model-language comparison from prospective corroboration to corroboration of an Albanian implementation that the GF 3.12 backend accepts. It still does **not** validate the linguistic correctness of every subjunctive form or clitic placement; those require Albanian reference/golden evidence.

## Latest compiler follow-up

GF 3.12 run `20260921_213424` reaches **45 PASS / 2 FAIL** over the 47 automatically discovered targets, again with no `GeneratePMCFG` crash. This strengthens the compiler evidence for the structured Verb→VP recommendation. The two remaining failures are a local helper-name collision during `LangSqi` composition and are unrelated to the model-language representation comparison.

