# Albanian Dict/MorphoDict correction — 2026-09-25

Built directly against the user-provided current snapshot `20260925-024342` and the failing Wordbench summary `20260925-024243`.

## Confirmed fixes

1. Dict legacy suffix/category mismatch fixed without renaming any of the 6720 functions.
2. `cilido_A` now derives all case/gender/number forms from the existing Albanian `cili` table and appends `do`; this directly accounts for the attested Tosk `cilindo`.
3. Dict/MorphoDict validation abstracts inherit their real abstract dictionaries.
4. Wordbench smoke scenarios import the validation concretes only and carry SHA locks for both abstract/concrete inputs.
5. The obsolete manual `morphodict` path part is removed for Wordbench 1.3.4 native companion discovery.

## Local validation

- Dict static validator: PASS
- MorphoDict static validator: PASS
- combined Dict+MorphoDict validator: PASS
- MorphoSqi heuristic lint: 0 findings
- smoke input SHA locks: PASS
- required scenarios: 52/52 present
- historical Wordbench source-lock: 54/54 unchanged

GF 3.12 is not installed in this execution environment, so final compile certification remains the next Wordbench run.
