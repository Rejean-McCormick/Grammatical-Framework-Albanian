# Wordbench final certification request — Conversation 4

Environment target:

- GF 3.12
- GF Wordbench 1.3.4
- strict diagnostic Global Scan
- expected compile census: 58 = 51 language + 5 API facades + 2 MorphoDict
- protected required scenarios: 52
- registered optional scenario: `alb-verb-advanced`
- advanced matrix: 98 cases

The advanced scenario is registered in `project.toml` as **optional**. It does not change the 52-scenario baseline gate.

Canonical CLI shape (fill the two machine-specific paths):

```powershell
gf-wordbench validate `
  --mode diagnostic `
  --strict `
  --project-root . `
  --gf-exe "C:\path\to\gf.exe" `
  --rgl-root "C:\path\to\gf-rgl" `
  --scenario alb-verb-advanced `
  --keep-ok-details `
  --verbose
```

Acceptance sequence:

1. Confirm **58/58** strict compile acceptance.
2. Confirm **52/52** required baseline scenarios remain OK.
3. Confirm optional `alb-verb-advanced` executes completely (`GF_WORDBENCH_BEGIN/END cases`).
4. Preserve raw stdout/stderr and the run source lock.
5. Compare its 98 cells with `validation/verbal_advanced/VERBAL_MATRIX_EXPECTATIONS.tsv`.
6. Do not promote `linguistic-review-required` rows to gold without review.
7. Any GF compiler failure outranks all static validation in this delivery.
