# C9 MAX final verification — 2026-09-25

Candidate scope: Structural / Extend / Extra / public API / Documentation / Symbol / Markup.

## Source-level status

- GF source census present: 51 language + 5 API facades + 2 MorphoDict = 58 expected targets.
- C9 parity register: no tracked `missing` or `partial` source-level rows.
- DictSqi and MorphoDictSqi remain outside C9 code changes.
- Protected required scenario registry remains 52.

## Validation completed in the construction environment

- `validation/c9/static_validate_c9.py`: 144/144 PASS.
- Dict + MorphoDict unified static validation: PASS.
- MorphoSqi heuristic lint: 0 findings.
- Python compileall for C9/tooling scripts: PASS.
- GF Wordbench 1.3.4 language probe against the supplied full RGL root: PASS.
- GF Wordbench 1.3.4 strict project contract check: PASS, 0 errors, 0 warnings.
- GF Wordbench 1.3.4 strict scenario-contract check in a faithful full-RGL staging overlay: PASS, 0 errors, 0 warnings.
- Required Wordbench active-project documentation is embedded in the source snapshot and passes the strict project check.

## Gate that cannot be completed here

The `gf` executable is not installed in the execution environment. Therefore the following remain intentionally unclaimed:

- exact-current GF 3.12 compilation;
- complete Wordbench release-mode census execution;
- execution of the 52 protected scenarios;
- execution of the three additive C9 smoke groups;
- gold regression comparison and promotion;
- linguistic certification of output-affecting behavior.

No historical green result is promoted onto this new source lock.

## Promotion rule

Promote this candidate to structurally certified only after GF 3.12 + Wordbench 1.3.4 run on the exact delivered tree returns the expected full census, 52/52 protected scenarios, all C9 smokes, no blocking type/lock diagnostics, and reconciled regression evidence. Linguistic certification remains a separate evidence/gold gate.
