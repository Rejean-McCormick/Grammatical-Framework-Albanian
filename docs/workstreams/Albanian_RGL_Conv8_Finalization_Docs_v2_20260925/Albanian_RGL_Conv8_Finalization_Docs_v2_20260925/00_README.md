# Albanian RGL - Conversation 8 Finalization Pack v2

**Date:** 2026-09-25  
**Scope:** valence + complementation + copula + secondary predication + coordination + `ConstructionSqi` + `IdiomSqi`  
**Baseline tag supplied by maintainer:** `albanian-s02-green-20260925`  
**Status of this pack:** normative engineering specification; linguistic certification remains evidence-driven.

## Purpose

This pack is the anti-drift contract for Conversation 8. It is designed to survive parallel development, not merely describe intentions.

Every substantive C8 change must be traceable through:

```text
RGL abstract/API contract
-> Albanian linguistic evidence
-> architecture/ownership decision
-> producer/carrier/consumer contract
-> implementation
-> focused test
-> 58/58 + 52/52 preservation gate
-> linguistic review/gold promotion
-> DictSqi valence promotion when applicable
```

## Non-negotiable distinction

- **Compiles** = GF accepts the program.
- **Structurally validated** = contracts, locks and regressions are preserved.
- **Linguistically reviewed** = an Albanian realization has been checked against evidence.
- **Certified** = the relevant test/gold gate has passed and provenance is recorded.

These terms are never interchangeable.

## v2 additions over v1

1. exact baseline hashes for all 58 GF census targets and 52 scenarios;
2. exact abstract API parity inventory for Verb/Conjunction/Construction/Idiom plus scoped Extend;
3. inter-conversation collision/ownership protocol;
4. producer -> carrier -> consumer map for valence and agreement metadata;
5. quantitative DictSqi valence baseline;
6. concrete C8 test-case catalog with evidence states;
7. phenomenon-specific model-language selection policy;
8. explicit release gate and stop conditions;
9. risk register and change protocol;
10. source locator discipline for linguistic evidence.

## Reading order

1. `01_DEFINITION_OF_DONE.md`
2. `02_AUTHORITY_EVIDENCE_AND_MODEL_POLICY.md`
3. `03_BASELINE_LOCK.md`
4. `04_PARALLEL_CONVERSATION_OWNERSHIP_LOCK.md`
5. `05_API_PARITY_MATRIX.md`
6. `06_VALENCY_DATAFLOW_CONTRACT.md`
7. `07_VALENCY_AND_COMPLEMENTATION_CONTRACT.md`
8. `08_COPULA_SECONDARY_PREDICATION_CONTRACT.md`
9. `09_COORDINATION_AND_AGREEMENT_CONTRACT.md`
10. `10_CONSTRUCTION_AND_IDIOM_CONTRACT.md`
11. `11_LINGUISTIC_EVIDENCE_LEDGER.md`
12. `12_MODEL_LANGUAGE_SELECTION_MATRIX.md`
13. `13_DICTSQI_VALENCY_AUDIT.md`
14. `14_TEST_CASE_CATALOG.md`
15. `15_TEST_CERTIFICATION_RELEASE_GATE.md`
16. `16_IMPLEMENTATION_SEQUENCE.md`
17. `17_DECISIONS_AND_OPEN_QUESTIONS.md`
18. `18_TRACEABILITY_MATRIX.md`
19. `19_DELIVERY_CHANGE_PROTOCOL.md`
20. `20_ANTI_DRIFT_RULES.md`
21. `21_RISK_REGISTER.md`
22. `22_GLOSSARY.md`

`99_COMBINED_CONTEXT.md` concatenates the normative documents for fast context loading.

## Status vocabulary

`LOCKED` - may not change without an explicit migration record.  
`OBSERVED` - fact extracted from supplied current source/evidence.  
`TARGET` - intended final behavior.  
`PROVISIONAL` - implementation/evidence exists but is not yet certified.  
`EVIDENCE_REQUIRED` - no implementation decision may be finalized yet.  
`REVIEW_REQUIRED` - executable output exists but requires Albanian linguistic review.  
`CERTIFIED` - acceptance evidence is stored and linked.

## Hard rule

A future patch that cannot identify its affected row in `18_TRACEABILITY_MATRIX.md` must first update the documentation before code is changed.
