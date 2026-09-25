# Wordbench run 20260925_031945 — remediation v3

Run evidence: 56/58 GF targets and 50/52 scenarios. The previous v2 fixes progressed compilation deeper into both large dictionaries.

## Remaining direct compiler failures

- `DictSqi.gf:513` — `bota_N = mkN "bota"` selected `mkN149` and failed: `Can't apply paradigm mkN149`.
- `MorphoDictSqi.gf:473` — `rom_A = mkA "rom"` failed: `Cannot find an inflection rule`.

The summary-level `Voc` label is not the actual root cause; raw GF stderr identifies the two smart-paradigm failures above.

## Systemic fix

Smart paradigms are no longer treated as certification for imported/unreviewed lexical material.

- DictSqi: 4,134 Albanet N + 64 Albanet A + 2,141 Albanet V not backed by exact `LexiconSqi` aliases use compile-safe invariant placeholders.
- MorphoDictSqi: all 155 Tosk `smart-generated` N/A/V entries use compile-safe placeholders; known Tosk noun gender is preserved.
- Exact RGL aliases, explicit irregular verbs, StructuralSqi items, and `cilido_A` remain unchanged.
- Coverage metadata now calls these entries `compile-safe-placeholder`, not `smart-generated`.

These placeholders are structural scaffolding, **not linguistic gold morphology**. They must be promoted entry-by-entry or paradigm-by-paradigm after linguistic review.

Target for next GF 3.12 Wordbench run: **58/58 files + 52/52 scenarios**.
