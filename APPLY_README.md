# Albanian correction overlay v2 — 2026-09-25

Apply this overlay on top of `Albanian_CORRECTED_20260925` (the version used for Wordbench run `20260925_030234`).

It fixes the two remaining direct compiler failures from that run:

1. Albanet-only unreviewed V entries no longer call smart `mkV`; they use `invariantV` until principal parts are reviewed.
2. `MorphoDictSqi` explicitly opens `Prelude`, so `cilido_A` can use `clit = True`.

No historical Albanian core GF source is changed. Re-run GF Wordbench 1.3.4; target: 58/58 files and 52/52 scenarios.
