# Consolidation report — Albanian GF — 2026-09-24

## Goal

Consolidate the full Albanian snapshot and the DRAFT-MAX checkpoints without losing important code and without activating an incompletely propagated type-system refactor.

## Baseline preservation result

- Baseline files: **241**
- Baseline files still present: **241 / 241**
- Baseline files deleted: **0**
- Active baseline files modified: **1**
- Validation files preserved byte-for-byte: **154 / 154**
- DRAFT-MAX checkpoint 1 files preserved byte-for-byte: **15 / 15**
- DRAFT-MAX checkpoint 2 files preserved byte-for-byte: **19 / 19**

The only active source modification is `LexiconSqi.gf`.

## Safe compiler-driven fix

The supplied GF Wordbench run (`20260924_181733`, GF 3.12) reported exactly one direct compile blocker:

`LexiconSqi.gf` — `constant not found: Dat`

The four V3 entries using `mkPrep [] Dat` were changed to use the already exported `ParadigmsSqi.dative` alias:

- `add_V3`
- `give_V3`
- `sell_V3`
- `send_V3`

No lexical entry, constructor, paradigm, module or validation scenario was removed.

## Why checkpoint 2 is preserved but not activated

Checkpoint 2 contains valuable work, but activating its ten-file overlay over the full snapshot introduces unpropagated contract changes. Previous integration analysis found consumers still expecting the older forms of `VP`, `Verb`, `Case` and `Noun.g`.

Instead of rolling those advances back or deleting them, the complete checkpoint sources and their patches are kept under `development/draftmax/checkpoint2/`. Checkpoint 1 is likewise retained under `development/draftmax/checkpoint1/`.

This gives a stable recovery point: future propagation can be performed against a complete tree while every experimental implementation remains available for selective reintegration.

## Regression checks performed

1. Hash comparison against the full snapshot: all 241 baseline paths remain present.
2. Hash comparison of `validation/`: all 154 files unchanged.
3. Hash comparison of preserved checkpoint directories: byte-for-byte identical to the original checkpoint material.
4. Active diff inspection: only four token-level replacements in `LexiconSqi.gf`.
5. `gf_morphosqi_lint.py`: **0 findings**.
6. Static check: no remaining `mkPrep [] Dat` in `LexiconSqi.gf`; four `mkPrep [] dative` occurrences present.

## What this build intentionally does not claim

- It does not claim fresh `gf -make` certification because no GF executable is installed in this execution environment.
- It does not activate the checkpoint-2 typed clitic/voice refactor yet.
- It does not claim linguistic certification for the 50 scenarios; the supplied Wordbench run was blocked before reviewable scenario output.

## Recommended next step

Run GF Wordbench against this consolidated archive. The resulting bug report should be treated as authoritative evidence for the next repair pass. Structural DRAFT-MAX features can then be reintegrated incrementally, with compile checks after each contract propagation rather than as a ten-file overlay.
