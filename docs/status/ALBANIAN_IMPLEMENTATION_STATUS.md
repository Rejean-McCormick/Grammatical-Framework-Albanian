# Albanian RGL — Implementation Status

**Date:** 2026-09-19  
**Project:** Grammatical Framework — Albanian RGL  
**Compiler:** GF 3.12  
**Validation tool:** GF Wordbench

---

## 1. Overall status

The Albanian RGL now has a **working compiler-stable foundation**.

The language is not finished yet, but it is no longer in a state where the main extension grammar is blocked by the compiler.

The current situation is:

| Area | Status |
|---|---|
| Core Albanian category system | Implemented |
| Albanian resource types | Implemented |
| Morphology | Large implementation present |
| Paradigm API | Implemented |
| Core grammar | Implemented and assembled |
| Standard lexicon | Large implementation present |
| Structural vocabulary | Broad implementation present, with some open items |
| `ExtendSqi` | Compiles successfully |
| PMCFG generation | Working |
| Final `ExtendSqi.gfo` | Produced successfully |
| Full language-wide regression | Pending |
| Scenario/golden linguistic validation | Pending |
| Linguistic completion of all extensions | In progress |

The project is therefore in the phase:

> **stabilize, validate, and complete the Albanian language implementation**

rather than:

> **repair the compiler pipeline until Albanian builds at all**

---

## 2. What is confirmed working by the current compiler

The latest Wordbench validation confirms the following with GF 3.12:

### `ExtendSqiHelpers.gf`

```text
Status: OK
```

The helper layer used by the Albanian extension grammar compiles successfully.

### `ExtendSqi.gf`

```text
Status: OK
```

The Albanian implementation of the GF `Extend` interface reaches PMCFG generation successfully.

### Final compiled artifact

```text
ExtendSqi.gfo
```

is produced.

This confirms that the main Albanian extension layer is no longer blocked by the previous GF backend failure.

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

## 12. Inherited extension families

Not every function in `Extend` is locally implemented.

This is intentional.

The current architecture uses `ExtendFunctor` as the default source of shared structure and only overrides functions where Albanian needs a language-specific implementation or where the inherited implementation is insufficient.

In particular, the current cycle keeps the VPS/VPI/VPS2/VPI2 family inherited.

Some inherited functions can still have empty `variants {}` implementations.

Current compiler evidence shows that those empty inherited entries **do not prevent `ExtendSqi.gfo` from being produced**.

They therefore represent **coverage/completion work**, not a current compiler blocker.

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

GF 3.12 can now complete PMCFG generation for `ExtendSqi` and write the final GFO.

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

### Full regression

The successful Wordbench runs used the `quick` mode.

They establish compilation of the tested modules, but they do not constitute a full Albanian regression.

### Scenario tests

The latest successful runs report:

```text
Scenarios seen: 0
```

Therefore sentence-level behavioral coverage still needs to be added/run.

### Golden linguistic validation

A systematic comparison of generated Albanian against expected/golden forms is still required before declaring the language complete.

---

## 15. Current warning to keep separate

Compilation currently has a tracked warning around:

```text
DConj
```

This is a local structural/abstract-interface issue.

It does not invalidate the fact that `ExtendSqi` now compiles, but it should be resolved during the structural cleanup phase.

---

## 16. Validation levels

To avoid overstating the project status, use the following meanings.

### Compiler-confirmed

The current compiler has successfully accepted the relevant module.

Currently confirmed at minimum for:

```text
ExtendSqiHelpers.gf
ExtendSqi.gf
```

with final `ExtendSqi.gfo` production.

### Implemented in source

The subsystem has substantial concrete Albanian code and is wired into the grammar, but has not necessarily been re-run through the complete current regression suite.

This applies broadly to:

```text
CatSqi
ResSqi
MorphoSqi
ParadigmsSqi
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
LexiconSqi
StructuralSqi family
```

### Linguistically validated

This level should be reserved for constructions that have expected-output tests or equivalent linguistic evidence.

The whole Albanian RGL has **not yet reached this level**.

---

## 17. Remaining path to completion

The remaining work is now mainly:

1. run a language-wide Wordbench regression;
2. establish sentence/scenario tests;
3. validate morphology and syntax against expected Albanian outputs;
4. resolve the remaining structural warning/open symbols;
5. complete inherited or deliberately unfinished `Extend` functions;
6. replace provisional extension realizations where linguistic refinement is still required;
7. validate the standard lexicon through representative paradigms;
8. produce a clean final regression with no unexplained warnings;
9. only then declare Albanian RGL complete.

---

## 18. Current completion assessment

The most accurate description of the project today is:

```text
The Albanian RGL has a substantial morphology, paradigm system,
core grammar, lexicon, structural vocabulary, and extended grammar.

The main Extend grammar now compiles successfully through PMCFG
and produces ExtendSqi.gfo.

The remaining work is primarily full regression, test coverage,
linguistic validation, cleanup of known partial areas, and completion
of functions that are still deliberately inherited or provisional.
```

### Development phase

```text
FOUNDATION:        WORKING
CORE IMPLEMENTATION: SUBSTANTIAL
EXTEND COMPILATION: WORKING
FULL REGRESSION:   PENDING
LINGUISTIC QA:     IN PROGRESS
FINAL COMPLETION:  NOT YET
```
