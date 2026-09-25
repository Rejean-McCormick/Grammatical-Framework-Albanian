# LexiconSqi et DictSqi

## Responsabilités

- `LexiconSqi` : petit lexique canonique couvrant l'abstract Lexicon commun ;
- `DictSqi` : grand lexique, identité/sens/catégorie/valence/gouvernement/provenance ;
- aucune table morphologique inventée ici si le core peut fournir un paradigme.

## Baseline observée dans le workstream

- `LexiconSqi`: 348 fonctions required par l'abstract fourni ;
- `DictSqi`: 6 720 entrées ;
- 337 `baseline_lexicon_exact` ;
- 6 339 `imported_unreviewed` ;
- 44 `reference_attested_unreviewed` ;
- 1 830 multiwords signalés ;
- 4 134 N + 64 A + 2 141 V importés non revus passent actuellement par helpers invariants compile-safe.

Ces nombres sont des faits de baseline, pas des mesures de maturité linguistique.

## Cible

- générateur repo-relative ;
- schéma canonique versionné ;
- identity/sense/homonymy explicites ;
- normalisation non destructive ;
- valence et government soutenus par preuve ;
- couverture de toutes les catégories de référence avec verdict ;
- QA sampling/adjudication automatisable ;
- IDs stables et migrations publiées ;
- performance mesurée ;
- **aucun placeholder non analysé dans le Dict certifié final**.

## English benchmark

Le `DictEngAbs` fourni (~64.9k fonctions) donne une échelle de profondeur, pas un quota. La couverture finale est guidée par utilité, fréquence, catégories, sources et qualité de preuve.
