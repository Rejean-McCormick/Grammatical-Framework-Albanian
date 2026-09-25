# Apply — Conversation 6 nominal finalization

Baseline: `albanian-s02-green-20260925` (local commit `963b925`).
Final source commit: `012383aa7f50c8637f26c22a09d6603d5e672a37`.

## Preferred application

Apply the full patch from the exact baseline:

`Conversation6_Nominal_Finalization.patch`

or copy the contents of `overlay/` over the baseline tree, preserving paths.

## Mandatory validation after application

1. Run `python validation/nominal/static_validate_nominal_architecture.py`.
2. Run `python validation/lexicon/static_validate_dict_and_morphodict.py`.
3. Run `python validation/morphodict/static_validate_morphodict.py`.
4. Run `python gf_morphosqi_lint.py AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf`.
5. Execute the GF 3.12 / Wordbench 1.3.4 request in `evidence/WORD_BENCH_REQUEST.md`.

Do not claim 58/58 or 52/52 execution success from this package alone: the current build environment did not contain GF/Wordbench executables.
