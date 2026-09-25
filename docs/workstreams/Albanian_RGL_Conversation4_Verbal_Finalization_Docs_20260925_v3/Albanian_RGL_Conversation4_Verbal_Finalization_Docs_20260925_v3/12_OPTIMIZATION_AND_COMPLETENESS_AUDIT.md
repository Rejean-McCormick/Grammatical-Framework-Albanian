# v3 optimization and completeness audit

**Status:** meta-governance record.

## 1. Why v3 exists

The v2 pack was comprehensive but repeated the same rules across architecture, anti-drift, slot-contract, cross-workstream, migration and release documents. Repetition increases the risk that one copy is edited while another remains stale.

v3 therefore applies **single canonical ownership**:

- invariants only in `00`;
- current facts/debt only in `01`;
- architecture/ownership only in `02`;
- linguistic evidence only in `03`;
- realization legality/ordering only in `04`;
- public API coverage only in `05`;
- decisions/open questions only in `06`;
- migration/DRAFT-MAX/rollback only in `07`;
- testing/traceability/certification only in `08`;
- comparison policy only in `09`;
- release checklist only in `10`.

## 2. v2 → v3 consolidation map

| v2 document | v3 owner |
|---|---|
| `00_SCOPE_AND_DEFINITION_OF_DONE` + `09_ANTI_DRIFT_RULES` | `00_MASTER_CONTRACT` |
| `01_CURRENT_STATE_AND_DEBT` | `01_CURRENT_BASELINE_AND_DEBT` |
| `02_TARGET_VERBAL_ARCHITECTURE` + `14_PARTICLE_CLITIC_SLOT_CONTRACT` + `16_CROSS_WORKSTREAM_DEPENDENCIES` | `02_ARCHITECTURE_AND_OWNERSHIP` for ownership; `04_REALIZATION...` for slot legality |
| `03_LINGUISTIC_EVIDENCE_LEDGER` | `03_LINGUISTIC_EVIDENCE` with tighter HTML heading locators |
| `04_TAM_VOICE_CONSTRAINT_MATRIX` + `13_VERBAL_REALIZATION_STRATEGY_CATALOG` | `04_REALIZATION_STRATEGIES_AND_CONSTRAINTS` |
| `05_RGL_PARITY_AND_MODEL_LANGUAGE_MAP` | `09_COMPARISON_POLICY` |
| `06_IMPLEMENTATION_SEQUENCE` + `10_DRAFT_MAX_HARVEST_POLICY` + `17_MIGRATION_ROLLBACK_AND_CHANGE_CONTROL` | `07_IMPLEMENTATION_CHANGE_CONTROL` |
| `07_TEST_AND_CERTIFICATION_PLAN` + `15_SOURCE_DECISION_TEST_TRACEABILITY` | `08_TEST_TRACEABILITY_CERTIFICATION` |
| `08_DECISIONS_AND_OPEN_QUESTIONS` | `06_DECISIONS_AND_OPEN_QUESTIONS` |
| `11_RELEASE_EXIT_CHECKLIST` | `10_RELEASE_GATE` |
| `12_PUBLIC_RGL_VERB_COVERAGE_MATRIX` | `05_PUBLIC_RGL_COVERAGE` |
| `18_COMPLETENESS_AUDIT` | this file |

## 3. Material improvements beyond condensation

v3 also:

- records exact current source shortcuts (`sqiTense`, `haveAux`, `PassV2`, `ReflVP`) as named debt items;
- explicitly notes the upstream `TPast` “imperfect” gloss as relevant contract evidence without pretending it settles Albanian VQ-001;
- upgrades major HTML linguistic evidence to exact lesson/grammar heading locators;
- makes the 16 common RGL temporal/polarity combinations an explicit test obligation;
- distinguishes slot **ownership** from any claimed universal surface order;
- centralizes ID namespaces to stop accidental renaming/reuse.

## 4. Documentation completeness

The pack is complete enough to govern implementation when:

1. each public RGL operation has an owner/finalization obligation;
2. each supported verbal construction has a stable strategy ID;
3. every code-affecting linguistic claim has a `VE-*` locator;
4. every certified behavior links evidence + decision + implementation + tests + run;
5. every shared type has an ownership boundary;
6. each migration slice has rollback criteria;
7. unresolved linguistics remains explicit as `VQ-*` rather than hidden in code.

The codebase is not final merely because this documentation gate passes.

## 5. Intentionally unresolved

The following remain correctly OPEN: VQ-001 through VQ-009. Their presence is not documentation incompleteness; inventing answers would be drift.
