# Final Target and Scope — Albanian Clause Syntax v2

## 1. Meaning of “equivalent to English”

For Conversation 7, English parity means parity of **public RGL coverage, compositional discipline, testability and maintenance quality**, not parity of English word order or English grammatical analyses.

The final Albanian implementation should let ordinary RGL application grammars use the shared `Sentence`, `Question`, `Relative`, `Verb`, `Extend` and related surfaces without needing Albanian-specific string repairs. Where Albanian requires different distinctions, Albanian categories/resources may be richer or organized differently.

## 2. Final product

The final workstream delivers a stable clause subsystem with these properties:

### Ordinary finite clauses

- one canonical finite-clause realization boundary;
- subject agreement supplied structurally;
- TAM, anteriority, polarity and clitic realization delegated to their owning interfaces;
- neutral declarative order supported and certified;
- no public constructor reconstructs finite morphology from strings.

### Negative clauses

- indicative negation and non-indicative negation remain distinct;
- negation composes with clitics, future/conditional, anteriority, passives and embeddings;
- alternative surface negators are controlled by an explicit generation/variant policy, not ad hoc `variants`.

### Questions

- direct polar questions;
- subject, object and oblique wh questions;
- interrogative case government;
- multiple-wh/QVP coverage from the shared abstract;
- embedded questions only after direct/embedded Albanian behavior is evidenced;
- no transformation of a completed declarative string.

### Relative clauses

- subject and object relatives;
- governed/prepositional relatives;
- head agreement and relative-pronoun case preserved as long as needed;
- invariant `që` and declined `cili/e` strategies represented according to an explicit policy;
- no universal “relative = `që` + sentence” shortcut.

### Subordination and sentential complementation

- indicative sentential complements;
- finite subjunctive complements;
- sentence-level subordinators;
- control/subject realization coordinated with the valency workstream;
- complementizer choice documented rather than copied from English.

### Constituent order and information structure

- neutral SVO is the default supported order because it is directly evidenced;
- any topicalization, focus or scrambling behavior receives a named grammatical condition and tests;
- “Albanian word order is flexible” is never implemented as free permutation;
- a typed order dimension is introduced only if multiple certified orders require it.

### Clause-level extensions

`ExtendSqi`, `ExtraSqi`, `ConstructionSqi`, `IdiomSqi` and helper resources must either delegate to the same architecture or document why a specialized realization path is grammatically distinct.

## 3. Public completeness target

The shared core surface is 41 functions:

- `Sentence`: 19;
- `Question`: 17;
- `Relative`: 5.

Structural presence is already 41/41. Final completeness requires more than presence: each function must have an ownership classification, behavioral tests, and an evidence/certification status in `04_FUNCTIONAL_COVERAGE_MATRIX.md`.

The workstream also owns clause-level behavior that enters through `Extend`, `Extra`, `Construction`, `Idiom`, `Phrase`, and selected `Verb` complement constructors. Those surfaces are inventoried separately in `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md` so “41/41” cannot hide a clause-level parity gap.

## 4. Architecture quality target

A mature implementation should satisfy:

```text
lexical/morphological forms
        ↓
VP / VPSlash preserves mutable grammatical information
        ↓
clause planner/assembler owns ordinary finite constituent realization
        ↓
Sentence / Question / Relative are thin semantic coordinators
        ↓
Use* fixes public tense/polarity/anteriority
        ↓
S / QS / RS output
```

Specialists such as imperatives, fragments, direct speech, existentials or construction-specific clauses may have dedicated realizers, but they must be named and justified rather than silently forking ordinary clause logic.

## 5. Workstream ownership boundaries

Conversation 7 **consumes but does not duplicate**:

- verb paradigms and mood forms (verbal/morphology workstreams);
- clitic cluster formation and contractions (clitic workstream);
- voice/non-active morphology (voice workstream);
- valency/control/government decisions (valency workstream);
- full relative/interrogative nominal paradigms (nominal syntax workstream);
- lexical choice/provenance (Dict/Structural workstreams).

Conversation 7 owns when and where these structured outputs participate in a clause.

## 6. Explicit non-goals

- copying English clause order;
- activating DRAFT-MAX wholesale;
- introducing `Order`, `QForm`, extra clause slots, or a richer `SC` merely because model languages have them;
- treating compile-safe placeholders as syntax completion;
- using a broad refactor to solve a local evidence-backed defect;
- claiming focus/topicalization/scrambling maturity without Albanian evidence.

## 7. Definition of final completion

The workstream reaches its final gate when:

1. all 41 shared functions have a resolved status and required tests;
2. all clause-level extension sites in `15_*` are delegated, specialized-with-proof, or explicitly deferred/N/A;
3. no active open decision is being silently encoded in code;
4. GF 3.12 full census remains at least the locked `58/58` target unless the census intentionally grows;
5. all required scenarios remain green and clause-specific scenarios have expanded to cover the final contrasts;
6. accepted linguistic outputs are promoted to golds with provenance;
7. parse/generation behavior for supported alternatives is documented;
8. no known systematic clause family in the certified scope remains malformed;
9. documentation, source hashes, decisions and test evidence are reconciled in one change record.
