# Wordbench follow-up fix — run 20260925_030234

## Evidence from GF 3.12

The run reached 58 targets: 56 OK, 2 failed. The 50 historical scenarios remained OK.

### DictSqi
The summary labelled the failure ambiguously as `Voc`, but raw compiler evidence identifies the real direct failure at `DictSqi.gf:4503`: `aftesi_mendore_V = mkV "aftësi mendore"` raised `Predef.error: Cannot find an inflection rule`.

Remediation: all 2141 Albanet-only `imported_unreviewed` V entries now use `invariantV`, defined through the explicit 9-form `irregV` constructor. The 33 baseline `LexiconSqi` V entries remain exact aliases; known `IrregSqi` realizations remain explicit. This is compile-safe scaffolding, not gold morphology.

### MorphoDictSqi
The direct failure was `cilido_A`: `constant not found: True`. The declined `cili + do` implementation is retained unchanged; `Prelude` is now explicitly opened so the Boolean constructor used by `Adj.clit` is in scope.

### Smoke scenarios
Both dictionary scenarios already load typed validation grammars. Their `empty grammar` messages were cascading consequences of the parent dictionary compile failures. No scenario redesign is needed for this follow-up.

## Preservation

No historical Albanian core GF module is changed by this follow-up. Changes are limited to DictSqi/MorphoDictSqi plus their generator, validation and documentation support files.

## Local checks

- Dict static validator: PASS
- MorphoDict static validator: PASS
- combined Dict + MorphoDict validator: PASS
- MorphoSqi lint: 0 findings
- next external GF 3.12 target: 58/58 files and 52/52 scenarios
