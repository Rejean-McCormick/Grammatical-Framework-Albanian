# MorphoDictSqi — complete current-source build — 2026-09-24

This package creates the **Albanian morphological dictionary only**. It does not create `DictSqi` and does not modify the active Albanian grammar modules.

## Scope

`MorphoDictSqiAbs.gf` and `MorphoDictSqi.gf` contain **592 lemgrams** across 18 GF categories.

Sources, in priority order:

1. the current validated Albanian RGL `LexiconSqi` and `IrregSqi`;
2. exact closed-class analyses from `StructuralSqi*`;
3. the supplied Tosk reference glossary, which provides observed form, POS/gender information and lemma.

The Albanian source snapshot contains `LexiconSqi.gf`, `MorphoSqi.gf`, `ParadigmsSqi.gf`, `IrregSqi.gf`, and the structural modules used here. The MorphoDict is added under the standard RGL-style `src/morphodict/` directory and leaves those modules untouched.

## MorphoDict policy

- one entry per **lemgram**, not per meaning;
- syntactic valency is collapsed (`V2/V3/VS/... -> V`, `N2/N3 -> N`, `A2/... -> A`);
- duplicate senses with the same morphology are deduplicated;
- multiword lemmas are excluded and listed in `EXCLUDED.csv`;
- all 22 current `IrregSqi` verbs are included using their exact existing paradigms;
- exact RGL analyses always override smart-generated reference entries;
- Tosk nouns use the reference gender where available (`mkNGender`);
- Tosk reference additions based on `mkN/mkA/mkV` are **candidate morphology**, not linguistic gold, until compiled and reviewed.

## Counts

Category counts:

- `N`: 277
- `A`: 84
- `V`: 129
- `Adv`: 26
- `Prep`: 20
- `PN`: 2
- `Interj`: 2
- `Conj`: 12
- `Subj`: 5
- `Det`: 6
- `IDet`: 1
- `IAdv`: 5
- `IP`: 4
- `NP`: 5
- `Pron`: 7
- `Quant`: 3
- `IQuant`: 1
- `Predet`: 3

Quality counts:

- `direct-invariant`: 23
- `direct-with-government`: 3
- `exact`: 367
- `exact-irregular`: 22
- `exact-normalized`: 10
- `rgl+reference-characteristic`: 11
- `smart-generated`: 155
- `rgl-derived-explicit`: 1

Excluded/logged source items: **21**. No exclusion is silent; see `EXCLUDED.csv`.

## Install / test

Copy the contents of `payload/` over the root of the Albanian repository. This adds only:

- `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf`
- `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf`
- bootstrap `.header` / `.config` files

Then compile from an RGL environment with GF 3.12, for example from `AlbanianSQI/GF/lib/src/morphodict`:

```text
gf -make MorphoDictSqi.gf
```

The local execution environment used to build this package does not contain the GF executable, so the deliverable is statically validated but must still receive a compiler run in your Wordbench environment.

## Files for ChatGPT/gold review

- `COVERAGE.csv`: every active lemgram, expression, source and confidence class.
- `TOSK_REFERENCE_LEMMAS.tsv`: normalized reference evidence and observed surface forms.
- `EXCLUDED.csv`: everything intentionally not activated and why.

The next validation pass should test generated paradigms against the observed Tosk forms, then promote reviewed entries from `smart-generated` to gold-certified status.

## 2026-09-25 compiler remediation

`cilido_A` no longer uses unsupported smart `mkA "cilido"`. Its inflection is derived from the existing declined `cili` IQuant table and the bound suffix `do`, preserving the attested masculine accusative singular `cilindo`.

### GF 3.12 scope remediation (run 20260925_030234)

The explicit `cilido_A` table is retained. `MorphoDictSqi` now explicitly opens `Prelude`, which supplies the `True` Boolean constructor used by the `Adj.clit` field. This fixes `constant not found: True` without changing the generated `cilido` forms.
