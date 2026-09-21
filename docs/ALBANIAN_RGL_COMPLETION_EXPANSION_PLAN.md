# Albanian RGL Completion — Total Final-State Specification

**Date:** 2026-09-19  
**Operational synchronization:** 2026-09-21  
**Baseline:** `albanian-rgl-core-v0.1.0`  
**Target:** mature Albanian Resource Grammar Library implementation  
**Status:** normative description of the completed system  
**Validation harness:** GF Wordbench  
**Primary implementation language:** GF  

---

## 0. What this document is

This document defines the **complete target state** of the Albanian Resource Grammar Library.

It is not a milestone plan, sprint plan, gate sequence, repair checklist, or ordered list of patches. It does not say what must be implemented first. It says what must be true **when Albanian RGL is finished** and therefore provides the architectural and behavioral target against which any future implementation can be designed, coded, reviewed, and tested.

An AI or human maintainer must be able to use this document to answer four questions:

1. What grammatical information must Albanian RGL represent?
2. Which module owns that information and its realization?
3. Which information may be collapsed to a surface string, and at what boundary?
4. What evidence is required before a capability may be called complete?

The current compiler-stable baseline remains:

```text
albanian-rgl-core-v0.1.0
```

That baseline is historical evidence, not the final architecture. The frozen snapshot remains:

```text
docs/status/ALBANIAN_CORE_V0.1.0.md
```

The present document describes the **destination beyond that baseline**.

### Operational prerequisite

This document intentionally does not define patch order. The normative execution order is now `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`. As of 2026-09-21, the post-FIX22C mega-update has a syntax-level compile regression, so semantic completion work is gated behind syntax integrity, a full compile census, root-cause repair, and restoration of the historical FIX22C/public-facade compiler gates.

A historical stable baseline must never be read as proof that a later working snapshot still compiles.

---

## 1. Definition of the final objective

The final Albanian RGL is a language implementation whose public behavior and engineering maturity are comparable to mature GF RGL languages while remaining linguistically Albanian rather than structurally copied from another language.

The completed system must provide all of the following simultaneously:

- complete and coherent implementations of the core RGL grammar modules;
- a morphology capable of producing the grammatical forms required by those modules;
- a public paradigm API that constructs regular and irregular Albanian lexical items safely;
- clause and VP representations that preserve agreement, tense, anteriority, polarity, mood, voice, complement and clitic information until their correct realization boundaries;
- correct nominal case, number, gender and definiteness behavior;
- correct adjective agreement and Albanian linking-article behavior;
- correct pronoun, weak-form/clitic and reflexive behavior;
- correct declaratives, questions, relatives, imperatives and subordinate clauses;
- correct transitive, ditransitive, sentential, interrogative, adjectival and verbal complements;
- correct Albanian finite and embedded verbal constructions, including the structures required by `VPS`, `VPI`, `VPS2` and `VPI2`;
- structurally correct negation, coordination, subordination, passive/non-active and existential constructions;
- a full standard structural vocabulary and lexicon implemented through the same grammatical architecture as user-built expressions;
- mature `Construction`, `Extend`, irregular, documentation and public API surfaces;
- reproducible Wordbench regression coverage with reviewed expected outputs;
- no silent unsupported RGL function, no compiler-only placeholder presented as linguistic implementation, and no hidden string reconstruction of grammatical information.

The final implementation is therefore defined by **behavioral and representational completeness**, not by source-file count or successful compilation alone.

---

## 2. Meaning of “mature” for Albanian RGL

A mature Albanian RGL must satisfy six independent dimensions of maturity.

### 2.1 Abstract API maturity

Every abstract function that Albanian claims to implement has one of exactly three explicit states:

```text
implemented-and-validated
implemented-but-linguistically-provisional
explicitly-unsupported
```

There are no accidental omissions, unexplained inherited `variants {}`, or functions that compile only because a default implementation emits no usable language. For the pinned common RGL API, **implemented-and-validated is the normal final state**. `explicitly-unsupported` is reserved for a documented mismatch between the abstract operation and defensible Standard Albanian realization; it is not a convenience escape hatch for unfinished work.

### 2.2 Representation maturity

Concrete categories retain every grammatical distinction needed downstream and no longer depend on reconstructing those distinctions from strings.

The final architecture follows this invariant:

> A grammatical distinction remains typed until the last operation that can still change its realization.

### 2.3 Linguistic maturity

The grammar produces reviewed Standard Albanian realizations for the active capability inventory. Compiler acceptance does not establish this.

### 2.4 Compositional maturity

A construction created through `ConstructionSqi`, `StructuralSqi`, `LexiconSqi`, `ExtendSqi`, `SyntaxSqi`, or direct core constructors behaves like the same grammatical object created anywhere else. No public subsystem bypasses agreement, tense, negation, clitic or complement rules by emitting a fixed surface sentence.

### 2.5 Regression maturity

Every productive distinction and every architecture boundary has deterministic Wordbench evidence. Goldens are reviewed language evidence, not snapshots of whatever the code happened to emit.

### 2.6 Integration maturity

The public language entry points compile from a clean source state, the complete language composition exposes the intended RGL surfaces, documentation agrees with code, and a clean environment can reproduce the build and tests.

---

## 3. Non-negotiable architecture laws

These laws govern the completed implementation regardless of the exact GF record syntax chosen.

### 3.1 No premature surface realization

`VP`, `VPSlash`, `Cl`, `QCl`, `RCl`, `ClSlash`, `VPS`, `VPI`, `VPS2` and `VPI2` must not become plain strings while a later consumer can still alter:

- subject agreement;
- tense or anteriority;
- polarity;
- mood;
- voice;
- clause type;
- complement realization;
- clitic realization or ordering;
- question or relative structure;
- embedded versus matrix realization.

The current pattern in which `UseV` selects present 3sg is explicitly outside the final target.

### 3.2 One grammatical fact, one typed owner

Case government, control type, clitic role, definiteness, agreement and similar facts must have a single semantic owner. They must not be repeated as unrelated booleans or inferred from lexical strings.

### 3.3 No syntax by string inspection

No final implementation may decide grammatical behavior by testing prefixes, suffixes, spaces, token spelling, or previously generated surface material when typed grammatical metadata can represent the distinction.

### 3.4 Complements are first-class grammatical objects

A complement is not ultimately equivalent to `{s : Str}` if later syntax needs government or placement information. Adpositions and selected complements must preserve at least the distinctions required for case selection and argument realization.

### 3.5 Clitics are accumulated before they are flattened

Object, indirect-object and reflexive clitic material must be represented structurally until the grammar knows the complete local cluster and its clause context. Constructor call order must not accidentally determine Albanian clitic order.

### 3.6 Clause assembly is centralized

Finite clause ordering, verbal realization, negation and clitic placement must converge on a small shared realization service. Declaratives, questions, relatives and subordinate clauses may select different clause modes, but they must not each reimplement the complete Albanian verbal string independently.

### 3.7 Morphology derives forms; syntax selects them

`MorphoSqi` and morphology resources own the derivation of lexical forms. Syntax owns the grammatical choice among those forms. Syntax must not duplicate conjugation rules; morphology must not decide clause order.

### 3.8 Model languages provide patterns, not Albanian facts

No Bulgarian, Romanian, Greek, German, English, Croatian, Italian or Macedonian surface form is evidence for an Albanian surface form. Model languages are used only when their representation problem matches the Albanian problem.

### 3.9 Zero surface material may still carry structure

Pro-drop, null linking material, empty complementizers, omitted subjects, and other zero-realized elements may retain agreement, case, control or clause metadata.

### 3.10 Richness is local, not global

Some Albanian categories should remain shallow. Others must be rich. A mature grammar does not make every category a string, and it does not make every category maximally complex.

---

### 3.11 GF syntax integrity precedes architecture inference

Textual GF syntax must be valid before a failure is interpreted as a category, inheritance, PMCFG, or linguistic-design problem.

Canonical notation used by this project is:

```gf
\x -> expr       -- ordinary function abstraction
\\x => expr      -- table abstraction
"" => expr       -- empty Str pattern in a case over Str
_ => []          -- empty surface result
```

When a static scanner flags `\x =>` or `[] =>`, the local expected/scrutinee type must be checked before editing. The notation may be repaired only when that type establishes the intended construct. A syntax repair does not authorize a change to Albanian semantics.

## 4. Authority and reference policy

The final implementation uses evidence in the following order.

### 4.1 Contract authority

For category and function meaning:

```text
exact pinned abstract signature
    > current Albanian category/resource contract
    > accepted Albanian architecture decision
    > current inherited/functor contract
```

### 4.2 Linguistic authority

For Albanian realization:

```text
Albanian grammatical evidence / dictionaries / reviewed examples
    > validated Albanian corpus behavior
    > model-language structural analogy
```

### 4.3 Model-language roles

The supplied mature languages have distinct roles in the target design.

| Model | Final use in Albanian design |
|---|---|
| English | reference for RGL API and capability completeness |
| Bulgarian | primary structural reference for agreement-sensitive `VPS`/`VPI` and Balkan finite/embedded architecture |
| Romanian | primary reference for structured complements, pronoun/clitic preservation and centralized clitic flattening |
| Greek | secondary reference for Balkan embedded/subjunctive-like verbal realization and clause-boundary behavior |
| German | stress model for late realization, segmented VP/clause material and nontrivial ordering |
| Croatian | secondary evidence for South Slavic structural patterns when a specific representation question matches |
| Italian | secondary reference for mature reusable family architecture where relevant |
| Macedonian | Balkan comparison evidence only where the supplied implementation contains the needed complete subsystem |

Genealogical or geographic proximity is never enough to select a model.

### 4.4 AI Compendium patterns adopted as design vocabulary

The completed Albanian grammar is expected to conform, where applicable, to these Compendium patterns:

```text
EP004  deferred realization tables
EP005  segmented clause/VP slots
EP006  record-preserving updates
EP007  first-class complements
EP008  multi-form NP representation
EP009  metadata-driven syntax
EP010  in-place vs extraposed material
EP019  single clause assembly point
EP020  clitic cluster flattening
EP021  polarity propagation
EP022  control and argument metadata
EP025  lock-safe retyping
EP028  government resolved at the final boundary
EP030  lexically selected non-finite/embedded complement forms, if Albanian evidence requires them
EP033  modal subclass dispatch, only if composition algorithms genuinely differ
EP036  surface-zero elements retaining structure
EP037  tense/mood normalization at embedding boundaries
EP048  pro-drop at final nominal realization
EP050  clitic-conditioned verbal allomorphs, only if Albanian evidence requires them
```

Pattern use is conditional on Albanian evidence. A pattern ID is not itself an implementation requirement.

---

## 5. Final repository architecture

The completed language should present a familiar mature-RGL structure while preserving the useful Albanian subsystem split already established.

```text
AlbanianSQI/GF/lib/src/
├── SyntaxSqi.gf
├── ConstructorsSqi.gf
├── SymbolicSqi.gf
├── TrySqi.gf
└── albanian/
    ├── ResSqi.gf
    ├── CatSqi.gf
    ├── MorphoSqi.gf
    ├── ParadigmsSqi.gf
    │
    ├── NounSqi.gf
    ├── AdjectiveSqi.gf
    ├── AdverbSqi.gf
    ├── NumeralSqi.gf
    ├── VerbSqi.gf
    ├── SentenceSqi.gf
    ├── QuestionSqi.gf
    ├── RelativeSqi.gf
    ├── ConjunctionSqi.gf
    ├── IdiomSqi.gf
    ├── TextSqi.gf
    ├── PhraseSqi.gf
    ├── TenseSqi.gf
    │
    ├── StructuralSqi.gf
    ├── StructuralSqiRes.gf
    ├── StructuralSqiNominal.gf
    ├── StructuralSqiVerbal.gf
    ├── StructuralSqiClause.gf
    │
    ├── LexiconSqi.gf
    ├── ConstructionSqi.gf
    ├── DocumentationSqi.gf
    ├── MarkupSqi.gf                 # when supported by the pinned RGL public surface
    ├── NamesSqi.gf
    ├── IrregSqi.gf
    ├── ExtraSqi.gf
    ├── ExtraSqiAbs.gf
    │
    ├── ExtendSqi.gf
    ├── ExtendSqiHelpers.gf
    ├── ExtendSqiScaffolding.gf
    ├── ExtendSqiExistential.gf
    ├── ExtendSqiAPCN.gf
    ├── ExtendSqiFocusPrep.gf
    ├── ExtendSqiVPBridge.gf
    ├── ExtendSqiRNP.gf
    ├── ExtendSqiLexicon.gf
    ├── ExtendSqiVPS.gf              # final owner if local VPS/VPI ownership is required
    │
    ├── GrammarSqi.gf
    ├── LangSqi.gf
    ├── AllSqi.gf
    └── AllSqiAbs.gf
```

The exact presence of a public `MarkupSqi` or language-specific irregular abstract module must match the pinned RGL version. The **capability**, not a fictitious module name, is normative.

### 5.1 Ownership principle

- `ResSqi`: grammatical parameters, reusable resource records, realization services.
- `MorphoSqi`: inflectional form derivation.
- `ParadigmsSqi`: safe public lexical constructors and smart dispatch.
- core syntax modules: composition of ordinary RGL categories.
- `StructuralSqi*`: closed-class vocabulary and structural lexical items.
- `LexiconSqi`: standard open-class RGL lexicon.
- `ConstructionSqi`: standard RGL construction inventory built compositionally.
- `ExtendSqi*`: functionality of the `Extend` abstract surface not naturally owned by core modules.
- `IrregSqi`: explicit irregular lexical paradigms and exceptional principal parts, not a syntax patch bucket.
- `ExtraSqi`: Albanian-specific public extensions beyond the common RGL API.
- `DocumentationSqi`: human-readable inflection/documentation views of the real morphology.
- `LangSqi` / `AllSqi`: public composition only, with no hidden repair logic.

---

## 6. Final grammatical profile

The mature grammar targets **Standard Albanian**, with the standard variety as the default public realization. Dialectal Geg/Tosk alternatives may exist in explicitly named Albanian-specific extension functions or lexical variants, but must not silently destabilize the standard RGL output.

The active grammatical profile includes at least:

- grammatical number: singular/plural;
- person: first/second/third;
- productive nominal gender: masculine/feminine, with residual/neuter behavior represented only where Standard Albanian evidence and the public API require it;
- five surface case functions of Standard Albanian — nominative, accusative, dative, genitive and ablative — even where genitive/dative morphology is syncretic; genitive syntax must preserve the Albanian linking-article distinction rather than inventing a separate morphology solely for formal symmetry;
- indefinite/definite nominal morphology, including the postposed definite morphology of nouns;
- adjective agreement across the active gender/number/case system;
- Albanian adjective linking-article behavior;
- full and weak/clitic pronominal forms required by syntax;
- subject agreement on finite verbs;
- matrix and embedded finite verbal realization;
- Standard-Albanian/Tosk embedded verbal behavior without assuming an English-style productive infinitive; `të` + finite/subjunctive structures and other governor-selected strategies must be represented from Albanian evidence, while a Geg `me` + participle infinitive is dialectal unless an explicit Albanian-specific API elects to expose it;
- indicative, subjunctive/embedded, imperative, optative and admirative behavior where represented by the public Albanian API;
- the tense/anteriority distinctions required by the common RGL API;
- Albanian-specific simple and compound tense distinctions exposed by `ExtraSqi` where appropriate;
- positive/negative polarity;
- active and passive/non-active/reflexive behavior required by RGL constructors;
- argument case government and prepositional government;
- pro-drop where grammatical;
- questions, relatives, subordinate clauses and coordination;
- clitic ordering and placement;
- complement-taking verbs and control/raising-like behavior to the extent distinguished by Albanian grammar and the RGL API.

The profile is not considered complete merely because the morphology contains forms. Every active distinction must be reachable through syntax or explicitly documented as morphology-only.

---

## 7. Target category contracts

This section describes **semantic contracts**. The exact GF record syntax may differ if compiler constraints require it, but a final implementation must preserve the listed information and boundaries.

### 7.1 `Agr`

`Agr` remains the canonical subject/predicate agreement value.

It must encode at least:

```text
person
number
gender where singular agreement or downstream morphology requires it
```

The existing `GenNum` + `Person` representation is acceptable if all consumers can obtain the distinctions they need.

### 7.2 `N`, `N2`, `N3`, `CN`

Nominal lexical records must preserve:

```text
inflection by Species × Case × Number
gender
selected complements for N2/N3
```

`N2` and `N3` complements must be typed grammatical complements with government, not mere inserted strings.

`CN` must preserve the noun's inflection and gender through modification. An adjective, relative clause or PP modifier must not destroy its paradigm.

### 7.3 `PN`

Proper names must no longer be semantically equivalent to one invariant string when agreement or case behavior matters.

The final `PN` contract must preserve enough information for:

```text
case realization
gender/number agreement
prepositional use
subject agreement
```

`UsePN` must not force every proper name to masculine singular.

### 7.4 `NP`

`NP` is a central rich category. It must preserve at least:

```text
case-indexed full form
agreement
pronoun/clitic eligibility needed by verbal syntax
pro-drop or overt-subject information when relevant
```

A recommended semantic shape is:

```text
NP = {
  full : Case => Str ;
  agr  : Agr ;
  pronominal/clitic metadata ;
  overt-subject metadata
}
```

The final field names may differ.

### 7.5 `Pron`

`Pron` must preserve:

```text
full/tonic case forms
accusative weak/clitic form
dative weak/clitic form
agreement
possessive information when required by the API
social/polite person information if it affects agreement
```

`UsePron` must preserve the weak-form capability when converting `Pron` to `NP`; this information cannot disappear before `ComplSlash` or another argument consumer.

### 7.6 `A`, `A2`, `AP`

Adjective morphology must preserve the forms required by Albanian agreement and the linking-article system.

The final `AP` must remain selectable by the grammatical dimensions still controlled by its nominal or predicative context. Attributive and predicative uses may share morphology, but they must not be collapsed if they differ in linker or agreement behavior.

`A2` keeps its selected complement as a typed complement.

### 7.7 `Prep` / `Compl`

The final complement type must minimally preserve:

```text
surface adposition/complementizer material
governed case
whether a bare/zero adposition is permitted
any realization property that changes full NP versus clitic behavior
```

If later evidence demonstrates contraction, article interaction, split placement or other productive behavior, those become typed fields rather than string conventions.

A mature Albanian implementation must not rely on every `Prep` being `{s : Str}`.

### 7.8 `V`, `V2`, `V3`, `VA`, `VS`, `VQ`, `VV`, `V2A`, `V2S`, `V2Q`, `V2V`

Every verbal lexical category contains an Albanian verb paradigm plus exactly the lexical metadata required by its valency.

`V2`/`V3` families retain complement government.

`VV` and `V2V` additionally retain typed complement/control metadata if Albanian lexical classes differ in:

- embedded verbal form;
- complementizer/particle strategy;
- subject versus object control;
- polarity behavior;
- impersonal versus agreeing realization;
- other stable lexical selection.

Such metadata must never be guessed from the verb spelling.

### 7.9 `VP`

`VP` is not a finished surface string in the final architecture.

It must retain enough structure to realize the predicate after the clause provides the missing context. Its semantic contract includes:

```text
agreement-sensitive predicate realization
finite/embedded/imperative realization choice where applicable
structured polarity interaction
structured clitic state
complement material
adverbial material
extraposed/embedded material where required
voice/reflexive state where required
```

The implementation may encode this through realization tables, segmented records, or a combination. It must not encode it by later surgery on a finished sentence string.

### 7.10 `VPSlash`

`VPSlash` is a `VP` with one structurally unsaturated complement.

It must preserve:

```text
the same deferred verbal information as VP
open complement government
argument role
clitic realization capability for the missing argument
```

`ComplSlash`, `ReflVP`, `SlashV2*`, `SlashV3*`, `SlashVV` and `SlashV2VNP` must operate on this structure without losing the distinction between full NP saturation and weak/clitic realization.

### 7.11 `Cl`

A `Cl` represents a clause before common RGL tense/anteriority/polarity selection is complete.

Its final contract must support selection by at least the active dimensions supplied by `UseCl` and the Albanian clause context. `PredVP` combines a subject and VP but must not destroy the later tense/polarity choices.

A suitable semantic model is:

```text
Cl = realization over ClauseTense × Anteriority × Polarity × ClauseMode
```

where the exact internal `ClauseMode` inventory is Albanian-specific and should be no larger than actual consumers require.

### 7.12 `ClSlash`

`ClSlash` is a clause that still carries one open complement and its government. It must preserve the clause realization dimensions plus that complement metadata.

### 7.13 `S`, `SSlash`

`S` may become surface-oriented after `UseCl` has consumed all remaining finite clause parameters. `SSlash` may become similarly shallow only if its open complement metadata remains available separately.

### 7.14 `QCl`, `QS`, `QVP`, `IP`, `IComp`, `IDet`, `IQuant`, `IAdv`

Question categories must preserve the dimensions needed for:

```text
yes/no questions
wh-subject questions
wh-object questions
prepositional/oblique questions
adverbial questions
embedded questions
agreement and case of interrogative phrases
```

Interrogative NPs and pronouns must be case-aware wherever Albanian morphology distinguishes the required forms.

`QCl` must be derived from the shared clause architecture, not from a finished declarative string.

### 7.15 `RCl`, `RS`, `RP`

Relative categories must preserve:

```text
antecedent agreement when required
relative role/case
open-complement information for relative gaps
finite clause tense/anteriority/polarity
relative marker strategy
```

The final implementation cannot ignore the clause/VP argument and return only `që` or another relative particle.

### 7.16 `Imp`

Imperatives must preserve the dimensions needed for Albanian imperative realization, including number/person where the morphology requires it and polarity because negative imperative syntax may differ from ordinary finite negation.

### 7.17 `Comp`

Predicative complements must preserve agreement-sensitive material. `CompAP`, `CompCN` and related constructors must not permanently select masculine singular forms before subject agreement is known.

### 7.18 `Conj` and list categories

Coordination lists must preserve the rich dimensions of their members. A list of NPs must remain case-selectable; a list of APs must remain agreement-selectable; a list of clauses must preserve any clause dimension still unresolved.

NP coordination must compute agreement rather than copying the first conjunct's agreement blindly. Person resolution and plural agreement must follow documented Albanian rules.

### 7.19 `VPS`, `VPI`, `VPS2`, `VPI2`

These are first-class final categories, not compiler scaffolding.

Their shared target is:

```text
VPS   = finite predicate/sentence material with tense/polarity fixed as required,
        but agreement retained until a subject or agreement consumer supplies it

VPI   = Albanian embedded verbal material retaining the agreement/context
        required by the selected embedded construction

VPS2  = VPS plus one unsaturated structured complement

VPI2  = VPI plus one unsaturated structured complement
```

Their exact GF lincats may use agreement-indexed tables or richer records. Plain `{s : Str}` is not an acceptable final contract unless the complete Albanian grammar demonstrably needs no later distinction—which is incompatible with the known agreement and clitic requirements.

---

## 8. Nominal morphology target

The large existing noun morphology is retained as a major asset, but mature status requires that it behave as a coherent system rather than a large collection of compiler-valid classes.

### 8.1 Required noun behavior

The morphology must generate and distinguish all productive combinations represented by the language profile:

```text
Indefinite / Definite
×
Nominative / Accusative / Dative / Ablative
×
Singular / Plural
```

If a syntactic genitive function is realized through an oblique form plus Albanian linking/article material, that must be represented compositionally. A new fifth morphological case must not be invented merely to imitate another language.

### 8.2 Paradigm-class quality

Every productive `mkN...` family must have:

- a documented input domain;
- a correct principal-form interpretation;
- deterministic dispatch;
- boundary tests where suffix-based smart classification can choose between classes;
- explicit handling of exceptions;
- no silent fallback to a class known to generate incompatible inflection.

### 8.3 Smart constructors

`mkN` must select a productive paradigm only when the citation form gives enough evidence. Where two lexemes with the same ending inflect differently, the public API must provide an explicit constructor or additional principal part rather than guess.

### 8.4 Nominal syntax integration

Case is selected by the syntactic governor. Definiteness and number are selected by NP/determiner construction. Modifiers preserve the noun table. No construction should hand-build a declined noun string when an existing noun object can express it.

---

## 9. Adjective morphology and agreement target

Albanian adjective realization must be driven by the agreement information of its syntactic host.

The mature implementation must correctly handle:

- masculine/feminine where active;
- singular/plural;
- case distinctions represented by the morphology;
- attributive versus predicative context when realization differs;
- Albanian linking-article behavior;
- positive, comparative and superlative constructions required by the RGL;
- complements of `A2`;
- adjective coordination without destroying agreement tables.

The current `link_clitic` resource may remain or be replaced, but final behavior must be grammatical and context-sensitive. A Boolean field is acceptable only if it genuinely captures the complete productive distinction; otherwise the linker state must become richer.

No final predicative constructor may hard-code `Masc Sg Nom` when subject agreement is available.

---

## 10. Pronouns, weak forms and pro-drop target

Albanian pronominal syntax is part of the core architecture, not an optional extension.

### 10.1 Full forms

The grammar must provide the case forms required for personal, interrogative and relative pronouns.

### 10.2 Object clitics

Accusative and dative weak forms must survive conversion to NP and be available to verbal argument insertion.

### 10.3 Reflexive

Reflexive realization must be represented as a grammatical argument/clitic state, not by prefixing a constant `u` to a finished VP. Its form and position must be selected with the same clitic-placement service used for other weak forms.

### 10.4 Clitic clusters

Where multiple clitics can co-occur, the final grammar has one typed cluster representation and one ordering/flattening operation. It must account for the Albanian combinations actually licensed by the language.

### 10.5 Position by clause type

Clitic placement must be able to vary with the grammatical contexts for which Albanian evidence requires variation, including finite clauses, embedded/subjunctive-like clauses and imperatives.

### 10.6 Pro-drop

Dropping an overt subject must not drop the subject's agreement. The clause remains fully inflected. Overt pronouns remain available for emphasis, contrast and contexts in which Albanian requires or prefers them.

---

## 11. Complement and government target

The completed grammar treats government as lexical/syntactic metadata.

### 11.1 Prepositions

Every structural and lexical preposition records the case it governs. `PrepNP`-like operations obtain the NP form from that case.

### 11.2 Verbal complements

`V2`, `V3`, `V2A`, `V2S`, `V2Q`, `V2V`, `N2`, `N3`, and `A2` retain the relevant `Compl` values. Saturation consumes the complement in the correct slot.

### 11.3 Zero complements

A direct object without an overt preposition still has typed government. `noPrep` may be surface-empty while carrying case information.

### 11.4 Slash preservation

Slash constructors preserve the missing argument's government until the gap is filled, questioned, relativized, reflexivized, or realized as a clitic.

---

## 12. Verbal morphology target

The final `Verb` resource exposes every lexical form needed by mature syntax, while compound clause-level constructions remain compositionally built where appropriate.

### 12.1 Lexical finite inventory

The lexical/morphological layer must supply the simple forms required for the supported Albanian system, including the existing indicative, imperative, optative and admirative forms and the embedded/subjunctive forms required by actual syntax. Subjunctive is an explicit morphology dimension: syntax must not derive it by inspecting an indicative `Str`.

The final resource must clearly distinguish:

```text
indicative forms
subjunctive/embedded finite forms
imperative forms
optative forms
admirative forms
participle(s)
other productive side forms required by clause construction
```

### 12.2 Simple versus compound tense

Not every Albanian tense needs to be stored as an independent lexical table. The correct split is:

- morphology owns lexical verb forms and irregular principal parts;
- the clause/verbal-complex layer owns productive auxiliary + participle constructions;
- `TenseSqi` maps common RGL tense/anteriority values to the appropriate Albanian realization;
- Albanian-specific tense distinctions not expressible in the common abstract API may be exposed through `ExtraSqi`.

### 12.3 No generic 3sg predicate form

A helper equivalent to the current:

```gf
v.Indicative ! Pres ! Sg ! P3
```

may exist only as a diagnostic/display helper. It cannot be the semantic representation of `UseV`, `ComplVV`, `SlashV2a`, or ordinary clause syntax.

### 12.3.1 No late mood inference from surface strings

The same rule applies to other persons and moods. Code equivalent to:

```gf
case <v.Indicative ! Pres ! Sg ! P1 : Str> of { ... }
```

must not be used in PMCFG-facing syntax to infer a subjunctive, imperative, or other grammatical form. If a grammatical distinction is productive and required by syntax, the morphology/paradigm layer supplies it as a typed table or equivalent structured field.

A compatibility helper may select an already-built table; it may not reconstruct morphology from a realized string.

### 12.4 Irregular forms

Irregular verbs use explicit paradigms or principal-part constructors. High-frequency irregularity must not be hidden inside ad hoc syntax constructors.

---

## 13. Tense, anteriority, mood and polarity target

The mature architecture separates the common RGL semantic dimensions from Albanian morphological form selection.

### 13.1 Common RGL tense layer

`Temp`, `Tense`, `Ant` and `Pol` continue to implement the exact pinned abstract API.

`UseCl`, `UseQCl`, `UseRCl` and `UseSlash` must actually consume the tense/anteriority/polarity values they receive.

### 13.2 Albanian tense mapping

Every common RGL tense/anteriority combination supported by Albanian must have one documented default realization. Where Albanian offers several semantically different past forms, the common RGL mapping chooses and documents one neutral/default mapping while `ExtraSqi` may expose additional distinctions such as simple past/aorist or imperfect when necessary.

### 13.3 Polarity

Positive and negative clauses must be generated by the clause system. Negation is not an adverb manually prepended after clause realization.

The implementation must distinguish ordinary finite negation from negative imperative or embedded constructions wherever Albanian requires different negative particles or placement.

### 13.4 Mood

Mood is represented where it changes verbal morphology or clause realization. Albanian subjunctive-like embedded constructions, imperative, optative and admirative behavior must not be simulated by reusing an indicative 3sg string.

### 13.5 Parameter provenance

Internal tense/mood parameters must use names or qualification that prevent confusion with `ParamX` constructors. The FIX21 provenance failure establishes this as a permanent engineering invariant.

---

## 14. Final VP and clause realization architecture

The target implementation has one coherent verbal-realization kernel shared by core syntax and the VPS/VPI extension family.

### 14.1 VP semantic structure

A VP contains a deferred predicate, not a chosen surface verb form. At realization time it can be supplied with the subject agreement and clause context.

A valid implementation may differ internally, but conceptually it must support:

```text
VP
├── verbal head / verbal realization function
├── complement material
├── adverbial material
├── clitic cluster state
├── voice/reflexive state
├── embedded/extraposed material where needed
└── metadata required by VV/control constructions
```

For the current GF 3.12 Albanian implementation, the validated design target is more specific: the lexical-to-VP boundary copies the **structured verb-form inventory needed downstream** (indicative, subjunctive, imperative, participle, optative, admirative) instead of forcing later consumers to project through a nested lexical `Verb` record. This is allowed because the distinctions remain structured; it is not equivalent to reducing VP to one `Str`.

The current representation decision is evidence-driven by run `20260921_201720`, whose PMCFG trace descends through `VP.v.Indicative`. If a future supported GF backend handles an equivalent nested representation safely, the internal storage may change, but the no-late-string-inference invariant remains.

### 14.2 Clause semantic structure

`PredVP` combines subject information with VP information while leaving the common RGL finite dimensions unresolved.

The final clause realization service is responsible for:

```text
subject realization or pro-drop
agreement selection
tense/anteriority mapping
mood selection
polarity
clitic flattening
verbal-complex assembly
complement ordering
clause-mode ordering
final surface concatenation
```

### 14.3 Surface boundary

A clause may become a final string only after no downstream RGL function needs to alter the above dimensions.

### 14.4 Shared use by other modules

`QuestionSqi`, `RelativeSqi`, `ConstructionSqi`, `ExtendSqi`, passive functions and existential functions must call or wrap this architecture rather than build unrelated verbal strings.

---

## 15. Core `VerbSqi` target

Every standard abstract constructor in `Verb` must preserve the rich VP contract.

### 15.1 Basic verbs and copula

`UseV` creates an agreement/context-sensitive VP.

`UseCopula` and `UseComp` use the same agreement and tense system as ordinary predicates. The copula is not permanently fixed to `është`.

### 15.2 Predicative complements

`CompNP`, `CompAP`, `CompCN`, and `CompAdv` produce complement objects that can be realized with the subject agreement where required.

### 15.3 VP modification

`AdvVP`, `ExtAdvVP`, `AdVVP`, `AdvVPSlash`, and `AdVVPSlash` preserve all VP fields and change only the appropriate modifier slot/order.

### 15.4 Object saturation

`ComplSlash` chooses the governed NP form or weak/clitic form based on typed argument information and Albanian syntax.

### 15.5 Reflexive and passive

`ReflVP` and `PassV2` change structured voice/clitic state and preserve tense/agreement possibilities.

### 15.6 Clause complements

`ComplVS`, `ComplVQ`, `ComplVA`, `ComplVV` and the `SlashV2*` family select the proper Albanian embedding strategy without forcing the embedded predicate to a preselected present 3sg form.

### 15.7 Ditransitives

`Slash2V3`, `Slash3V3` and related constructors preserve which argument remains open, its government, and the correct realization of the saturated argument.

---

## 16. `SentenceSqi` target

`SentenceSqi` is the ordinary clause-construction front end over the shared realization kernel.

The final behavior includes:

- `PredVP`: subject agreement correctly controls the predicate;
- `PredSCVP`: embedded subject/clausal material combines without losing VP context;
- `UseCl`: consumes `Temp` and `Pol` and returns a realized sentence;
- `UseQCl`: same for questions;
- `UseRCl`: same for relatives while respecting antecedent-dependent material;
- `UseSlash`: same for clauses with an open complement;
- `ImpVP`: selects genuine imperative realization rather than returning the ordinary VP string;
- `SlashVP`: keeps subject agreement and complement gap structure;
- `SlashPrep`: changes/openly records the missing complement government;
- `AdvS`, `ExtAdvS`, `AdvSlash`: attach material to semantically appropriate slots;
- `SSubjS`: constructs a subordinate relation rather than concatenating two finished sentences with no clause-mode effect when such an effect is required.

---

## 17. Questions target

The final `QuestionSqi` supports the complete abstract question family using Albanian clause behavior.

### 17.1 Polar questions

`QuestCl` derives a question from the same clause representation used by declaratives. If Standard Albanian permits declarative word order with question prosody/particles, that is encoded as the Albanian question mode rather than treated as evidence that `QCl` can be a raw `Cl` string.

### 17.2 Wh questions

`QuestVP`, `QuestSlash`, `QuestIAdv`, `QuestIComp`, `QuestQVP`, `ComplSlashIP` and related functions must select correct interrogative case and gap structure.

### 17.3 Interrogative determiners and quantifiers

`IDet`, `IQuant`, `IP` and related categories remain rich enough to express case and agreement distinctions. `IdetCN` must not permanently choose `Indef/Nom/Sg` if the resulting phrase is later used in another grammatical role.

### 17.4 Embedded questions

`EmbedQS` and question complements preserve the correct subordinate realization and do not depend on string surgery.

---

## 18. Relative-clause target

The current relative module's placeholder-like behavior is not part of the final design.

The mature implementation must generate:

- subject relatives;
- object/slash relatives;
- prepositional/oblique relatives supported by the abstract API;
- agreement-sensitive relative structures when Albanian requires them;
- tense/anteriority/polarity inside the relative clause;
- a correct Albanian relative marker/pronoun strategy.

`RelCl`, `RelVP`, and `RelSlash` must consume their clause or VP arguments. They may not reduce all relatives to a fixed `që` string plus an RP tail.

---

## 19. Coordination target

Coordination is structurally distributed over the unresolved dimensions of the coordinated category.

### 19.1 NP coordination

The final grammar computes coordinated agreement. It must not simply copy the first conjunct's `Agr`.

### 19.2 AP/CN coordination

Agreement/case/definiteness tables are coordinated pointwise so later consumers can still select them.

### 19.3 Sentence and relative coordination

Any clause dimension that remains unresolved at the list stage remains distributed across all conjuncts.

### 19.4 Correlative conjunctions

`DConj`/correlative behavior must match the exact pinned abstract interface. Obsolete local category artifacts are removed or adapted rather than preserved for historical reasons.

---

## 20. Embedded verbal syntax and `VV` target

Standard Albanian embedded verbal syntax is a first-class capability.

### 20.1 Embedded form inventory

The grammar must explicitly represent the form used after predicates such as wanting, ability, obligation, beginning and similar `VV` items. It must not assume that an English-style infinitive exists.

### 20.2 `VV` lexical metadata

If all relevant `VV` verbs select the same Albanian embedded construction, `VV` need not carry unnecessary semantic subclasses.

If lexical classes select materially different complement forms or algorithms, the distinction becomes typed metadata in `VV` and is consumed once at `ComplVV` / `ComplVPIVV`.

### 20.3 Control

Subject-control, object-control or impersonal behavior is represented explicitly where productive. `V2V` must retain object-control metadata if its Albanian members require it.

### 20.4 Agreement

Embedded predicates retain the person/number information required by Albanian. A `VPI` cannot be a fixed third-person form.

### 20.5 Polarity and anteriority

The embedded architecture supports the polarity/anteriority distinctions exposed by the abstract function being implemented. These distinctions are not discarded merely because the current placeholder compiles without them.

---

## 21. VPS/VPI family final contract

The complete extension family includes all of the following as real Albanian implementations:

```text
MkVPS
BaseVPS
ConsVPS
ConjVPS
PredVPS
QuestVPS
SQuestVPS
RelVPS

MkVPI
BaseVPI
ConsVPI
ConjVPI
ComplVPIVV

MkVPS2
BaseVPS2
ConsVPS2
ConjVPS2
ComplVPS2
ReflVPS2

MkVPI2
BaseVPI2
ConsVPI2
ConjVPI2
ComplVPI2
```

### 21.1 `VPS`

`MkVPS` fixes the tense/anteriority/polarity dimensions that belong to the function's input while retaining the agreement dimension needed by `PredVPS` and related consumers.

`PredVPS` realizes the finite predicate using the actual subject agreement.

`QuestVPS`, `SQuestVPS`, and `RelVPS` reuse the same finite verbal realization rather than recreating tense or negation independently.

### 21.2 `VPI`

`MkVPI` converts a VP into the standard Albanian embedded predicate representation. Its realization must be based on Albanian mood/particle/morphology evidence and must preserve agreement when required.

`ComplVPIVV` combines this form with a `VV` using the same lexical complement/control policy as core verbal syntax.

### 21.3 Lists and coordination

`Base*`, `Cons*`, and `Conj*` retain every still-open dimension. List storage of one already-realized string per member is insufficient when agreement remains unresolved.

### 21.4 `VPS2` / `VPI2`

The unsaturated families carry their open complement structurally. `ComplVPS2` and `ComplVPI2` can therefore choose full NP versus clitic realization, governed case and context-dependent placement.

`ReflVPS2` applies reflexive saturation through the same clitic system.

### 21.5 Ownership

If the family is locally owned, `ExtendSqiVPS.gf` owns the extension-level family. General Albanian VP/clause realization remains in core resources/syntax and is not duplicated there.

---

## 22. Passive, non-active and reflexive target

The mature grammar distinguishes the grammatical operations involved rather than treating them all as insertion of `u`.

The final system must support the passive/non-active behavior required by:

```text
PassV2
PassVPSlash
PassAgentVPSlash
PastPartAP
PastPartAgentAP
ReflVP
ReflVPS2
```

It must determine from Albanian evidence:

- when non-active morphology is lexical/synthetic;
- when a participial/copular construction is used;
- how agents are introduced;
- how tense/mood interacts with voice;
- how reflexive clitics interact with object clitics.

All such operations preserve the shared verbal realization contract.

---

## 23. Existential target

The `ExtendSqiExistential` family must produce genuine Albanian existential clauses and questions through the normal clause architecture.

It includes at least:

```text
ExistS
ExistNPQS
ExistIPQS
ExistCN
ExistMassCN
ExistPluralCN
ExistsNP
```

Existentials must have reviewed behavior for tense, polarity, number and interrogative use. Fixed surface strings that ignore `Temp`, `Pol` or NP agreement are not final.

---

## 24. Subordination and embedding target

Subordinate syntax must preserve clause mode and embedding requirements.

The mature grammar covers:

- declarative sentential complements;
- question complements;
- relative clauses;
- adverbial subordination;
- purpose/without/by/in-order-to constructions in `Extend`;
- direct and bare speech/complement variants required by the API;
- clause-level conjunction and subordination.

Functions such as `PurposeVP`, `WithoutVP`, and `InOrderToVP` cannot ultimately be defined as a fixed particle plus `vp.s` if the embedded VP requires a different mood or clitic order. They must request the appropriate embedded realization from the VP architecture.

---

## 25. Imperative target

Imperatives use the dedicated Albanian imperative morphology and clause rules.

The final implementation must handle:

- singular/plural forms exposed by the morphology;
- positive imperatives;
- negative imperatives;
- object and reflexive clitics;
- adverbial modification;
- coordinated imperatives if exposed by the API;
- polite/alternative imperative strategy where part of the public Albanian design.

`ImpVP vp = vp.s` is not an acceptable final implementation.

---

## 26. Adverb and modifier target

Adverbs remain shallow where they are genuinely invariant strings, but attachment is structural.

The completed grammar supports:

- VP adverbs;
- sentence adverbs;
- adjective-modifying adverbs;
- numeral/cardinal modifiers where required;
- comparative adverbs;
- interrogative adverbs;
- locative, temporal and manner structural adverbs;
- modifier scope/order distinctions that materially affect Albanian realization.

`ExtAdv*` and ordinary `Adv*` operations may use different slots if punctuation or scope differs.

---

## 27. Numeral target

`NumeralSqi` must produce the full common RGL numeral surface supported by the abstract API, including digits and decimal forms, while preserving number/agreement information required downstream.

Nominal syntax must handle numeral-driven number or noun-form behavior as Albanian requires. Any special count/measure noun form discovered by evidence becomes an explicit morphological or governance distinction rather than a string exception in `ConstructionSqi`.

Dates, times and quantities in `ConstructionSqi` must reuse these numeral and nominal resources.

---

## 28. Structural vocabulary target

`StructuralSqi` is complete only when every required structural item has a real Albanian implementation with correct grammatical metadata.

### 28.1 Nominal structural vocabulary

This includes:

- personal pronouns;
- polite pronouns;
- quantifiers;
- determiners;
- interrogatives;
- indefinite/negative NPs;
- predeterminers.

Pronouns must carry real case and clitic information.

### 28.2 Clause structural vocabulary

This includes:

- prepositions with government;
- subordinators;
- conjunctions and correlatives;
- interrogative and ordinary adverbs;
- discourse/utterance constants.

### 28.3 Verbal structural vocabulary

`can_VV`, `can8know_VV`, `want_VV`, `must_VV`, `have_V2`, and other standard structural verbs must be enabled and use the same verbal architecture as ordinary lexicon entries.

`must_VV` is not allowed to remain commented out in the final target.

### 28.4 No structural exception bucket

`StructuralSqi.gf` remains an aggregator. Morphological or syntactic complexity belongs to its nominal/verbal/clause subresources or shared core resources.

---

## 29. Standard lexicon target

`LexiconSqi` must provide complete, morphologically correct implementations of the standard RGL lexicon for Albanian.

Each lexical entry must specify:

```text
correct citation/principal form
correct paradigm class
correct gender where nominal
correct complement government and valency
correct VV/control/embedding class where relevant
irregular constructor where productive rules do not apply
```

The lexicon must not compensate for missing syntax by embedding words such as complementizers, pronouns, negation or inflected auxiliaries into lexical surface strings unless they are genuinely lexicalized parts of the item.

Smart-paradigm dispatch errors such as the historical `bëj` and `dashuri` misclassification are treated as regression-critical.

---

## 30. `ConstructionSqi` final target

`ConstructionSqi` must be a library of Albanian realizations built on the mature core grammar, not a set of English-shaped functions translated into fixed strings.

### 30.1 Grammatical constructions

Functions that return `VP`, `Cl`, `QCl`, `NP`, `CN`, `AP` or `Adv` must return categories with their full final contract.

Examples such as:

```text
have_name_Cl
what_name_QCl
how_old_QCl
where_go_QCl
go_here_VP
married_Cl
hungry_VP
weather_adjCl
```

must therefore preserve agreement, tense, polarity and case exactly as equivalent core-built expressions would.

### 30.2 Lexical constants

Months, weekdays, language names and numeric hour constants may remain lexical constants where their grammatical category is genuinely invariant. Once used as nouns, NPs or adverbials, they must pass through ordinary Albanian morphology/syntax rather than manual concatenation.

### 30.3 Date/time system

Date, time and unit expressions must have reviewed Albanian formatting, case, preposition and agreement behavior. The module should reuse numeral and noun paradigms rather than duplicate inflection.

### 30.4 Quality criterion

A `ConstructionSqi` expression inserted into a larger sentence must respond normally to surrounding grammar. A fixed `shkon` or `është` that cannot agree with another subject is evidence of incompleteness.

---

## 31. `ExtendSqi` total target

`ExtendSqi` remains a thin coordinator over coherent Albanian subsystems.

The mature extension layer has no arbitrary accumulation of one-off linearizations. Each function is either inherited because the inherited implementation is fully compatible with Albanian category contracts, or locally owned because Albanian requires a distinct realization.

### 31.1 Scaffolding family

The scaffolding module owns only generic extension bridges/list families whose behavior is truly shallow after rich category information has already been preserved elsewhere.

No scaffolding helper may discard a grammatical dimension simply to fit a local `{s : Str}` boundary.

### 31.2 Existential family

Owned by `ExtendSqiExistential.gf` and integrated with the clause kernel.

### 31.3 AP/CN family

Owned by `ExtendSqiAPCN.gf`. Conversions preserve nominal/adjectival agreement information and never fabricate a constant table when the source contains richer forms.

### 31.4 Focus/preposition family

Owned by `ExtendSqiFocusPrep.gf`. Focus constructions preserve clause structure and complement government.

### 31.5 VP bridge family

Owned by `ExtendSqiVPBridge.gf`. Participles, purpose clauses, nominalization and passive bridges call the mature VP/embedded realization service.

### 31.6 RNP family

Owned by `ExtendSqiRNP.gf`. Reflexive noun-phrase behavior shares the same pronoun/clitic and agreement infrastructure as core syntax.

### 31.7 Lexical tail

Owned by `ExtendSqiLexicon.gf`; contains genuinely lexical extension items and no clause assembly.

### 31.8 VPS/VPI family

Owned coherently, preferably by `ExtendSqiVPS.gf` if local ownership is required. The complete family is governed by Section 21.

### 31.9 Inheritance policy

Inheritance is an implementation reuse mechanism, not a completeness claim. Every inherited `Extend` function must be checked against current Albanian category shapes and behavioral tests. Inherited `(0,0)` or `variants {}` output is classified as missing coverage unless the abstract function is intentionally unsupported.

---

## 32. `IrregSqi` final target

`IrregSqi` becomes the explicit owner of lexical irregularity that cannot be expressed safely through productive smart paradigms.

It must include or expose constructors/entries for the high-frequency Albanian irregular verbs and other lexical items whose principal parts are necessary for correct generation.

The module must not become a place to repair syntax. Its responsibilities are:

```text
irregular stems/principal parts
irregular finite forms
irregular participles or side forms
explicit lexical classification needed by paradigms
```

The public exposure of `IrregSqi` through `AllSqi` must follow the canonical mechanism supported by the pinned RGL version. If that version requires a language-specific irregular abstract module, create it; if it exposes irregulars as resources, preserve that convention. The target capability is mandatory even if the exact composition syntax differs.

---

## 33. `ExtraSqi` final target

`ExtraSqi` contains Albanian-specific grammatical capabilities that do not belong to the common RGL abstract API.

Good candidates include genuinely Albanian distinctions such as additional tense/mood choices, focus constructions, language-specific case/genitive mechanisms, or other productive structures supported by evidence.

`ExtraSqi` must not duplicate functions that belong in core RGL modules merely to avoid repairing their architecture.

Every `ExtraSqi` function is documented with its linguistic semantics and covered by Wordbench if it is part of the released public surface.

---

## 34. Documentation and morphology display target

`DocumentationSqi` must remain synchronized with the real category contracts.

When verbal morphology gains subjunctive/embedded forms or other productive forms, the generated documentation view must expose them appropriately. It must not continue to display an obsolete subset of the verb record.

Noun and adjective displays must reflect the exact productive case/number/definiteness/agreement inventory.

Documentation output is not itself linguistic validation, but it is a useful audit of paradigm completeness.

---

## 35. Markup and orthography target

Where the pinned RGL exposes `Markup`, Albanian should provide a canonical `MarkupSqi` comparable to mature languages.

Orthographic behavior must be centralized where tokenization or punctuation rules matter. Manual insertion of spaces through scattered helpers is acceptable only for trivial GF token separation, not as a substitute for language-specific tokenization logic.

The final public lexer/unlexer settings must be documented and stable.

---

## 36. Names target

`NamesSqi` is a useful test/resource layer but its proper names must use the same final `PN`/NP agreement and case system as the rest of the grammar.

Names used in tests should deliberately include:

- masculine and feminine human names;
- Albanian and foreign place names;
- names with and without visible inflectional alternation;
- names after governed prepositions.

This prevents `UsePN = masculine singular invariant` from surviving unnoticed.

---

## 37. `GrammarSqi`, `LangSqi`, `AllSqi` and public API target

### 37.1 `GrammarSqi`

`GrammarSqi` remains the composition of the core grammatical modules and contains no patch logic.

### 37.2 `LangSqi`

The final public `LangSqi` is comparable to mature RGL language compositions. Subject to the exact pinned `Lang` abstract contract, it exposes:

```text
GrammarSqi
LexiconSqi
ConstructionSqi
DocumentationSqi
MarkupSqi when supported
```

The current `GrammarSqi, LexiconSqi` composition is therefore not the final maturity target.

### 37.3 `AllSqi`

The final all-language entry point exposes all intended public Albanian surfaces supported by the pinned RGL architecture, including at least `LangSqi` and `ExtendSqi`, and the canonical irregular/extra surface where that RGL version composes them.

`AllSqiAbs` must match that public surface; it must not remain `Lang ** {}` if `AllSqi` is intended to claim complete `Extend` coverage.

### 37.4 `SyntaxSqi`, `ConstructorsSqi`, `SymbolicSqi`, `TrySqi`

These API wrappers must compile and expose the mature Albanian grammar without bypassing its rich categories. They are part of the release surface and participate in clean-build regression.

---

## 38. Parse and generation contract

A mature RGL must be useful in both generation and parsing contexts supported by GF.

### 38.1 Generation

For accepted trees, generation must produce grammatically reviewed Albanian outputs and must not rely on accidental ambiguity to obtain the desired string.

### 38.2 Parsing

Representative golden sentences must parse back to an expected tree or an explicitly accepted ambiguity set where the grammar is intended to support parsing.

### 38.3 Round-trip evidence

For high-value core constructions, Wordbench should include controlled generate→parse or parse→generate checks when stable enough to be meaningful.

### 38.4 Ambiguity policy

Known linguistic ambiguity is documented. Unbounded ambiguity caused by over-permissive placeholder categories is a defect.

---

## 39. Wordbench final validation contract

Wordbench is the canonical validation harness for the released Albanian RGL.

Direct GF probes remain debugging tools only.

The final regression corpus must cover the following behavior families.

### 39.1 Morphology

```text
noun classes and dispatch boundaries
all represented noun cases
singular/plural
definite/indefinite
adjective gender/number/case agreement
linking-article behavior
regular and irregular verbs
all supported finite moods/forms
participles
imperatives
smart-paradigm positive and boundary cases
```

### 39.2 Nominal syntax

```text
DetCN
UsePN
UsePron
PredetNP
adjectival modification
possessive/genitive constructions
prepositional government
NP coordination and agreement
```

### 39.3 Core verbal syntax

```text
subject agreement for all persons/numbers
present/past/future/conditional mappings
anteriority
positive/negative polarity
transitives and ditransitives
VS/VQ/VA/VV complements
V2S/V2Q/V2A/V2V complements
adverb placement
pro-drop
```

### 39.4 Clause types

```text
declaratives
polar questions
wh questions
embedded questions
subject/object/oblique relatives
subordinate clauses
imperatives
coordination
```

### 39.5 Albanian-specific verbal behavior

```text
subjunctive/embedded constructions
VV complement classes
clitic accusative
dative clitic
clitic clusters
reflexive clitic
finite vs embedded clitic placement
negative imperative behavior
passive/non-active
existentials
```

### 39.6 VPS/VPI extension family

```text
MkVPS / PredVPS agreement
Temp / Ant / Pol realization
VPS coordination
VPS questions and relatives
MkVPI embedded realization
ComplVPIVV control/embedding
VPS2 full-NP saturation
VPI2 full-NP saturation
VPS2/VPI2 clitic saturation
ReflVPS2
```

### 39.7 Construction and structural layers

```text
age/name/distance constructions
deictic motion
weather/stative predicates
dates and times
structural pronouns/determiners/prepositions
can/want/must/have and other structural verbs
correlative conjunctions
```

### 39.8 Public integration

```text
GrammarSqi
LexiconSqi
ConstructionSqi
DocumentationSqi
ExtendSqi
LangSqi
AllSqi
SyntaxSqi
ConstructorsSqi
TrySqi
```

Every accepted golden must have been reviewed as Albanian output. A zero-scenario quick run proves compilation only.

---

## 40. Golden-output policy

A `.gold` file means:

> this output has been reviewed and is intentionally protected as accepted behavior.

It does not mean:

> the compiler happened to print this once.

Goldens therefore obey these final rules:

- no automatic mass acceptance of changed output;
- every changed golden has a documented reason;
- model-language output is never an Albanian golden;
- variants are recorded only when each variant is linguistically accepted;
- unsupported or provisional output does not become a release golden;
- morphology and syntax goldens are both required.

---

## 41. Coverage and status model

Every public function/family in the completed repository can be classified mechanically.

Recommended states are:

```text
MISSING
SCAFFOLDED
COMPILER_VALIDATED
BEHAVIOR_VALIDATED
GOLDEN_VALIDATED
RELEASE_READY
```

For final release, all required common-RGL functions must be `RELEASE_READY` or explicitly documented as unsupported by the Albanian language/RGL contract. No required function may remain silently `SCAFFOLDED`.

A generated function-coverage report should be derivable from the exact source revision and tests.

---

## 42. Compiler and PMCFG contract

The PMCFG crash fixed before `v0.1.0` remains a permanent regression boundary.

The completed RGL must satisfy:

```text
no GeneratePMCFG crash
no PMCFG-facing mood reconstruction by `case` over realized verb strings
no known nested-record projection that reproduces the GF 3.12 backend crash
all public entry points produce their expected .gfo artifacts
no parameter/table-key provenance mismatch
no unexplained lock/retyping failure
no stale .gfo accepted as evidence of a successful build
```

Compile warnings are captured and classified. An accepted warning has a documented reason; an unexplained warning is not treated as harmless simply because the build exits successfully.

---

## 43. Performance and representation-size contract

Rich categories are justified by downstream consumers, not by theoretical completeness.

The final grammar must avoid both:

```text
premature flattening
```

and:

```text
unbounded Cartesian table growth with no consumer
```

When a representation materially increases GF compilation or PMCFG complexity, it must be benchmarked against the required behavior. Equivalent smaller representations are preferred when they preserve all tested distinctions.

This is especially important for VP, clause, list and extension categories.

---

## 44. Prohibited final-state shortcuts

The following patterns may appear temporarily during debugging but are incompatible with the finished RGL unless explicitly justified as linguistically correct constants:

```text
VP = {s : Str} when agreement/tense/clitic decisions remain
VPSlash = {s : Str} with a forgotten complement
Cl = {s : Str} before UseCl consumes Temp/Pol
UseCl _ _ cl = {s = cl.s}
UseV selecting present 3sg permanently
ComplVV concatenating two pre-realized predicate strings
RelCl _ = {s = "që"}
RelVP rp _ = ... with the VP ignored
question constructors that permanently select Nom/Sg fallback forms
UsePN forcing Masc Sg
coordination copying the first conjunct's agreement
PassV2 implemented as an unconditional string prefix plus participle
reflexive implemented as unconditional "u" + finished VP
Construction VP/QCl values containing fixed 3sg verbs
hard-coded case forms where a governor object exists
surface-string inspection to recover case, pronounhood, polarity or clitic role
variants {} used as a final implementation
(0,0) treated as acceptable coverage without an explicit unsupported decision
```

This list is illustrative, not exhaustive. The governing test is whether required grammatical information has been lost before its final consumer.

---

## 45. AI implementation contract

An AI coding against this specification must treat the repository as an RGL implementation, not as a text-generation template.

### 45.1 Before changing a category

The AI must identify:

```text
exact abstract signatures
current lincat/resource type
all direct producers
all direct consumers
final realization boundary
existing tests
Albanian evidence for every new distinction
```

### 45.2 Before adding a field

The AI must name at least one producer and one downstream consumer. Fields with no consumer are rejected.

### 45.3 Before deleting or flattening a field

The AI must inspect every consumer and show that no later decision uses it.

### 45.4 Before copying a model language

The AI must state the exact shared representation problem and the differences that prevent literal copying.

### 45.5 When linguistic evidence is missing

The AI records an open question and may create scaffolding that is explicitly provisional. It must not silently choose a Bulgarian, Romanian, Greek, German or English rule as Albanian truth.

### 45.6 When the current core blocks a higher capability

The AI repairs the first information-loss boundary, even when it lies in the frozen baseline, provided the change is minimal, justified by behavior, and preserves the compiler regression baseline.

### 45.7 When a function can reuse core syntax

Reuse is preferred. `Construction` and `Extend` should call mature core constructors/resources instead of duplicating clause strings.

### 45.8 Definition of a completed function

A function is complete only when:

```text
type/shape is correct
ownership is correct
it compiles
its behavior is linguistically reviewed
its important interactions are tested
its status/docs are synchronized
```

---

## 46. Current baseline deviations from the final target

This section is descriptive. It identifies known differences between `v0.1.0`-era code and the final system; it is not an implementation order.

| Area | Baseline behavior | Final target |
|---|---|---|
| `VP` | primarily `{s : Str}` | deferred agreement/context-sensitive verbal structure |
| `UseV` | present indicative 3sg | unresolved predicate realization |
| `Cl` | `{s : Str}` | tense/anteriority/polarity-aware clause |
| `UseCl` | ignores `Temp`/`Pol` | consumes them |
| `VPSlash` | `{s : Str}` | VP + structured open complement |
| `Prep/Compl` | primarily surface string | governed complement object |
| `NP` | case + agreement | case + agreement + required pronominal/clitic/pro-drop metadata |
| `Pron -> NP` | weak forms can be lost | weak forms remain available |
| `PN` | invariant string; `UsePN` forces Masc Sg | case/agreement-aware proper names |
| copula | fixed `është` in several paths | ordinary inflecting predicate |
| `ComplVV` | concatenates pre-realized strings | typed embedded/control composition |
| `ImpVP` | ordinary VP string | dedicated imperative realization |
| questions | many string/fallback constructions | clause-derived, case-aware question system |
| relatives | several arguments ignored | full gap/antecedent/clause realization |
| coordination | NP agreement can copy one conjunct | computed Albanian coordination agreement |
| passive/reflexive | shallow `u`/participle concatenation | voice/clitic-aware realization |
| VPS/VPI | inherited/shallow boundaries | complete coherent family |
| `ConstructionSqi` | several fixed/string-based grammatical realizations | composition through mature core syntax |
| `must_VV` | disabled | implemented and validated |
| `IrregSqi` | essentially empty | explicit irregular paradigm owner |
| `LangSqi` | `Grammar + Lexicon` | mature public composition incl. Construction/Documentation/Markup where supported |
| `AllSqi` | essentially `LangSqi` | full intended public Albanian surface incl. Extend and canonical irregular/extra exposure |
| Wordbench | compiler quick runs may see 0 scenarios | comprehensive reviewed behavioral corpus |

The table is expected to shrink over time as code approaches this specification.

---

## 47. Final release acceptance definition

The project may call the Albanian RGL **mature / completion release** only when all of the following statements are true.

### 47.1 Architecture

All active grammatical dimensions have documented ownership and realization boundaries. No critical open question can force a redesign of a public core category.

### 47.2 Core syntax

Nominal, adjectival, verbal, sentence, question, relative, coordination, imperative and subordinate syntax use the final structured categories and pass reviewed tests.

### 47.3 Verbal system

Agreement, tense, anteriority, polarity, mood, embedded verbal syntax, complements, passive/reflexive behavior and clitics are generated through one coherent architecture.

### 47.4 Extension surface

Required `Extend` functions, including the complete VPS/VPI/VPS2/VPI2 family, are implemented or explicitly unsupported with documented justification. No required family remains a compiler placeholder.

### 47.5 Lexical surfaces

Structural vocabulary, standard lexicon and irregular paradigms use correct morphology and typed valency/government.

### 47.6 Construction surface

`ConstructionSqi` functions are compositional and inherit ordinary Albanian grammatical behavior.

### 47.7 Public composition

`LangSqi`, `AllSqi`, API wrappers and supported documentation/markup modules compile cleanly from a clean checkout.

### 47.8 Linguistic QA

The required Wordbench scenario corpus runs with reviewed goldens and no unexplained output change. Active morphology and syntax distinctions have positive coverage; architecture boundaries and smart-dispatch boundaries have negative/boundary coverage.

### 47.9 Compiler QA

The GF 3.12 PMCFG regression remains resolved, or a later explicitly supported GF version passes equivalent clean-build gates. Warnings are classified and no unexplained compiler failure remains.

### 47.10 Documentation

The implementation status, category contracts, ownership matrix, decision log, open questions and testing records agree with the released source.

---

## 48. Normative public RGL capability inventory

This inventory closes an important ambiguity for autonomous implementation. The architectural sections above define **how Albanian must realize grammar**; this section defines **which common abstract operations must be accounted for**.

The inventory is generated from the supplied AI Compendium `contracts/ABSTRACT_SIGNATURES.jsonl`. Its accompanying manifest identifies the reference RGL source as `gf-rgl` commit `62c5030be182fdb1289dd472a28027fc5718dcde`. The Compendium itself marks that source binding as source-grounded but not independently reconstructed from Git objects, so the local pinned `gf-rgl` checkout remains the final build authority. If the project intentionally changes the RGL revision, this inventory must be regenerated or reconciled before release.

For every signature below, final Albanian status must be explicit and evidence-backed. The expected state is `implemented-and-validated`; any `explicitly-unsupported` entry requires a linguistic/abstract-contract justification in the decision log and coverage ledger. Inherited behavior counts as implementation only when its category contracts are compatible with Albanian and Wordbench validates its behavior.

This list is a **coverage contract, not an implementation order**.

### 48.1 `Adjective` — 11 abstract operations

```text
AdAP : AdA -> AP -> AP
AdjOrd : Ord -> AP
AdvAP : AP -> Adv -> AP
CAdvAP : CAdv -> AP -> NP -> AP
ComparA : A -> NP -> AP
ComplA2 : A2 -> NP -> AP
PositA : A -> AP
ReflA2 : A2 -> AP
SentAP : AP -> SC -> AP
UseA2 : A2 -> AP
UseComparA : A -> AP
```

### 48.2 `Adverb` — 8 abstract operations

```text
AdAdv : AdA -> Adv -> Adv
AdnCAdv : CAdv -> AdN
ComparAdvAdj : CAdv -> A -> NP -> Adv
ComparAdvAdjS : CAdv -> A -> S -> Adv
PositAdAAdj : A -> AdA
PositAdvAdj : A -> Adv
PrepNP : Prep -> NP -> Adv
SubjS : Subj -> S -> Adv
```

### 48.3 `Conjunction` — 25 abstract operations

```text
BaseAdV : AdV -> AdV -> ListAdV
BaseAdv : Adv -> Adv -> ListAdv
BaseAP : AP -> AP -> ListAP
BaseCN : CN -> CN -> ListCN
BaseIAdv : IAdv -> IAdv -> ListIAdv
BaseNP : NP -> NP -> ListNP
BaseRS : RS -> RS -> ListRS
BaseS : S -> S -> ListS
ConjAdV : Conj -> ListAdV -> AdV
ConjAdv : Conj -> ListAdv -> Adv
ConjAP : Conj -> ListAP -> AP
ConjCN : Conj -> ListCN -> CN
ConjDet : Conj -> ListDAP -> Det
ConjIAdv : Conj -> ListIAdv -> IAdv
ConjNP : Conj -> ListNP -> NP
ConjRS : Conj -> ListRS -> RS
ConjS : Conj -> ListS -> S
ConsAdV : AdV -> ListAdV -> ListAdV
ConsAdv : Adv -> ListAdv -> ListAdv
ConsAP : AP -> ListAP -> ListAP
ConsCN : CN -> ListCN -> ListCN
ConsIAdv : IAdv -> ListIAdv -> ListIAdv
ConsNP : NP -> ListNP -> ListNP
ConsRS : RS -> ListRS -> ListRS
ConsS : S -> ListS -> ListS
```

### 48.4 `Construction` — 36 abstract operations

```text
dayMonthAdv : Monthday -> Month -> Adv
dayMonthYearAdv : Monthday -> Month -> Year -> Adv
has_age_VP : Card -> VP
have_name_Cl : NP -> NP -> Cl
how_far_QCl : NP -> QCl
how_old_QCl : NP -> QCl
hungry_VP : VP
ill_VP : VP
InLanguage : Language -> Adv
intMonthday : Int -> Monthday
intYear : Int -> Year
is_right_VP : VP
is_wrong_VP : VP
languageCN : Language -> CN
languageNP : Language -> NP
married_Cl : NP -> NP -> Cl
monthAdv : Month -> Adv
monthN : Month -> N
monthPN : Month -> PN
monthYearAdv : Month -> Year -> Adv
n_units_AP : Card -> CN -> A -> AP
n_units_of_NP : Card -> CN -> NP -> NP
ready_VP : VP
scared_VP : VP
thirsty_VP : VP
timeunitAdv : Card -> Timeunit -> Adv
tired_VP : VP
weather_adjCl : AP -> Cl
weekdayHabitualAdv : Weekday -> Adv
weekdayLastAdv : Weekday -> Adv
weekdayN : Weekday -> N
weekdayNextAdv : Weekday -> Adv
weekdayPN : Weekday -> PN
weekdayPunctualAdv : Weekday -> Adv
what_name_QCl : NP -> QCl
yearAdv : Year -> Adv
```

### 48.5 `Extend` — 92 abstract operations

```text
AdAdV : AdA -> AdV -> AdV
AdjAsCN : AP -> CN
AdjAsNP : AP -> NP
ApposNP : NP -> NP -> NP
Base_nr_RNP : NP -> RNP -> RNPList
Base_rn_RNP : RNP -> NP -> RNPList
Base_rr_RNP : RNP -> RNP -> RNPList
ByVP : VP -> Adv
CompBareCN : CN -> Comp
CompIQuant : IQuant -> IComp
ComplBareVS : VS -> S -> VP
ComplDirectVQ : VQ -> Utt -> VP
ComplDirectVS : VS -> Utt -> VP
ComplGenVV : VV -> Ant -> Pol -> VP -> VP
ComplVPI2 : VPI2 -> NP -> VPI
ComplVPIVV : VV -> VPI -> VP
ComplVPS2 : VPS2 -> NP -> VPS
CompoundAP : N -> A -> AP
CompoundN : N -> N -> N
CompQS : QS -> Comp
CompS : S -> Comp
CompVP : Ant -> Pol -> VP -> Comp
ConjRNP : Conj -> RNPList -> RNP
ConjVPI : Conj -> [VPI] -> VPI
ConjVPI2 : Conj -> [VPI2] -> VPI2
ConjVPS : Conj -> [VPS] -> VPS
ConjVPS2 : Conj -> [VPS2] -> VPS2
Cons_nr_RNP : NP -> RNPList -> RNPList
Cons_rn_RNP : RNP -> ListNP -> RNPList
Cons_rr_RNP : RNP -> RNPList -> RNPList
EmbedPresPart : VP -> SC
EmptyRelSlash : ClSlash -> RCl
ExistCN : CN -> Cl
ExistMassCN : CN -> Cl
ExistPluralCN : CN -> Cl
ExistsNP : NP -> Cl
FocusAdV : AdV -> S -> Utt
FocusAdv : Adv -> S -> Utt
FocusAP : AP -> NP -> Utt
FocusObj : NP -> SSlash -> Utt
FrontComplDirectVQ : NP -> VQ -> Utt -> Cl
FrontComplDirectVS : NP -> VS -> Utt -> Cl
GenIP : IP -> IQuant
GenModIP : Num -> IP -> CN -> IP
GenModNP : Num -> NP -> CN -> NP
GenNP : NP -> Quant
GenRP : Num -> CN -> RP
GerundAdv : VP -> Adv
GerundCN : VP -> CN
GerundNP : VP -> NP
IAdvAdv : Adv -> IAdv
ICompAP : AP -> IComp
iFem_Pron : Pron
InOrderToVP : VP -> Adv
MkVPI : VP -> VPI
MkVPI2 : VPSlash -> VPI2
MkVPS : Temp -> Pol -> VP -> VPS
MkVPS2 : Temp -> Pol -> VPSlash -> VPS2
PassAgentVPSlash : VPSlash -> NP -> VP
PassVPSlash : VPSlash -> VP
PastPartAgentAP : VPSlash -> NP -> AP
PastPartAP : VPSlash -> AP
PositAdVAdj : A -> AdV
PredAPVP : AP -> VP -> Cl
PredetRNP : Predet -> RNP -> RNP
PredVPS : NP -> VPS -> S
PrepCN : Prep -> CN -> Adv
PresPartAP : VP -> AP
ProDrop : Pron -> Pron
PurposeVP : VP -> Adv
ReflPoss : Num -> CN -> RNP
ReflPron : RNP
ReflRNP : VPSlash -> RNP -> VP
SlashBareV2S : V2S -> S -> VPSlash
SlashV2V : V2V -> Ant -> Pol -> VPS -> VPSlash
StrandQuestSlash : IP -> ClSlash -> QCl
StrandRelSlash : RP -> ClSlash -> RCl
theyFem_Pron : Pron
UncontractedNeg : Pol
UttAccIP : IP -> Utt
UttAccNP : NP -> Utt
UttAdV : AdV -> Utt
UttDatIP : IP -> Utt
UttDatNP : NP -> Utt
UttVPShort : VP -> Utt
weFem_Pron : Pron
WithoutVP : VP -> Adv
youFem_Pron : Pron
youPlFem_Pron : Pron
youPolFem_Pron : Pron
youPolPl_Pron : Pron
youPolPlFem_Pron : Pron
```

### 48.6 `Idiom` — 14 abstract operations

```text
CleftAdv : Adv -> S -> Cl
CleftNP : NP -> RS -> Cl
ExistIP : IP -> QCl
ExistIPAdv : IP -> Adv -> QCl
ExistNP : NP -> Cl
ExistNPAdv : NP -> Adv -> Cl
GenericCl : VP -> Cl
ImpersCl : VP -> Cl
ImpP3 : NP -> VP -> Utt
ImpPl1 : VP -> Utt
ProgrVP : VP -> VP
SelfAdVVP : VP -> VP
SelfAdvVP : VP -> VP
SelfNP : NP -> NP
```

### 48.7 `Noun` — 40 abstract operations

```text
AdjCN : AP -> CN -> CN
AdjDAP : DAP -> AP -> DAP
AdNum : AdN -> Card -> Card
AdvCN : CN -> Adv -> CN
AdvNP : NP -> Adv -> NP
ApposCN : CN -> NP -> CN
ComplN2 : N2 -> NP -> CN
ComplN3 : N3 -> NP -> N2
CountNP : Det -> NP -> NP
DefArt : Quant
DetCN : Det -> CN -> NP
DetDAP : Det -> DAP
DetNP : Det -> NP
DetQuant : Quant -> Num -> Det
DetQuantOrd : Quant -> Num -> Ord -> Det
IndefArt : Quant
MassNP : CN -> NP
NumCard : Card -> Num
NumDigits : Digits -> Card
NumNumeral : Numeral -> Card
NumPl : Num
NumSg : Num
OrdDigits : Digits -> Ord
OrdNumeral : Numeral -> Ord
OrdNumeralSuperl : Numeral -> A -> Ord
OrdSuperl : A -> Ord
PartNP : CN -> NP -> CN
PossNP : CN -> NP -> CN
PossPron : Pron -> Quant
PPartNP : NP -> V2 -> NP
PredetNP : Predet -> NP -> NP
RelCN : CN -> RS -> CN
RelNP : NP -> RS -> NP
SentCN : CN -> SC -> CN
Use2N3 : N3 -> N2
Use3N3 : N3 -> N2
UseN : N -> CN
UseN2 : N2 -> CN
UsePN : PN -> NP
UsePron : Pron -> NP
```

### 48.8 `Numeral` — 17 abstract operations

```text
IDig : Dig -> Digits
IIDig : Dig -> Digits -> Digits
num : Sub1000000 -> Numeral
pot0 : Digit -> Sub10
pot01 : Sub10
pot0as1 : Sub10 -> Sub100
pot1 : Digit -> Sub100
pot110 : Sub100
pot111 : Sub100
pot1as2 : Sub100 -> Sub1000
pot1plus : Digit -> Sub10 -> Sub100
pot1to19 : Digit -> Sub100
pot2 : Sub10 -> Sub1000
pot2as3 : Sub1000 -> Sub1000000
pot2plus : Sub10 -> Sub100 -> Sub1000
pot3 : Sub1000 -> Sub1000000
pot3plus : Sub1000 -> Sub1000 -> Sub1000000
```

### 48.9 `Phrase` — 19 abstract operations

```text
NoPConj : PConj
NoVoc : Voc
PConjConj : Conj -> PConj
PhrUtt : PConj -> Utt -> Voc -> Phr
UttAdv : Adv -> Utt
UttAP : AP -> Utt
UttCard : Card -> Utt
UttCN : CN -> Utt
UttIAdv : IAdv -> Utt
UttImpPl : Pol -> Imp -> Utt
UttImpPol : Pol -> Imp -> Utt
UttImpSg : Pol -> Imp -> Utt
UttInterj : Interj -> Utt
UttIP : IP -> Utt
UttNP : NP -> Utt
UttQS : QS -> Utt
UttS : S -> Utt
UttVP : VP -> Utt
VocNP : NP -> Voc
```

### 48.10 `Question` — 17 abstract operations

```text
AddAdvQVP : QVP -> IAdv -> QVP
AdvIAdv : IAdv -> Adv -> IAdv
AdvIP : IP -> Adv -> IP
AdvQVP : VP -> IAdv -> QVP
CompIAdv : IAdv -> IComp
CompIP : IP -> IComp
ComplSlashIP : VPSlash -> IP -> QVP
IdetCN : IDet -> CN -> IP
IdetIP : IDet -> IP
IdetQuant : IQuant -> Num -> IDet
PrepIP : Prep -> IP -> IAdv
QuestCl : Cl -> QCl
QuestIAdv : IAdv -> Cl -> QCl
QuestIComp : IComp -> NP -> QCl
QuestQVP : IP -> QVP -> QCl
QuestSlash : IP -> ClSlash -> QCl
QuestVP : IP -> VP -> QCl
```

### 48.11 `Relative` — 5 abstract operations

```text
FunRP : Prep -> NP -> RP -> RP
IdRP : RP
RelCl : Cl -> RCl
RelSlash : RP -> ClSlash -> RCl
RelVP : RP -> VP -> RCl
```

### 48.12 `Sentence` — 19 abstract operations

```text
AdvS : Adv -> S -> S
AdvSlash : ClSlash -> Adv -> ClSlash
EmbedQS : QS -> SC
EmbedS : S -> SC
EmbedVP : VP -> SC
ExtAdvS : Adv -> S -> S
ImpVP : VP -> Imp
ModSubjS : S -> Subj -> S -> S
PredSCVP : SC -> VP -> Cl
PredVP : NP -> VP -> Cl
RelS : S -> RS -> S
SlashPrep : Cl -> Prep -> ClSlash
SlashVP : NP -> VPSlash -> ClSlash
SlashVS : NP -> VS -> SSlash -> ClSlash
SSubjS : S -> Subj -> S -> S
UseCl : Temp -> Pol -> Cl -> S
UseQCl : Temp -> Pol -> QCl -> QS
UseRCl : Temp -> Pol -> RCl -> RS
UseSlash : Temp -> Pol -> ClSlash -> SSlash
```

### 48.13 `Symbol` — 11 abstract operations

```text
CNIntNP : CN -> Int -> NP
CNNumNP : CN -> Card -> NP
CNSymbNP : Det -> CN -> [Symb] -> NP
FloatPN : Float -> PN
IntPN : Int -> PN
MkSymb : String -> Symb
NumPN : Card -> PN
SymbNum : Symb -> Card
SymbOrd : Symb -> Ord
SymbPN : Symb -> PN
SymbS : Symb -> S
```

### 48.14 `Tense` — 9 abstract operations

```text
AAnter : Ant
ASimul : Ant
PNeg : Pol
PPos : Pol
TCond : Tense
TFut : Tense
TPast : Tense
TPres : Tense
TTAnt : Tense -> Ant -> Temp
```

### 48.15 `Text` — 4 abstract operations

```text
TEmpty : Text
TExclMark : Phr -> Text -> Text
TFullStop : Phr -> Text -> Text
TQuestMark : Phr -> Text -> Text
```

### 48.16 `Verb` — 29 abstract operations

```text
AdVVP : AdV -> VP -> VP
AdvVP : VP -> Adv -> VP
AdVVPSlash : AdV -> VPSlash -> VPSlash
AdvVPSlash : VPSlash -> Adv -> VPSlash
CompAdv : Adv -> Comp
CompAP : AP -> Comp
CompCN : CN -> Comp
ComplSlash : VPSlash -> NP -> VP
ComplVA : VA -> AP -> VP
ComplVQ : VQ -> QS -> VP
ComplVS : VS -> S -> VP
ComplVV : VV -> VP -> VP
CompNP : NP -> Comp
ExtAdvVP : VP -> Adv -> VP
PassV2 : V2 -> VP
ReflVP : VPSlash -> VP
Slash2V3 : V3 -> NP -> VPSlash
Slash3V3 : V3 -> NP -> VPSlash
SlashV2A : V2A -> AP -> VPSlash
SlashV2a : V2 -> VPSlash
SlashV2Q : V2Q -> QS -> VPSlash
SlashV2S : V2S -> S -> VPSlash
SlashV2V : V2V -> VP -> VPSlash
SlashV2VNP : V2V -> NP -> VPSlash -> VPSlash
SlashVV : VV -> VPSlash -> VPSlash
UseComp : Comp -> VP
UseCopula : VP
UseV : V -> VP
VPSlashPrep : VP -> Prep -> VPSlash
```

### 48.17 Public surfaces not represented by the 356-function signature inventory

The common abstract-signature inventory above does not by itself close the complete Albanian public surface. The final implementation must also reconcile and validate the following against the **actual pinned abstract/source modules** used by the checkout:

- `StructuralSqi`: every structural constant required by the pinned `Structural` abstract/API, including prepositions, subordinators, conjunctions, determiners/quantifiers, pronouns, interrogatives, adverbs and modal/auxiliary vocabulary;
- `LexiconSqi`: every lexical constant required by the pinned common `Lexicon`, with the correct Albanian paradigm and valency rather than merely a plausible lemma string;
- `ParadigmsSqi`: the public smart-paradigm API used by application grammars, including safe constructors for all common lexical valencies and documented irregular escape hatches;
- `IrregSqi`: irregular lexical/paradigm material that cannot honestly be produced by the regular smart paradigms;
- `ExtraSqi` / `ExtraSqiAbs`: Albanian-specific public capabilities that are intentionally outside the common API;
- `NamesSqi`: case/agreement-aware named entities used by tests/examples or exposed as language resources;
- `DocumentationSqi`: morphology/documentation operations consistent with the final paradigms;
- `MarkupSqi`, if included in the pinned RGL composition: Albanian-safe markup composition with no loss of grammatical structure;
- `SyntaxSqi`, `ConstructorsSqi`, `SymbolicSqi`, `TrySqi`, `LangSqi`, `AllSqi` and their abstract companions: public wrappers/compositions that expose the same validated semantics as the underlying concrete modules.

No surface may be declared complete from file presence alone. Its declarations must be reconciled symbol-for-symbol with the pinned abstract interface.

### 48.18 Function-level acceptance rule

For each operation in the common inventory and each symbol in the additional public surfaces, the completion record must be capable of answering all of the following without inference from comments:

```text
symbol
abstract owner
Albanian concrete owner
status
input category contracts relied upon
output category contract guaranteed
linguistic realization rule
model-language references used, if any
Albanian evidence source
Wordbench scenario(s)
reviewed golden(s), where deterministic surface output is required
known limitations, if any
```

The implementation may store this information in the existing status ledger, generated coverage artifacts, or a future machine-readable manifest. The requirement is semantic completeness and traceability, not a specific metadata format.

---

## 49. Canonical end-state statement

When Albanian RGL is complete, the following description must be accurate without qualification:

> **Albanian has a full GF Resource Grammar Library implementation in which morphology and syntax are compositionally connected; noun, adjective, pronoun and verb inflection is preserved until its grammatical consumer is known; finite and embedded predicates retain agreement, tense, polarity, mood, complement and clitic information until centralized realization; questions, relatives, imperatives, passive/reflexive constructions, coordination, subordination and the complete VPS/VPI family use that same architecture; Structural, Lexicon, Construction, Extend and irregular resources are all linguistically implemented; public Lang/All/API entry points compile cleanly; and Wordbench provides reviewed regression evidence for the released grammatical capabilities.**

That—not a particular patch sequence—is the target against which all remaining Albanian RGL work is evaluated.
