# Morphology MAX targeted GF probes

These probes are additive and intentionally live outside `validation/scenarios/`.
They do **not** change the stable Wordbench requirement of 52/52 scenarios.

- `morphology-max-positive.gfs`: must import and linearize all MX001–MX020.
- `morphology-max-negative.gfs`: six deliberate principal-part mismatches; each
  `l BAD_*` must fail with an explicit `ParadigmsSqi` guard error.

Run them with GF 3.12 using the same GF path as Wordbench. Their purpose is to
exercise the new morphology contracts before the full 58/58 + 52/52 rerun.
