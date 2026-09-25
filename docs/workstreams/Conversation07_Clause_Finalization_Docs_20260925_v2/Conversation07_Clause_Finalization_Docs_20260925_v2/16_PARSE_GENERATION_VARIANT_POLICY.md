# Parse / Generation / Variant Policy — Clause Syntax v2

## 1. Why this policy exists

Albanian references support multiple surface alternatives in several domains. GF `variants` and alternate linearizations can affect both generation and parsing, so “accept both” is not a neutral implementation choice.

This package distinguishes:

- **canonical generation** — preferred output of certified application use;
- **accepted generated variant** — multiple outputs are intentionally exposed;
- **parse acceptance goal** — a surface should be understood by the grammar;
- **descriptive attestation only** — source proves the form exists, but RGL policy is not chosen.

A desired parse-only alternative cannot be claimed if the chosen GF representation also exposes it in generation; that tradeoff must be documented.

## 2. Current alternative families

| Family | Evidence | Current generation | Policy status |
|---|---|---|---|
| indicative negator `nuk` / `s'` | E-C07-002 supports both | `nuk` only | OD-C07-013 open |
| indicative complementizer `se` / `që` | E-C07-006 supports both | mostly `që` | OD-C07-003 open |
| relative `që` / declined `cili/e` | E-C07-008/009 supports both strategies | mixed through RP APIs | OD-C07-004/005 open |
| positive imperative clitic pre/post | E-C07-010 supports both in examples | current cluster path not full alternation | OD-C07-016 open |
| marked constituent orders | only neutral SVO + unspecified flexibility | `ExtraSqi` has ad-hoc focus paths | OD-C07-006 open |

## 3. Default rule before policy closure

Until an open alternative is characterized:

1. preserve the current green canonical output if it is not known wrong;
2. do not add broad `variants` merely to increase acceptance;
3. add descriptive tests/review cases only when they do not force an unsupported grammar decision;
4. record the alternative as an open decision.

## 4. When `variants` are allowed

A syntax patch may introduce variants only if it documents:

- both/all forms are grammatical in the target scope;
- whether they differ by register, dialect, information structure or free variation;
- whether exposing multiple generation outputs is acceptable;
- parse/linearization ambiguity before/after;
- interaction with gold policy;
- boundedness (no combinatorial multiplication across independent optional dimensions without review).

This restriction is separate from the project's stronger MorphoDict rule that forbids `variants` as a morphology-analysis substitute.

## 5. Canonicalization preference

For application-friendly mature RGL behavior, prefer one reviewed canonical generation when the source supports multiple forms but does not establish that unconstrained free variation is desirable. Preserve alternatives only through a representation whose semantics are understood.

## 6. Parse tests

For every supported alternative family, once policy closes:

- linearize canonical tree(s);
- parse canonical output;
- parse accepted alternate if intended;
- inspect number/shape of parses for a representative sample;
- ensure an alternate does not accidentally license unrelated word orders;
- test nested/negative/clitic contexts where the alternative interacts with clause structure.

## 7. Gold policy

A gold may be:

- exact canonical string;
- a reviewed set of accepted outputs if the harness explicitly supports it;
- a structural/normalized assertion when orthographic alternatives are intentionally outside the grammatical question.

Do not weaken a gold to “anything passes” to accommodate uncontrolled variants.
