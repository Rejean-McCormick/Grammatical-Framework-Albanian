# Albanian RGL — Conversation 7 — Clause Syntax Finalization Pack v2

**Date:** 2026-09-25  
**Status:** normative planning and drift-control package; no code change is implied by this documentation  
**Workstream:** clause/sentence syntax (`ClauseSqiRes`, `SentenceSqi`, `QuestionSqi`, `RelativeSqi`, clause-level extensions)  
**Baseline:** GF 3.12; Wordbench 1.3.4; documented green floor `58/58` GF targets + `52/52` scenarios; linguistic certification not yet established.

## Purpose

This package is the persistent contract for Conversation 7. It is designed so that a later patch, reviewer, or parallel conversation can answer five questions without reconstructing intent from chat history:

1. What exact Albanian behavior is supported by supplied evidence?
2. Which component owns each realization decision?
3. Which current code sites are canonical, transitional, or uncertified?
4. Which test proves each accepted change?
5. What is still explicitly open and therefore forbidden to “solve” by analogy or convenience?

The package separates **facts**, **architecture decisions**, **current implementation state**, **open decisions**, and **certification state**. A compiling behavior is not promoted to a linguistic fact simply because it is green.

## Final objective

Reach English-level RGL **coverage discipline and maintainability** for clause syntax while keeping Albanian grammar evidence-driven. The final system must have one authoritative ordinary finite-clause assembly boundary, thin public constructors, explicit specialist boundaries, preserved slash/government information, and tested interactions with TAM, clitics, voice, valency and nominal syntax.

The target includes declaratives, polarity, imperatives, direct/embedded questions, relatives, subordination, sentential complements, adverbial placement, and only those marked orders/focus strategies that receive Albanian evidence.

## Read order

1. `01_SOURCE_LOCK_AND_AUTHORITY.md`
2. `02_FINAL_TARGET_AND_SCOPE.md`
3. `13_CURRENT_IMPLEMENTATION_AUDIT.md`
4. `14_EVIDENCE_TRACEABILITY_MATRIX.md`
5. `03_CLAUSE_ARCHITECTURE_CONTRACT.md`
6. `04_FUNCTIONAL_COVERAGE_MATRIX.md`
7. `05_ALBANIAN_LINGUISTIC_RULES.md`
8. `10_OPEN_DECISIONS.md`
9. `06_IMPLEMENTATION_SEQUENCE.md`
10. `07_TEST_AND_CERTIFICATION_PLAN.md`
11. `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md`
12. `08_CROSS_WORKSTREAM_INTERFACES.md`
13. `16_PARSE_GENERATION_VARIANT_POLICY.md`
14. `09_ANTI_DRIFT_RULES.md`
15. `17_BASELINE_EVIDENCE_LOCK.md`
16. `18_CERTIFICATION_DASHBOARD.md`
17. `11_CHANGE_RECORD_TEMPLATE.md`
18. `12_MODEL_LANGUAGE_COMPARISON_POLICY.md`

## Document map

| File | Purpose |
|---|---|
| `01_SOURCE_LOCK_AND_AUTHORITY.md` | locked inputs, hashes, authority by claim type, evidence vocabulary |
| `02_FINAL_TARGET_AND_SCOPE.md` | definition of final completeness and English-parity meaning |
| `03_CLAUSE_ARCHITECTURE_CONTRACT.md` | target ownership/data-flow contract and permitted evolution |
| `04_FUNCTIONAL_COVERAGE_MATRIX.md` | all 41 shared Sentence/Question/Relative functions with current/target status |
| `05_ALBANIAN_LINGUISTIC_RULES.md` | evidence-backed Albanian rules and explicit evidence gaps |
| `06_IMPLEMENTATION_SEQUENCE.md` | incremental phase plan with entry/exit/rollback gates |
| `07_TEST_AND_CERTIFICATION_PLAN.md` | structural, behavioral, linguistic, parse and regression gates |
| `08_CROSS_WORKSTREAM_INTERFACES.md` | boundaries with clitic/TAM/voice/valency/nominal workstreams |
| `09_ANTI_DRIFT_RULES.md` | non-negotiable constraints and drift detection |
| `10_OPEN_DECISIONS.md` | questions the implementation may not silently decide |
| `11_CHANGE_RECORD_TEMPLATE.md` | required patch record |
| `12_MODEL_LANGUAGE_COMPARISON_POLICY.md` | permitted role of English/Balkan model languages |
| `13_CURRENT_IMPLEMENTATION_AUDIT.md` | exact current clause assembly sites and hotspots |
| `14_EVIDENCE_TRACEABILITY_MATRIX.md` | evidence → code → test → decision → certification linkage |
| `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md` | clause behavior outside the three core concrete modules |
| `16_PARSE_GENERATION_VARIANT_POLICY.md` | canonical generation, variants, parsing and ambiguity policy |
| `17_BASELINE_EVIDENCE_LOCK.md` | integration floor and what must be re-proven after every patch |
| `18_CERTIFICATION_DASHBOARD.md` | current vs target status by linguistic family |
| `19_V2_CHANGELOG.md` | why v2 supersedes v1 |
| `MANIFEST.md` | byte hashes of this documentation package |

## Starting state captured by v2

- The exact shared abstract surface is structurally present: **19/19 Sentence + 17/17 Question + 5/5 Relative = 41/41 functions**.
- Current `ClauseSqiRes` already centralizes finite VP realization, subjunctive realization, imperative realization and ordinary `mkClause` predication.
- Public and extension modules still contain independent ordering/complementizer/question/relative assembly sites; these are inventoried in `13_CURRENT_IMPLEMENTATION_AUDIT.md` and are not all defects, but each now has an explicit disposition.
- The supplied 52-scenario corpus contains **569 CASEs**. A clause-relevant working subset identified in this package covers **240 CASEs across 24 scenarios**, but those cases are regression observations until reviewed and promoted to linguistic golds.
- Supplied Albanian references support several important clause facts but do **not** fully characterize embedded questions, information-structure orders, adverb placement classes, pro-drop policy, or preposition stranding.

## Governing invariant

> English defines coverage pressure. Albanian sources define Albanian grammar. Model languages expose architecture options. The GF compiler establishes structural acceptability. Reviewed golds establish accepted linguistic behavior.

## “Complete” means

This workstream is complete only when every relevant public and extension constructor is either:

- delegated to the canonical clause architecture and certified;
- documented as a specialist with its own justified contract and tests; or
- explicitly marked linguistically not applicable / deferred with an open decision.

`58/58 + 52/52` is a merge floor, not the final linguistic criterion.
