# Dict/MorphoDict Wordbench integration update — 2026-09-24

## Changes

- Kept the established Albanian source root unchanged.
- Added `morphodict` to `[gf].path_parts`.
- Added `DictSqi.gf` to module entrypoints and checkpoints.
- Added required scenarios:
  - `alb-dict-smoke`
  - `alb-morphodict-smoke`
- Added two SHA-locked GF marker inputs used by those scenarios.
- Updated validation documentation.

## Why the source root was not broadened

The existing 50-scenario campaign imports Albanian modules by basename and
relies on the Albanian language directory being on GF's search path. Moving the
source root up to `.../src` would make that resolution less stable. The sibling
MorphoDict directory is therefore added as a GF path requirement instead.

## Gold policy

No new `.gold` files are created by this update. The lexical scenarios first
produce reviewable Wordbench output. Golds are promoted only after linguistic
review (including ChatGPT review against the Albanian references).

## Verification performed here

- Wordbench project schema parsing: PASS.
- Project invariants: PASS.
- Scenario catalog construction: PASS, 52 scenarios.
- New scenario input SHA locks: PASS.
- Dict static validation: PASS.
- MorphoDict static validation: PASS.
- Combined Dict + MorphoDict static validation: PASS.
- MorphoSqi heuristic lint: 0 findings.
- GF source files changed by this update: 0.

The current execution environment does not provide a `gf` executable, so the
new 52-scenario profile is prepared for the user's GF 3.12 Wordbench run rather
than claimed as freshly compiler-certified here.

## Expected next Wordbench shape

- Direct source census: existing Albanian sources plus `DictSqi.gf` and
  `DictSqiAbs.gf` (56 targets in the same global-census pattern as the prior 54).
- Required scenarios: 52.
- `alb-morphodict-smoke` imports `MorphoDictSqi.gf`; therefore a MorphoDict
  compile/load failure is a blocking scenario failure even though the canonical
  MorphoDict files remain in the sibling `src/morphodict` directory.
