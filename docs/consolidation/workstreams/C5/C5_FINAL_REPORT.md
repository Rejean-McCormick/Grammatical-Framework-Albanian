# Albanian RGL C5 — final local report

Date: 2026-09-25

## Delivery status

**Finalized as far as locally possible. Runtime certification remains external.**

The C5 code, validation campaign, source-lock, governance reconciliation, inventories and evidence packet are complete for local delivery. No GF 3.12 executable is available in this environment, so 58/58 compilation and 57/57 scenarios are not asserted.

## Final local evidence

- C5 static validation: **167/167 PASS**
- GF target census shape: **58 = 51 + 5 + 2**
- required scenarios: **57 = 52 historical + 5 C5**
- new C5 CASEs: **199**
- source-locked C5 expectation rows: **165**
- runtime/reviewer rows: **34**
- Structural prepositions: **21/21 classified**, 15 source-locked, 6 review-required
- C5 API parity registry: **21/21 statically assessed**
- Dict validator: PASS
- MorphoDict validator: PASS
- combined Dict/MorphoDict validator: PASS
- MorphoSqi lint: **0 findings**
- Python compileall: PASS
- exact 58-target aggregate source SHA-256: `e15d7abd7c99510a438cc90b682b55c7ef7e1f17f3b49e8aae791e90c2adb49b`

## Final hardening beyond the first implementation candidate

- corrected `RelativeSqi.FunRP` ordering/case routing to the common RGL contract;
- migrated kinship N2 genitives (`brother_N2`, `father_N2`, `mother_N2`) to typed `GenitiveCompl`;
- added depth-aware exhaustiveness audit for every explicit active `Case`/`MorphCase` table;
- added exact static checks for clitic-fusion and `të` contraction services;
- classified all common Structural prepositions;
- added static ownership/parity registry for all C5-relevant common-RGL constructors;
- embedded the supplied C5 v2 governance/reference documentation in the delivery;
- produced exact diff and source-lock evidence.

## External acceptance gate

Run this exact tree under GF 3.12 + Wordbench 1.3.4 and require:

```text
GF census             58/58
historical scenarios  52/52
C5 scenarios           5/5
required total        57/57
```

Then review C5 CASE outputs against `validation/c5/C5_REFERENCE_EXPECTATIONS.tsv`. Do not promote golds before that review.
