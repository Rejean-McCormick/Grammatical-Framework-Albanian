# MorphoDictSqi MAX — build report CMP-C2-MAX-20260925

## Scope

C2-only morphology-dictionary campaign against the supplied 2026-09-25 Albanian snapshot. The campaign does not edit `ResSqi`, `MorphoSqi`, `ParadigmsSqi` or `IrregSqi`.

## Before

- active functions: 592
- compile-safe placeholders: 155 = 97 N + 35 A + 23 V
- placeholders were structurally compilable debt, not certified inflection.

## Resolution method

For every placeholder:

1. read all recorded Tosk observed forms for the same lemma/category;
2. evaluate the current numbered `MorphoSqi` classes conservatively;
3. prefer the current `ParadigmsSqi` smart-dispatch class **only if** it reproduces every recorded form and noun gender;
4. if smart dispatch fails, accept another numbered class only when it is the **unique** evidence-compatible class;
5. otherwise block the entry. No invariant fallback is created.

This yields:

- 123 explicit class resolutions: 75 N, 32 A, 16 V;
- 32 blocked: 22 N, 3 A, 7 V;
- 5 of the 32 are source conflicts; 27 are C2 insufficient-evidence cases. Two of those 27 have zero statically matching numbered classes and are sent only to **C1 triage**, not asserted as proven missing classes.

Representative recovered cases:

- `aeroport_N -> mkN005 "aeroport"`
- `barabartë_A -> mkA013 "barabartë"`
- `bazohem_V -> mkV041 "bazohem"`
- `breg_N -> mkN096 "breg"` (unique alternative to bad smart route)
- `mashkull_N -> mkN257 "mashkull"` (unique alternative)
- `tjetër_A -> mkA025 "tjetër"` (unique alternative)
- `kryej_V -> mkV042 "kryej"` (unique alternative)

## After

- active functions: 560
- active compile-safe N/A/V placeholders: 0
- variants: 0
- active multiwords: 0
- certification metadata: 306 C1, 254 C2, 0 C6
- source-universe candidate records: 7,079, 0 unclassified
- Tosk evidence records: 242 lemma/category groups
- Tosk feature mapping rows: 280 = 207 exact, 54 ambiguous, 19 unmapped

## Validation performed here

- MAX static validator: 27/27 PASS
- Dict + MorphoDict combined static validator: PASS
- Dict static validator: PASS
- `MorphoSqi` heuristic lint: 0 findings
- Python compilation of new tools/validators: PASS
- deterministic double rebuild: PASS (identical generated hashes)

## Validation not performed here

No `gf` executable is installed in this environment. Consequently this report does **not** claim:

- a fresh GF 3.12 compile of the 560-entry candidate;
- native table signatures;
- 58/58 + 52/52 for the changed candidate;
- C5/C6 linguistic certification.

These are explicit external gates.

## Baseline/test migration

The former smoke scenario referenced `armë_N`, one of the 32 unresolved placeholder entries. The required scenario count remains 52, but the MorphoDict smoke case is migrated to active evidence-resolved entries and adds three MAX probes. This is a test migration required by removal of an unproved API entry and must be reconciled by C10 in the next Wordbench run.
