# MorphoDictSqi build report — 2026-09-24

## Result

- Active MorphoDict lemgrams: **592**
- Categories: **18**
- Current RGL Lexicon source entries accounted: **348/348**
- Current IrregSqi verbs included: **22/22**
- Tosk unique lemma/POS groups inspected: **242**
- Source items excluded/superseded with an explicit reason: **21**
- `variants` used: **0**
- Active Albanian core files modified: **0**

## Category coverage

- `A`: 84
- `Adv`: 26
- `Conj`: 12
- `Det`: 6
- `IAdv`: 5
- `IDet`: 1
- `IP`: 4
- `IQuant`: 1
- `Interj`: 2
- `N`: 277
- `NP`: 5
- `PN`: 2
- `Predet`: 3
- `Prep`: 20
- `Pron`: 7
- `Quant`: 3
- `Subj`: 5
- `V`: 129

## Quality classes

- `exact`: 367
- `smart-generated`: 155
- `rgl-derived-explicit`: 1
- `exact-normalized`: 10
- `direct-invariant`: 23
- `rgl+reference-characteristic`: 11
- `direct-with-government`: 3
- `exact-irregular`: 22

`exact` / `exact-irregular` entries preserve current RGL analyses. `rgl+reference-characteristic` entries keep the RGL lemma while adding a characteristic Tosk form or gender. `smart-generated` entries are new Tosk-reference expansions produced through Albanian smart paradigms and still require compile + linguistic/gold review.

## Important boundary

“Complete” here means complete for the **morphological inventory recoverable from the supplied/current Albanian RGL plus the supplied Tosk reference**, under MorphoDict rules. It is not a claim to contain every word in the Albanian language. A national-scale lexical source would be needed for tens of thousands of lemmas.

## Compiler status

The current execution environment has no `gf` executable. Static checks pass, but `gf -make MorphoDictSqi.gf` must be run in the user's GF 3.12 / Wordbench environment before compile certification.

## 2026-09-25 compiler remediation

`cilido_A` no longer uses unsupported smart `mkA "cilido"`. Its inflection is derived from the existing declined `cili` IQuant table and the bound suffix `do`, preserving the attested masculine accusative singular `cilindo`.

### GF 3.12 scope remediation (run 20260925_030234)

The explicit `cilido_A` table is retained. `MorphoDictSqi` now explicitly opens `Prelude`, which supplies the `True` Boolean constructor used by the `Adj.clit` field. This fixes `constant not found: True` without changing the generated `cilido` forms.
