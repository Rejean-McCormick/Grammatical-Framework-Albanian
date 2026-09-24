# Albanian GF — Consolidated preservation build (2026-09-24)

This package consolidates the current Albanian RGL work while prioritizing preservation of the last full snapshot that has compiler evidence.

## Active code policy

The active project tree is the full `20260924-181818` snapshot. Every original file is preserved. Only one active source file is changed:

- `AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf`
  - four occurrences of `mkPrep [] Dat` were changed to `mkPrep [] dative`.
  - this directly addresses the sole direct GF 3.12 compiler failure reported by Wordbench (`constant not found: Dat`).

No DRAFT-MAX structural refactor is activated in this build because checkpoint 2 changes central contracts (`Case`, `Noun.g`, `Verb`, `VP`) and was not yet propagated through every consumer in the full snapshot.

## Preservation of DRAFT-MAX work

Nothing from checkpoints 1 or 2 is discarded. Exact copies are stored outside the active GF source path:

- `development/draftmax/checkpoint1/`
- `development/draftmax/checkpoint2/`

This preserves the work on explicit Genitive, gender-sensitive plural agreement, declined `cili`, coordination agreement, typed `CliticCluster`, clitic fusion, voice state and `kam/jam` perfect auxiliaries without destabilizing the currently compiling modules.

## Evidence and audit material

See `docs/consolidation/` for:

- `CONSOLIDATION_REPORT.md`
- `ACTIVE_CHANGES.patch`
- `REGRESSION_AUDIT_checkpoint2_vs_snapshot.md`
- `BUGREPORT_20260924_181733_SUMMARY.md`
- `MORPHOSQI_LINT.txt`
- `STATIC_SANITY.txt`
- SHA-256 manifests

## Validation state

The current environment does not contain the GF executable, so this package is not claimed as freshly compile-certified here. The supplied Wordbench report for the base snapshot showed 50/54 files compiling, with one direct failure in `LexiconSqi.gf` and three downstream failures. This consolidated build applies only the local fix for that direct failure and leaves the rest of the compiled source intact.

Run the next GF Wordbench audit against this complete package and use that report as the next repair input.
