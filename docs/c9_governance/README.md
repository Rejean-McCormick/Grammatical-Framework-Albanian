# Conversation 9 — Albanian RGL advanced coverage + public API

**Status:** governing work pack v2.0  
**Optimized:** 2026-09-25  
**Target:** maximum functionally relevant maturity comparable to English RGL, with Albanian linguistic correctness and public API stability.

## Protected baseline

- GF 3.12;
- Wordbench 1.3.4;
- integration tag/context `albanian-s02-green-20260925`;
- run `20260925_112639`;
- Wordbench source-lock `6834fc8975ce82a6c4984280bff1000dae644f134fec457996abb9f25888ef37`;
- 58/58 GF targets;
- 52/52 required scenarios;
- zero structural lock warnings;
- linguistic certification not established.

## Why v2 exists

The v1 pack was a strong governance plan but left several facts implicit. v2 adds:

- stable IDs for every tracked common function;
- exact abstract signatures;
- Albanian owner resolution;
- evidence/test/decision links;
- corrected N/A semantics for common contracts;
- public API composition/export matrix;
- API compatibility contract;
- full mature-English module-surface inventory;
- linguistic evidence ledger;
- test coverage register;
- inter-workstream dependency register;
- structured decision register;
- final closure checklist and patch template.

## Normative reading order

### Before any patch

1. `00_FINAL_TARGET.md`
2. `01_AUTHORITY_AND_SOURCE_LOCK.md`
3. `02_PARITY_STATUS_MODEL.md`
4. `10_DRIFT_GUARD.md`
5. `16_TRACEABILITY_MODEL.md`

### For implementation

6. `03_ENGLISH_ALBANIAN_PARITY_MATRIX.md`
7. relevant plan `04`–`07`
8. `19_PUBLIC_API_EXPORT_MATRIX.md` for API work
9. `23_ENGLISH_SURFACE_INVENTORY.md` for English-parity scope
10. `21_INTER_CONVERSATION_DEPENDENCIES.md`

### For evidence and validation

11. `08_LINGUISTIC_EVIDENCE_MAP.md`
12. `17_LINGUISTIC_EVIDENCE_LEDGER.md`
13. `22_DECISION_REGISTER.md`
14. `18_TEST_COVERAGE_REGISTER.md`
15. `09_TEST_AND_RELEASE_GATES.md`
16. `20_API_COMPATIBILITY_CONTRACT.md`

### For delivery/closure

17. `12_BUILD_SEQUENCE_AND_HANDOFF.md`
18. `24_CLOSURE_CHECKLIST.md`
19. `25_PATCH_RECORD_TEMPLATE.md`
20. `15_EXPECTED_FINAL_DELIVERABLES.md`
21. `26_V2_QUALITY_AUDIT.md`

## Critical interpretation

**English-equivalent means equivalent maturity/capability, not identical analysis.** A common RGL function cannot be dropped as “linguistically N/A”; if Albanian does not encode the distinction separately, the concrete still needs a documented/tested neutralized equivalent.

## Pack provenance

| Input | SHA-256 | Role |
|---|---|---|
| `Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip` | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` | current Albanian working snapshot |
| `gf-rgl-master.zip` | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` | supplied full RGL/English comparison snapshot |
| `Code_snapshot_GF_RGL_AI_Compendium(4).zip` | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` | contracts/workflows/governance |
| `Code_snapshot_GF_Wordbench(20260925-123301).zip` | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` | validation tool source |
| `Albanian_ref(20260925-125550).zip` | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` | Albanian linguistic/reference corpus |

The supplied RGL archive contains no Git metadata; exact active RGL identity remains a release-blocking decision until reconciled.

## Pack rule

This documentation controls **how claims are made**, not the grammar by itself. Source, compiler evidence, Albanian linguistic evidence and tests remain the substantive authorities defined in `01_AUTHORITY_AND_SOURCE_LOCK.md`.

## Candidate implementation record

- `27_C9_FINALIZATION_CANDIDATE_20260925.md` — source delta, static validation and external gates for the 2026-09-25 C9 finalization candidate.

## Candidate implementation audit

- `27_C9_FINALIZATION_CANDIDATE_20260925.md` — candidate delta and certification reset.
- `28_C9_IMPLEMENTATION_AUDIT_20260925.md` — source-level closure audit, static proof, and remaining external/cross-workstream gates.
