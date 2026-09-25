# Albanian RGL Consolidated MAX Overlay — 2026-09-25

Apply over **exactly** `Code_snapshot_Grammatical_Framework-Albanian(20260925-153041).zip` (SHA-256 `34e1cdddec016f5fdaee1722509ba7cabf4745a50a07ba3ee03e03502efc678f`).

This overlay merges C1, C2, C4, C5, C6, C7, C8, C9 and C10. It is a consolidation/testing candidate. GF/Wordbench execution is still required.

Read first:
- `docs/consolidation/CONSOLIDATED_OVERLAY_REPORT.md`
- `docs/consolidation/CONFLICT_RESOLUTION_LEDGER.md`
- `docs/consolidation/VALIDATION_COMPATIBILITY_MATRIX.md`
- `docs/consolidation/CONSOLIDATION_STATIC_VALIDATION.txt`

No base files are deleted by this overlay. Conflicting useful implementations are preserved in `development/consolidation_variants/`.

## v2 scenario-catalog correction

The registered Wordbench catalog has been replayed through Wordbench's own `build_profile_scenario_catalog`: **142/142 registered scenarios resolve (52 required + 90 optional)**. The expected-failure morphology suite remains manual and is not registered as a normal scenario.
