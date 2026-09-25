# StructuralSqi completion plan

## Goal

Turn the structurally complete `StructuralSqi` surface into a linguistically certified closed-class inventory.

`StructuralSqi.gf` is intentionally a thin aggregator over:

- `StructuralSqiNominal`;
- `StructuralSqiVerbal`;
- `StructuralSqiClause`;
- support in `StructuralSqiRes`.

Keep that ownership model. Do not accumulate repair logic in the aggregator.

## Work families

### A. Prepositions and government

Audit every common structural preposition (`to`, `from`, `with`, `without`, `by-agent`, `by-means`, `part/possess`, spatial relations, etc.). For each:

- lexical form;
- governed case;
- contractions/nyje interactions if any;
- compatibility with ordinary NP vs clitic realization;
- use in passive/agent constructions;
- contrastive tests.

### B. Pronouns and interrogatives

Audit personal pronouns, polite/plural distinctions, `who/what/which`, case forms, pro-drop interaction and clitic compatibility. The surface should preserve Albanian case/agreement rather than forcing English-like invariant pronouns.

### C. Determiners, quantifiers and predeterminers

Review number, definiteness/species, noun agreement, position and article interaction for `every`, `few`, `many`, `much`, `some`, `this/that`, `no`, `all`, `most`, `only`, `not`, interrogative quantity.

### D. Conjunctions and subordinators

Review coordination, discontinuous coordination, `if`, `although`, causal/temporal/that-like subordination and their interaction with mood/subjunctive realization. Shared spellings such as `të` must not be collapsed across grammatical functions merely because the token is identical.

### E. Structural adverbs

Certify locative/deictic direction (`here`, `to here`, `from here`, etc.), interrogatives, degree/comparison and discourse conjunctions.

### F. Structural verbs/modals

`can8know_VV`, `can_VV`, `want_VV`, `must_VV`, `have_V2` require valency and complement-form review. In particular, VV complementation must follow Albanian complement structure and not English infinitival assumptions.

## Done criteria

- every common Structural function has an evidence record;
- government and agreement-bearing items have focused tests;
- modal/VV items have complement tests;
- no structural function is represented only by an unexplained empty string or placeholder;
- full integration remains green;
- accepted outputs are promoted into gold by semantic family.

## Traceability additions (v2)

- Every Structural function is identified by a stable `C9-STR-*` row in `03_ENGLISH_ALBANIAN_PARITY_MATRIX.md`.
- Evidence families are registered in `17_LINGUISTIC_EVIDENCE_LEDGER.md`.
- Test families `T-C9-STR-*` are defined in `18_TEST_COVERAGE_REGISTER.md`.
- A family is not “done” until the corresponding matrix rows and test register are reconciled.
- If a Structural choice exposes a core case/article/clitic defect, open or reference the relevant `C9-DEC-*` record rather than encoding a local workaround.
