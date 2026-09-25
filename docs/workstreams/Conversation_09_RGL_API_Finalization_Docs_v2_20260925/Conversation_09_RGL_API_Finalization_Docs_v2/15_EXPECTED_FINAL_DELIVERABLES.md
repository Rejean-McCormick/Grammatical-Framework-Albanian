# Expected final deliverables — Conversation 9

## A. Source surfaces eligible for evidence-backed change

### Structural

`StructuralSqi.gf`, `StructuralSqiClause.gf`, `StructuralSqiNominal.gf`, `StructuralSqiVerbal.gf`, `StructuralSqiRes.gf`.

### Extend / Extra

`ExtendSqi.gf` and its APCN/Existential/FocusPrep/Helpers/Lexicon/RNP/Scaffolding/VPBridge/VPS companions; `ExtraSqi.gf`/`ExtraSqiAbs.gf` only for justified compatibility/extra changes.

If a defect belongs to Cat/Res/Verb/Noun/Clause/Paradigms/etc., fix the owner with migration tests rather than masking it in C9 surfaces.

### Public API

`SyntaxSqi.gf`, `ConstructorsSqi.gf`, `CombinatorsSqi.gf`, `TrySqi.gf`, `SymbolicSqi.gf`; `BrowseSqi.gf` only after `C9-DEC-017`.

### Release surfaces

`DocumentationSqi.gf`, `SymbolSqi.gf`, `MarkupSqi.gf`.

## B. Validation assets

Add semantically grouped scenario families from `18_TEST_COVERAGE_REGISTER.md`; never delete/rename the protected 52 scenarios merely to reorganize them. New scenarios grow the profile intentionally.

## C. Documentation/control artifacts that must remain current

1. final target;
2. source/RGL locks;
3. function traceability matrix;
4. public API matrix;
5. full English surface inventory/dispositions;
6. linguistic evidence ledger;
7. test coverage register;
8. decision register;
9. API compatibility contract;
10. inter-conversation dependency register;
11. closure checklist;
12. patch/handoff records;
13. known limitations.

## D. Final release report contents

- exact GF/RGL/Wordbench/source identities;
- final counts by contract scope, coverage status and certification status;
- all neutralized equivalents with rationale;
- all retained shared defaults promoted to equivalent;
- English-only/tooling surfaces and their final dispositions;
- source files modified;
- scenario/gold additions;
- full Wordbench census and scenario count;
- API compatibility result;
- closed/deferred decisions;
- known non-certified behavior;
- external-workstream dependencies still limiting C9 certification.

## E. Required machine/audit state

No release claim is complete unless the matrices/registers can answer, for every high-risk capability:

`contract → Albanian owner → decision → linguistic evidence → test → gold/result → source-lock`.
