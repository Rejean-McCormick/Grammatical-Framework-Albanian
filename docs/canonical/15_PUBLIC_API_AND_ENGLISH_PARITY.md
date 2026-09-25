# API publique et parité English/common RGL

## Surfaces à fermer

- common Structural ;
- Construction ;
- Extend ;
- Extra compatibility + extensions albanaises justifiées ;
- `GrammarSqi`, `LangSqi`, `AllSqi` ;
- `SyntaxSqi`, `ConstructorsSqi`, `CombinatorsSqi`, `TrySqi`, `SymbolicSqi` ;
- `DocumentationSqi`, `SymbolSqi`, `MarkupSqi` ;
- revue explicite des surfaces English-only/tooling comme `BrowseSqi`.

## Politique de statut

Pour chaque row common RGL final : `implemented` ou `equivalent`. Une distinction absente en albanais peut être documentée comme neutralisation dans la rationale, mais la fonction concrète requise n'est pas omise.

`linguistically_not_applicable` est utilisé pour une capacité/phénomène de comparaison, pas comme prétexte pour laisser un abstract function sans concrete implementation.

## BrowseSqi

Décision optimale : **out of core release scope** sauf si l'upstream common API/packaging du source-lock l'exige. Il peut être livré comme tooling optionnel sans bloquer la parité linguistique.

## English benchmark

English définit la profondeur et l'ergonomie attendues ; les sorties Albanian restent déterminées par les références Albanian et les contrats common RGL.
