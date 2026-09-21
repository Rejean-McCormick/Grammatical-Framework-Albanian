# Albanian RGL — Implementation Status

**Baseline date:** 2026-09-19  
**Current-state synchronization:** 2026-09-21  
**Project:** Grammatical Framework — Albanian RGL  
**Compiler:** GF 3.12  
**Validation tool:** GF Wordbench

---

## 0. Current working-snapshot overlay — 2026-09-21

This document contains substantial FIX22C baseline information. That baseline remains valid historical evidence for its exact source snapshot, but the later mega-update is **not yet compiler-stable**.

Latest compiler evidence is Wordbench Global Scan `20260921_201720` on candidate (11), GF 3.12:

```text
47 automatically discovered language-folder targets
27 PASS
20 FAIL
0 ERROR
0 TIMEOUT
0 scenarios
```

The earlier syntax-corruption layer is repaired, and the candidate (11) clitic repair removed the former `CProj "cl"` PMCFG family. The dominant remaining backend trace instead descends through `CProj "Indicative" (CProj "v" ...)`, reached by syntax that reconstructs subjunctive morphology from present-indicative surface strings.

Candidate (12), pending local GF validation, moves this distinction to the morphology boundary: `ResSqi.Verb` has an explicit `Subjunctive` table and `VP`/`VPSlash` copy the complete currently represented verbal form inventory instead of retaining a nested `v : Verb`. The independent `LexiconSqi.distance_N3` prep-overload failure is also repaired with explicit case government.

Candidate (12) static preflight over the complete 52-file source census is clean (Wordbench static scan 0 findings / 0 exceptions; `gf_morphosqi_lint.py` 0 findings). This is **not** compiler acceptance.

Operational order is normative in `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`; exact live facts are in `CURRENT_REPAIR_STATE.md`.

---

## 1. Overall status

The Albanian project has two states that must not be conflated:

| Area | FIX22C / v0.1.0 baseline | Current post-mega-update snapshot |
|---|---|---|
| Core category/resource architecture | compiler-validated baseline | representation changed in candidate (12); pending GF 3.12 revalidation |
| Morphology/paradigm implementation | substantial and baseline-validated | explicit subjunctive table added in candidate (12); pending compiler and linguistic revalidation |
| Core grammar / Structural | passed historical gate | partially recompiling in latest run; remaining result depends on Verb→VP PMCFG repair |
| `ExtendSqi` / PMCFG | passed historical gate; final `.gfo` produced | current run still fails through shared Verb→VP PMCFG path; candidate (12) pending |
| `LexiconSqi` / `LangSqi` / `AllSqi` | passed historical gate | latest run exposes shared PMCFG fallout plus an independent `distance_N3` overload; candidate (12) pending |
| Public facades (`SyntaxSqi`, `ConstructorsSqi`, `SymbolicSqi`, `TrySqi`) | not part of the original eight-target FIX22C table | required supplemental gate after recovery |
| Scenario/golden linguistic validation | pending | pending; `Scenarios seen: 0` in latest scan |

Therefore the current project phase is:

> **validate the candidate (12) Verb→VP morphology boundary → complete the 52-file compiler census → re-establish/exceed the historical compiler gate and public facades → validate Albanian behavior → continue capability completion**

The project is not back in the old pre-FIX22C PMCFG-repair phase. The historical PMCFG crash is a regression boundary, while the current first blocker is a newer syntax regression introduced after the baseline.

---

## 2. What FIX22C confirmed for the historical baseline

The FIX22C Wordbench validation with GF 3.12 confirmed a compiler-stable Albanian core for that historical snapshot.

### FIX22C release-gate targets

The following modules completed Wordbench quick validation successfully and produced their final `.gfo` artifacts:

```text
StructuralSqi.gf    OK
GrammarSqi.gf       OK
LexiconSqi.gf       OK
ConstructionSqi.gf  OK
ExtendSqi.gf        OK
LangSqi.gf          OK
AllSqi.gf           OK
TestSqi.gf          OK
```

The former GF 3.12 PMCFG backend crash is absent from these runs.

### `ExtendSqiHelpers.gf`

Earlier targeted validation also confirmed:

```text
Status: OK
```

The helper layer used by the Albanian extension grammar compiles successfully.

### `ExtendSqi.gf`

```text
Status: OK
```

The Albanian implementation of the GF `Extend` interface reaches PMCFG generation successfully and produces:

```text
ExtendSqi.gfo
```

### Public language composition

FIX22B resolved two paradigm-dispatch failures that prevented the public language surface from compiling:

```gf
_ + "ëj" => mkV042 form;
```

for `bëj` / `do_V2`, and:

```gf
_ + "uri" => mkN459 form;
```

for `dashuri` / `love_N`.

After these repairs, Wordbench confirms successful compilation and final `.gfo` production for:

```text
LexiconSqi.gf
LangSqi.gf
AllSqi.gf
```

This establishes that the repaired compiler/structural core is stable enough to serve as the `albanian-rgl-core-v0.1.0` baseline.

---


## 3. Core Albanian type system

`CatSqi.gf` defines the concrete Albanian representation of the principal RGL categories.

Implemented categories include:

- nouns: `N`, `N2`, `N3`;
- adjectives: `A`, `A2`, `AP`;
- verbs: `V`, `VA`, `VV`, `VS`, `VQ`, `V2`, `V2S`, `V2Q`, `V3`, `V2A`, `V2V`;
- noun phrases and pronouns: `NP`, `Pron`;
- determiners, quantifiers and numerals;
- prepositions;
- clauses and sentences;
- questions;
- relatives;
- verb phrases and slash categories;
- conjunctions and subordinators;
- imperatives;
- complements and other RGL support categories.

Important Albanian-specific structures are represented explicitly.

For example:

```gf
NP = {
  s : Case => Str ;
  a : Agr
}
```

and:

```gf
AP = {
  s : Species => Case => Gender => Number => Str
}
```

This means the implementation is not merely a flat-string grammar: important case, gender, number, species and agreement information is represented in the concrete syntax.

---

## 4. Albanian grammatical resource layer

`ResSqi.gf` provides the central Albanian grammatical data structures.

The current resource layer includes:

- grammatical case;
- gender;
- number;
- definiteness/species;
- agreement;
- noun inflection tables;
- adjective inflection tables;
- complement/preposition representation;
- Albanian verbal morphology structures;
- Albanian tense distinctions used by the verb system.

The noun representation supports:

```text
Indefinite / Definite
×
Nominative / Accusative / Dative / Ablative
×
Singular / Plural
```

This provides the main morphological foundation required by the higher grammar modules.

---

## 5. Morphology

The Albanian morphology is already a substantial part of the implementation.

In the current source snapshot, `MorphoSqi.gf` contains approximately:

```text
563 noun paradigm classes
36 adjective paradigm classes
135 verb paradigm classes
```

These are not merely lexical entries; they are morphological construction families used by the Albanian paradigm layer.

The morphology covers inflectional distinctions needed by the concrete category system, including noun case/number/definiteness and adjective agreement.

This is one of the most developed parts of the Albanian implementation.

---

## 6. Paradigm API

`ParadigmsSqi.gf` provides the public construction layer over the morphology.

It contains smart paradigm machinery for building Albanian lexical categories rather than requiring every lexical entry to manually specify full inflection tables.

The paradigm layer includes construction support for major lexical classes such as:

- nouns;
- relational nouns;
- adjectives;
- verbs;
- transitive and complement-taking verbs;
- prepositions;
- adverbs and related lexical categories.

The regular noun machinery already dispatches over a large number of Albanian morphological classes.

This means the lexicon can generally be written with citation forms and appropriate smart constructors instead of duplicating low-level morphology.

---

## 7. Core syntax

The Albanian core grammar is assembled by `GrammarSqi.gf`.

It integrates:

```text
NounSqi
AdjectiveSqi
NumeralSqi
VerbSqi
SentenceSqi
QuestionSqi
RelativeSqi
ConjunctionSqi
IdiomSqi
TextSqi
PhraseSqi
```

Therefore the project already contains concrete Albanian implementations for the principal grammatical layers of the GF Resource Grammar Library.

### Nominal syntax

The codebase contains Albanian logic for:

- common nouns;
- noun phrases;
- determiners;
- quantification;
- adjectival modification;
- case realization;
- agreement;
- possessive and relational nominal structures.

### Verbal syntax

The codebase contains Albanian logic for:

- basic verbs;
- transitive verbs;
- complement-taking verbs;
- verb phrases;
- slash constructions;
- verbal complementation;
- sentence predication.

### Clause and sentence syntax

The source includes concrete modules for:

- declarative sentences;
- questions;
- relative constructions;
- conjunction;
- sentence/text composition;
- phrase/utterance realization.

These layers are already connected through `GrammarSqi`.

---

## 8. Language assembly

`LangSqi.gf` combines:

```gf
GrammarSqi,
LexiconSqi
```

and defines:

```gf
startcat = Phr ;
```

The Albanian implementation therefore has the expected high-level RGL language assembly: grammar plus lexicon with phrase-level output as the start category.

---

## 9. Standard lexicon

`LexiconSqi.gf` is a substantial Albanian concrete lexicon.

The current snapshot contains approximately:

```text
348 standard lexical linearizations
```

It includes examples across the normal RGL lexical inventory:

- nouns;
- adjectives;
- intransitive verbs;
- transitive verbs;
- verbs selecting sentence/question/verb complements;
- adverbs;
- interjections;
- relational nouns and other lexical types.

The lexicon is built through the Albanian paradigm API rather than as an independent flat-string dictionary.

---

## 10. Structural vocabulary

The project contains a broad Albanian `StructuralSqi` implementation divided into subsystem modules.

The source currently includes structural vocabulary for areas such as:

- prepositions;
- conjunctions;
- subordinators;
- adverbs;
- interrogative adverbs;
- quantificational elements;
- pronouns;
- determiners;
- closed-class verbal and nominal material.

`StructuralSqi.gf` is designed primarily as an aggregator over:

```text
StructuralSqiClause
StructuralSqiNominal
StructuralSqiVerbal
```

This separation is useful because closed-class grammar can be developed and validated by subsystem rather than accumulating in one monolithic file.

### Current limitation

The structural layer should **not yet be described as fully validated**.

Known tracked items remain, including the `DConj` area and `must_VV`.

They should be handled as individual completion tasks rather than as evidence that the whole structural layer is unusable.

---

## 11. Extended RGL coverage

`ExtendSqi.gf` now provides a working Albanian implementation of the extended RGL interface while keeping the main coordinator thin.

Albanian-specific extension logic is split across dedicated modules:

```text
ExtendSqiScaffolding
ExtendSqiExistential
ExtendSqiAPCN
ExtendSqiFocusPrep
ExtendSqiVPBridge
ExtendSqiRNP
ExtendSqiLexicon
ExtendSqiHelpers
```

The extension work covers areas including:

- generalized NP/IP/RP structures;
- pied piping and stranded slash constructions;
- pro-drop support;
- complements;
- direct-speech/complement constructions;
- gerund-related constructions;
- existential constructions;
- AP/CN conversions;
- focus constructions;
- prepositional constructions;
- participial and VP bridge constructions;
- reflexive/recursive NP structures;
- extended pronoun and lexical support;
- Comp/Imp list coordination boundaries.

The complete `ExtendSqi` module currently compiles and generates its GFO.

That is a major functional milestone because `ExtendSqi` exercises a much broader part of the Albanian category and helper architecture than an isolated morphology module.

---

## 12. VPS/VPI extension-family ownership

At the FIX22C historical baseline, inheritance of the VPS/VPI/VPS2/VPI2 family was the compiler-stable path used to move past an earlier local PMCFG failure. That evidence remains valuable, but it is **not the current source state**.

The post-FIX22C mega-update now subtracts and locally implements this family in `ExtendSqi.gf`, while stale comments in the same file still describe the family as inherited. The current source is therefore internally inconsistent and the family ownership is **provisional**.

After syntax/compiler recovery, the family must resolve to one coherent final state:

- inheritance from `ExtendFunctor` if category-correct and behaviorally sufficient; or
- a dedicated Albanian companion owner if exact Albanian evidence requires richer local structure.

Substantive VPS/VPI-family realization logic is not a final responsibility of the thin `ExtendSqi.gf` coordinator.

---

## 13. What can currently be considered solid

The following foundations are strong enough to build on:

### Morphological architecture

The language has explicit Albanian noun, adjective and verb morphology rather than relying on generic flat forms.

### Category architecture

Rich categories such as `NP`, `AP`, nouns and verbs preserve grammatical information required by Albanian.

### Paradigm architecture

Lexical construction is routed through Albanian paradigms and morphological classes.

### Core grammar organization

The expected RGL grammar modules exist and are assembled through `GrammarSqi`.

### Lexical foundation

A substantial standard lexicon is already present.

### Extension architecture

`ExtendSqi` is split into owned subsystems rather than implemented as a monolithic collection of patches.

### Compiler pipeline

GF 3.12 **did** complete PMCFG generation for `ExtendSqi` and write the final GFO at the FIX22C historical baseline. The current mega-update must re-establish that property.

---

## 14. What remains partial

The following areas should still be considered incomplete or only provisionally validated.

### Full structural vocabulary

Some closed-class symbols remain tracked as open or warning-state items.

### Some extended constructions

Several `Extend` implementations have compiler-confirmed structure but still require linguistic validation for details such as:

- word order;
- punctuation;
- quotation behavior;
- exact complement realization;
- polarity/anteriority behavior;
- agreement in less common constructions.

### Inherited empty variants

Some inherited `ExtendFunctor` functions remain intentionally empty.

They are no longer a compiler blocker, but they still represent missing functional coverage.

### Behavioral regression

The successful FIX22C Wordbench release-gate runs used the `quick` mode.

They establish compiler/structural validation of the tested release-gate modules, but they do not constitute a sentence-level behavioral or golden Albanian regression.

### Scenario tests

The current release-gate runs report:

```text
Scenarios seen: 0
```

Therefore sentence-level behavioral coverage still needs to be added/run.

### Golden linguistic validation

A systematic comparison of generated Albanian against expected/golden forms is still required before declaring the language complete.

---

## 15. Historical warning to recheck after recovery

The FIX22C-era evidence tracked a warning around:

```text
DConj
```

That warning was a local structural/abstract-interface issue at the historical baseline. The current mega-update is blocked earlier by syntax corruption, so the DConj warning must be **re-observed**, not assumed current, after the lower-level blocker is removed.

---

## 16. Release milestone — Core v0.1.0

The compiler-stable foundation is published as the milestone:

```text
albanian-rgl-core-v0.1.0
```

The corresponding status snapshot is:

```text
docs/status/ALBANIAN_CORE_V0.1.0.md
```

The meaning of this milestone is deliberately narrow:

- the principal Albanian compiler/structural layers compile with GF 3.12;
- the public language composition reaches `AllSqi`;
- final `.gfo` artifacts are produced for the FIX22C release-gate targets;
- the former `GeneratePMCFG` backend crash is no longer present;
- the core can now be treated as frozen unless higher-level evidence exposes a foundational defect.

It does **not** mean that the Albanian RGL has reached full linguistic or behavioral completion.

The remaining work belongs to the completion phase: functional coverage, scenario tests, golden linguistic validation, warning cleanup, and higher-level parity with mature RGL languages.

---

## 17. Validation levels

To avoid overstating the project status, use the following meanings.

### Compiler-confirmed

The current compiler has successfully accepted the relevant module in the current release-gate campaign.

FIX22C confirms this level for:

```text
StructuralSqi.gf
GrammarSqi.gf
LexiconSqi.gf
ConstructionSqi.gf
ExtendSqi.gf
LangSqi.gf
AllSqi.gf
TestSqi.gf
```

with final `.gfo` production for each target.

Earlier targeted validation also confirmed `ExtendSqiHelpers.gf`.

### Implemented in source

The subsystem has substantial concrete Albanian code and is wired into the grammar, but compiler acceptance alone does not imply complete linguistic validation.

This applies broadly across the Albanian implementation, including:

```text
CatSqi
ResSqi
MorphoSqi
ParadigmsSqi
NounSqi
AdjectiveSqi
AdverbSqi
NumeralSqi
VerbSqi
SentenceSqi
QuestionSqi
RelativeSqi
ConjunctionSqi
IdiomSqi
TextSqi
PhraseSqi
TenseSqi
NamesSqi
LexiconSqi
StructuralSqi family
ConstructionSqi
ExtendSqi family
```

### Release-gate validated

This level means the module passed the FIX22C Wordbench compiler/structural gate and produced its final `.gfo`.

This is stronger than merely “implemented in source”, but still weaker than sentence-level behavioral validation.

### Linguistically validated

This level should be reserved for constructions that have expected-output tests, golden examples, or equivalent linguistic evidence.

The whole Albanian RGL has **not yet reached this level**.

---


## 18. Remaining path to completion

The compiler/structural release gate was complete at FIX22C. The current post-mega-update candidate is still in foundational compiler recovery and must restore and then exceed that historical gate before completion work resumes.

The remaining work is mainly:

1. establish Wordbench sentence/scenario suites;
2. validate morphology and syntax against expected Albanian outputs;
3. complete inherited or deliberately unfinished `Extend` functions;
4. revalidate VPS/VPI/VPS2/VPI2 ownership as a family, then address genuine `(0,0)` coverage gaps;
5. resolve the remaining structural warning/open-symbol areas such as `DConj` and `must_VV`;
6. replace provisional extension realizations where linguistic refinement is still required;
7. strengthen `ConstructionSqi` where current implementations are shallow or string-based;
8. validate the standard lexicon through representative paradigms and behavioral examples;
9. align the public top-level language surface with the intended full RGL feature set;
10. reduce unexplained compiler warnings;
11. run a true behavioral/golden regression;
12. only then declare Albanian RGL complete.

The immediate phase is therefore **foundational compiler recovery at the Verb→VP boundary**. Albanian RGL Completion resumes only after the compiler gate is green again.

---


## 19. Current completion assessment

The most accurate description of the project today is:

```text
The Albanian RGL has a substantial morphology, paradigm system,
core grammar, lexicon, structural vocabulary, construction layer,
and extended grammar.

FIX22C remains the last compiler-stable historical baseline. The
post-mega-update source has progressed from syntax corruption to a
well-isolated GF 3.12 PMCFG representation problem at the Verb→VP
boundary. Candidate (12) introduces explicit subjunctive morphology
and removes the nested VP.v.Indicative path, but has not yet been
compiler-validated.

Static preflight is clean across the full 52-file census. Scenario
and golden linguistic validation remain pending.
```

### Development phase

```text
HISTORICAL FIX22C BASELINE:  COMPILER-STABLE
CURRENT CANDIDATE (12):      STATIC-CLEAN / GF VALIDATION PENDING
VERB→VP PMCFG RECOVERY:      ACTIVE
FULL 52-FILE COMPILE GATE:   PENDING
SCENARIO REGRESSION:         PENDING
LINGUISTIC QA:               PENDING AFTER COMPILER RECOVERY
FINAL RGL RELEASE:           NOT YET
```
