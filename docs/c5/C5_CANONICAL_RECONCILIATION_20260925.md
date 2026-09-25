# C5 canonical reconciliation — 2026-09-25

## Authority

This file reconciles the delivered C5 implementation with the supplied consolidated governance package `Albanian_RGL_Total_Documentation_v2_CompendiumAligned_20260925`.

The copied files under `docs/c5/spec_v2/` and `docs/c5/canonical_reference/` are source-locked reference copies. This reconciliation is the implementation-specific delta; it does not rewrite the supplied canonical package.

## Local implementation state

- lifecycle: **FINALIZED_LOCALLY / NOT_GF_CERTIFIED**
- required compiler: GF 3.12
- required Wordbench: 1.3.4
- exact census shape: 51 language + 5 API + 2 MorphoDict = **58**
- required scenarios after C5: 52 historical + 5 C5 = **57**
- new C5 reviewable CASEs: **199**
- exact 58-target aggregate source lock: `e15d7abd7c99510a438cc90b682b55c7ef7e1f17f3b49e8aae791e90c2adb49b`
- C5 static validator: **167/167 PASS**
- Dict validator: PASS
- MorphoDict validator: PASS
- combined Dict/MorphoDict validator: PASS
- MorphoSqi lint: 0 findings
- Python compileall: PASS (generated caches removed before packaging)

## Canonical C5 DoD reconciliation

| Gate | Local status | Evidence / remaining condition |
|---|---|---|
| C5-DOD-001 no BLOCKING questions | **NOT MET** | canonical variation/policy questions remain: positive imperative clitic policy, `nuk/s'`, detailed `po` ordering, non-active `u`, selected semantics |
| C5-DOD-002 GF 3.12 58/58 | **NOT EXECUTED** | GF 3.12 binary is not available in this environment |
| C5-DOD-003 historical 52/52 | **NOT RE-RUN** | type migration requires fresh exact-source run |
| C5-DOD-004 C5 scenarios | **PREPARED, NOT RUN** | 5 scenarios / 199 CASEs exist and input SHA locks pass |
| C5-DOD-005 no `cl/subjcl` authority | **PASS STATIC** | no active `cl : Str`, `subjcl`, `acc_clit`, or `dat_clit` authority remains |
| C5-DOD-006 no surface→role reconstruction | **PASS STATIC** | roles remain typed through `CliticCluster`; runtime confirmation pending |
| C5-DOD-007 18/18 doubles | **PASS SOURCE/STATIC; RUNTIME PENDING** | all 18 source-locked cells inventoried and flattener mappings statically asserted |
| C5-DOD-008 pronoun/distal/proximal/cili cells | **PASS SOURCE/PREPARED; RUNTIME PENDING** | cell scenarios exist; runtime output review pending |
| C5-DOD-009 14 source prepositions | **PASS SOURCE/PREPARED; RUNTIME PENDING** | 14/14 government rows source-locked and scenario cases prepared |
| C5-DOD-010 all Structural preps classified | **PASS CLASSIFICATION** | 21/21 classified, no `UNASSESSED`; 15 source-locked, 6 `REVIEW_REQUIRED` |
| C5-DOD-011 RGL API parity constructors | **PASS STATIC ASSESSMENT; RUNTIME PENDING** | 21/21 registry rows `STATIC_ASSESSED`; GF behavioral proofs pending |
| C5-DOD-012 `u` roles distinct | **PASS ARCHITECTURE** | Refl cluster role, Dat3pl weak role, and non-active morphology remain distinct |
| C5-DOD-013 `po` outside cluster | **PASS STATIC** | `progressive : Bool` is separate from `CliticCluster` |
| C5-DOD-014 Gen/Dat distinction | **PASS STATIC** | syntax `Gen`, `MorphCase` mapping `Gen -> MDat`, nyje/genitive complement path present |
| C5-DOD-015 no new placeholders | **PASS C5** | no new compile-safe linguistic placeholder introduced by C5 |
| C5-DOD-016 C5 gold provenance/review | **NOT MET** | no C5 gold is promoted before GF output and linguistic review |
| C5-DOD-017 docs/ledger/traceability synchronized | **PASS LOCAL RECONCILIATION** | supplied C5 spec copied verbatim; local reconciliation/evidence/registries reflect delivered code; runtime statuses remain intentionally open |

## Additional closure performed after the first candidate

1. `RelativeSqi.FunRP` was corrected to the common RGL semantic shape: the head NP bears the outer RP case; the embedded RP bears the preposition-governed case. The prior order incorrectly realized `Prep + NP + RP`.
2. `brother_N2`, `father_N2`, and `mother_N2` no longer encode genitive relation as lexical pseudo-prepositions `i/e`; they use the typed `GenitiveCompl`, so nyje selection remains contextual.
3. All explicit `Case` and `MorphCase` tables in active Albanian source are structurally audited for exhaustiveness.
4. All 21 `Structural.*_Prep` mappings are classified against implementation shape.
5. All C5 API parity rows are statically associated with their concrete owner implementation.

## What is deliberately not fabricated

The local delivery does **not** claim:

- GF compilation success for the migrated five-case/typed-clitic representation;
- Wordbench 58/58 after C5;
- 57/57 scenario success;
- linguistic certification of the 6 `REVIEW_REQUIRED` Structural preposition mappings;
- a final choice for optional positive-imperative enclisis vs proclisis;
- canonical `nuk` vs `s'` variation;
- reviewed gold status for any new C5 output.

Those are external/run/reviewer gates, not missing local implementation work.
