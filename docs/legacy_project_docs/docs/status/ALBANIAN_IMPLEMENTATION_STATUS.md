# Albanian RGL — Implementation Status

**Baseline date:** 2026-09-19  
**Current-state synchronization:** 2026-09-23  
**Project:** Grammatical Framework — Albanian RGL  
**Compiler:** GF 3.12  
**Validation tool:** GF Wordbench

---

## 0A. Current evidence overlay — 2026-09-23

GF 3.12 Wordbench diagnostic run `20260923_183542` establishes a new compiler
state for the current branch: **54/54 GF targets compile**, all five public API
facades are included, and structural lock warnings are **0**. The behavioral
campaign executes all 50 scenarios with **49 OK / 1 FAIL / 0 ERROR**.

The only failing scenario, `alb-complement-control`, fails during PGF generation
before its cases can linearize. Raw stdout identifies `Internal error in
GeneratePMCFG` with nested `Predef.error "Cannot find an inflection rule"`; the
subsequent `empty grammar, no abstract` lines are downstream symptoms. The
validation input used `P.mkVV "dua"` for C0371-C0375 even though *dua* is an
irregular verb already represented by `IrregSqi.dua_V` and
`StructuralSqi.want_VV`. The candidate campaign repair now uses `St.want_VV`
for those five cases and awaits a GF 3.12 rerun.

The older 2026-09-22 overlay is retained below as historical progression, not
as the latest live state.

## 0. Current working-snapshot overlay — 2026-09-22

FIX22C remains historical evidence for its exact source. The current source now includes the public-surface expansion (`MarkupSqi` in the language folder and `CombinatorsSqi` in the API folder) and has a complete source census of 54 GF files.

Latest compiler evidence is Wordbench Global Scan `20260922_123316`, GF 3.12:

```text
49 automatically discovered language-folder targets
22 PASS
27 FAIL
0 ERROR
0 TIMEOUT
0 scenarios
```

Raw GF stderr identifies one proven current root compiler blocker:

```text
ParadigmsSqi.gf:
  circular definitions: mkA2
```

The 27 failed importers are not accepted as 27 independent Albanian defects. Wordbench's current `Voc`/`Int` first-error labels are reporting artifacts and must be subordinated to raw GF stderr provenance.

The same run also exposes nine structural `missing lock field` warnings (`lock_NP` x2, `lock_VP` x6, `lock_VPSlash` x1) that remain blocking under the project's lock-field policy.

The five parent-directory API facades were not included by automatic discovery. Full compiler acceptance therefore requires **54/54**: 49 language-folder modules plus `CombinatorsSqi`, `ConstructorsSqi`, `SymbolicSqi`, `SyntaxSqi`, and `TrySqi`.

Compendium evidence reaches T0; aggregate compile T8 fails; linguistic scenarios remain unassessed. Operational order is normative in `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`; the next coherent code/tool cycle is defined in `ALBANIAN_NEXT_UPGRADE_20260922.md`.

---

## 1. Historical 2026-09-22 overall status

The table below records the pre-closure 2026-09-22 state. It is retained for progression history and must not override the 2026-09-23 evidence overlay above. The Albanian project had two states that must not be conflated:

| Area | FIX22C / v0.1.0 baseline | 2026-09-22 post-mega-update snapshot |
|---|---|---|
| Core category/resource architecture | compiler-validated baseline | ALB-DEC-047 representation has historical/current-branch compiler evidence, but the present run is blocked earlier by `ParadigmsSqi` |
| Morphology/paradigm implementation | substantial and baseline-validated | explicit subjunctive architecture has compiler evidence, but the public paradigms API currently fails on circular `mkA2`; linguistic scenario validation remains pending |
| Core grammar / Structural | passed historical gate | some modules compile, but importer coverage is blocked by current `ParadigmsSqi.mkA2` circular definition |
| `ExtendSqi` / PMCFG | passed historical gate; final `.gfo` produced | historical PMCFG path remains the regression baseline; current failures are downstream of the `ParadigmsSqi` blocker unless a rerun proves otherwise |
| `LexiconSqi` / `LangSqi` / `AllSqi` | passed historical gate | current run reaches the shared `ParadigmsSqi.mkA2` circular-definition dependency |
| Public facades (`CombinatorsSqi`, `ConstructorsSqi`, `SymbolicSqi`, `SyntaxSqi`, `TrySqi`) | not part of the original eight-target FIX22C table | required five-target supplemental gate; not discovered in the latest run |
| Scenario/golden linguistic validation | pending | pending; `Scenarios seen: 0` in latest scan |

At that historical point, the project phase was:

> **harden Paradigms overloads → close lock warnings → obtain 49/49 language compile → complete five API facades for 54/54 → harden Wordbench evidence → run reviewed Albanian scenarios/goldens → continue capability completion**

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

The compiler/structural release gate was complete at FIX22C for that historical snapshot. The current expanded candidate must restore and exceed that gate before mature/completion work resumes.

The immediate next upgrade is:

1. remove the proven `mkA2` circular overload and audit the related `ParadigmsSqi` self-dispatch families through typed core helpers;
2. compile the dependency ladder to expose any next independent cause without counting importer fallout as separate defects;
3. close the current nine `missing lock_*` warnings through category-preserving constructors/retyping;
4. obtain **49/49** language-folder compilation;
5. compile all five public facades, including `CombinatorsSqi`, to establish **54/54**;
6. fix Wordbench fatal-diagnostic classification and source-lock reporting so the next run preserves causality cleanly;
7. run reviewed Albanian sentence/scenario goldens;
8. then resume remaining capability/linguistic completion from the completion plan.

The exact upgrade contract is `ALBANIAN_NEXT_UPGRADE_20260922.md`.

---

## 19. Current completion assessment

The most accurate description of the project today is:

```text
The Albanian RGL has a substantial morphology, paradigm system,
core grammar, lexicon, structural vocabulary, construction layer,
extended grammar, Markup layer, and public API wrappers.

FIX22C remains the last compiler-stable historical baseline for its
exact source. The 2026-09-22 expanded snapshot contains 54 GF files.
Wordbench reaches all 49 language-folder modules but GF 3.12 currently
rejects ParadigmsSqi because mkA2 is circular; 27 reported target
failures largely reflect that dependency path rather than 27 independent
defects. Nine missing-lock warnings also remain structurally blocking.

The five public API facades are not yet included by automatic Wordbench
discovery, and the latest run executes zero linguistic scenarios.
```

### Development phase

```text
HISTORICAL FIX22C BASELINE:  COMPILER-STABLE FOR ITS SOURCE
CURRENT 2026-09-22 SOURCE:   T0 SOURCE-LOCKED / T8 COMPILE FAIL
PARADIGMS OVERLOAD HARDENING: ACTIVE NEXT UPGRADE
LOCK-FIELD CLOSURE:          REQUIRED IN SAME STRUCTURAL CYCLE
FULL 54-FILE COMPILE GATE:   PENDING
API FACADE 5/5 GATE:         PENDING
SCENARIO REGRESSION:         NOT ASSESSED (0 SCENARIOS)
LINGUISTIC QA:               PENDING AFTER COMPILER RECOVERY
FINAL RGL RELEASE:           NOT YET
```

---

## 19. 2026-09-22 next-upgrade candidate

The planned structural recovery upgrade has been implemented as a candidate:
all twelve audited `ParadigmsSqi` overload families now use typed non-overloaded
core helpers, and the VP/VPSlash category shape is centralized in `ResSqi` and
aliased by `CatSqi`. `AdverbSqi` no longer passes locked `NP` values through
resource helpers typed as `NP`.

Static candidate validation is green at **54 source files = 49 language + 5 API
facades**. This is not yet a GF compiler result: the assembly environment does
not contain the `gf` executable. The current release state therefore remains
**compiler acceptance pending**, followed by scenarios/goldens.

Operational details and the reproducible validator command are in
`../ALBANIAN_UPGRADE_IMPLEMENTATION_20260922.md`.

---

## 2026-09-23 behavioral surface-hygiene overlay

The compiler/execution frontier has advanced beyond the older status text above. GF 3.12 run `20260923_194006` reports **54/54 compilation and 50/50 scenario execution**. That run is structurally green but not yet linguistically certified because it contains three empty CASE realizations and six visible `&+` token-binding artifacts.

ALB-DEC-055 is implemented as the corrective overlay: `ResSqi` joins productive `-jë` morphology without `BIND`; `IrregSqi` owns exact paradigms for `blej`, `them`, and `bëhem`; `LexiconSqi` consumes those irregular values; and `ParadigmsSqi.irregVFull` preserves their full represented tense/mood inventory. GF 3.12 rerun acceptance is pending. The next successful run must be both 54/54 + 50/50 **and** free of the nine recorded surface defects.

---

## 2026-09-23 ALB-DEC-056 parameter-provenance correction

Run `20260923_201645` is a compile-regression checkpoint, not evidence against
the irregular/surface design of ALB-DEC-055. `ResSqi`, `ParadigmsSqi`, and
`IrregSqiAbs` reached successful compilation; `IrregSqi` failed at renaming on
unqualified `Number`/`Person`, and its import closure then failed downstream.

The corrected candidate opens `(P = ParamX)` in `IrregSqi` and qualifies all
common number/person constructors in the local helper tables. GF 3.12 acceptance
is pending a rerun. Surface-hygiene acceptance remains pending the same rerun;
no linguistic certification is claimed from compile recovery alone.

---

## 2026-09-24 linguistic root-repair candidate (ALB-DEC-057)

The current accepted runtime baseline is no longer the old compiler-failure state:
GF 3.12 run `20260923_214430` completed **54/54 compile + 50/50 scenarios**, with
zero structural-lock warnings.  Linguistic certification remains explicitly
`NOT ESTABLISHED`.

The current source candidate implements the next linguistic repair layer:

- token-safe auxiliary + participle composition across productive verb families;
- full irregular paradigms for the audited high-alternation verbs and auxiliaries;
- a public worst-case `NForms -> Gender -> N` constructor and explicit paradigms for
  `libër`, `djalë`, `burrë`, and `mollë`;
- a full Species/Case/Gender/Number articulated-adjective linking-article table;
- typed dative government for audited V3 indirect objects;
- typed pre/post nominal placement for `Quant`/`Det` and case-sensitive ordinary
  possessive morphology.

Status: **IMPLEMENTED CANDIDATE / GF 3.12 RERUN PENDING**.  The local assembly
machine lacks `gf`; no compiler or linguistic certification is inferred from static
checks.
