# GF Wordbench request — Conversation 6 nominal finalization

Run against the delivered repository root.

## Required toolchain

- GF 3.12
- GF Wordbench 1.3.4
- native `src/morphodict` discovery
- strict structural validation enabled

## Expected census

- 51 Albanian language targets
- 5 API facades
- 2 MorphoDict targets
- total 58 targets
- 52 scenarios

## Acceptance

1. 58/58 compile/strict accepted.
2. 52/52 scenarios OK.
3. No new structural lock warning.
4. No existing gold regression.
5. Preserve direct vs downstream failure classification.
6. Archive compiler version, resolved source path, effective GF path, target inventory, scenario inventory, raw logs, summary JSON/Markdown and artifact manifest.

## Nominal changes requiring special attention

- `Case` now includes grammatical `Gen`.
- lexical noun tables use `MorphCase`; `Gen` resolves to `MDat` only via `morphCase`/`nounForm`.
- `Noun.g` is `Number => Gender`.
- plural agreement preserves gender.
- `CN` is grammatical-case-aware via `CNoun`.
- lexical adjective morphology is Gender×Number with typed articulatedness.
- `link_clitic`/`nyje` is the single central *nyje* policy.
- five-case proper-name constructors exist in `ParadigmsSqi`.

A compiler or scenario failure must be reported as a blocker; do not normalize it away and do not replace a core form with a new placeholder.
