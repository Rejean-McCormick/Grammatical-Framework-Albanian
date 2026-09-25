# DictSqi complete checkpoint — 2026-09-24

## Result

Adds a large **Albanian `DictSqi` / `DictSqiAbs`** while preserving the previously green Albanian core byte-for-byte.

- total distinct dictionary functions: **6720**
- Albanet/OMW lemma+POS pairs retained: **6489 / 6489**
- Tosk functional entries retained: **46 / 46**
- distinct baseline `LexiconSqi` lemma+category pairs incorporated: **337**
- exact entries realized by aliasing the validated baseline `LexiconSqi`: **337**
- richer LexiconSqi category pairs added beyond Albanet N/A/V coverage: **187**
- MorphoDict: **not created**

## Source category-label coverage

Legacy Lexicon suffix labels remain in function IDs/provenance, while GF declaration types are normalized: `A2V→A2`, `AS→A`, `AV→A`, `V0→V`.

| Category | Count |
|---|---:|
| A | 108 |
| A2 | 1 |
| A2V | 1 |
| AS | 1 |
| AV | 1 |
| Adv | 19 |
| Conj | 16 |
| Interj | 2 |
| N | 4310 |
| N2 | 3 |
| N3 | 1 |
| Ord | 2 |
| PN | 2 |
| Prep | 12 |
| V | 2174 |
| V0 | 1 |
| V2 | 50 |
| V2A | 1 |
| V2Q | 1 |
| V2S | 1 |
| V2V | 1 |
| V3 | 5 |
| VA | 1 |
| VQ | 2 |
| VS | 4 |

## Quality model

`baseline_lexicon_exact` reuses the exact linearization already present in the green `LexiconSqi`.

`imported_unreviewed` is attested by Albanet but currently uses a smart paradigm (`mkN`, `mkA`, or `mkV`) and must be reviewed before gold promotion.

`reference_attested_unreviewed` covers functional words extracted from the supplied Tosk glossary.

The source contains **1830 multiword Albanet entries**. They are retained for source completeness but are a high-priority review queue.

## Preservation

- baseline files missing: **0**
- baseline files changed: **0**
- core baseline preserved byte-for-byte: **YES**
- `DictSqiAbs.gf` and `DictSqi.gf` are additive and not wired into `GrammarSqi`, `AllSqi`, or `LangSqi`.

## Compilation boundary

This environment has no GF executable. Static inventory, delimiter, alias-reference and preservation checks pass, but `gf -make DictSqi.gf` must be run by Wordbench/GF 3.12 before compile certification.

## Gold boundary

This dictionary is **source-complete for the imported Albanet inventory**, not gold-complete. Gold promotion should happen entry families at a time after generation/analysis review.

## Compiler remediation 2026-09-25 (run 20260925_030234)

GF 3.12 reached the first Albanet-only V at `aftesi_mendore_V` and rejected smart `mkV` with `Predef.error: Cannot find an inflection rule`. All **2141 `imported_unreviewed` V entries** now use the compile-safe `invariantV` fallback. Exact baseline `LexiconSqi` aliases and explicit `IrregSqi` realizations remain unchanged. This is a structural fallback, **not linguistic gold**; reviewed principal parts should progressively replace it.
