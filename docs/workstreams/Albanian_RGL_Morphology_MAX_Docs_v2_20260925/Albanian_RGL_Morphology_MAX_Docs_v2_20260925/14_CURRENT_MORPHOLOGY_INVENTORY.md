# Inventaire CURRENT de la morphologie

## 1. But

Ce document donne la photographie calculée du cœur morphologique. Il doit être régénéré après toute modification de `MorphoSqi` ou de ses consumers.

## 2. Classes internes

| Catégorie | Classes | Avec guard `case` | Avec `error` explicite |
|---|---:|---:|---:|
| N | 563 | 336 | 334 |
| A | 36 | 23 | 23 |
| V | 135 | 119 | 118 |
| **Total** | **734** | **478** | **475** |

Toutes les classes ont actuellement une signature `Str -> N/A/V`. L'inventaire détaillé contient ligne source, guard, genre explicite éventuel, usages et hash du corps.

## 3. Encapsulation

Les références actives aux classes numérotées hors `MorphoSqi` se répartissent ainsi :

- `ParadigmsSqi`: 1165 mentions — **autorisé comme dispatcher interne** ;
- autres fichiers actifs: 3 mentions — **dette d'encapsulation à éliminer avant API stable**.

Les références hors `ParadigmsSqi` sont enregistrées dans `generated/NUMBERED_CLASS_REFERENCES.tsv`.

## 4. Baseline placeholders

| Helper | Mentions actives |
|---|---:|
| `invariantN` | 4233 |
| `invariantA` | 101 |
| `invariantV` | 2173 |

Ces nombres sont des **compteurs de mentions**, pas un nombre exact de lexèmes : ils incluent les définitions des helpers et éventuellement plusieurs occurrences par entrée. Le gate final se base sur les CASEs/lemgrammes reviewables, pas uniquement sur ces comptes textuels.

## 5. Dette structurelle observable

- 256 classes n'ont pas de `case` guard dans leur corps ; cela ne signifie pas qu'elles sont incorrectes, mais leur domaine doit être documenté ou garanti par un dispatcher plus haut.
- 259 classes n'ont pas de `error` local explicite ; même réserve.
- la surface publique `mkN/mkA/mkV` est beaucoup plus petite que l'espace de classes internes ; le chantier principal est donc **classification + principal parts + guards**, pas multiplication des IDs.

## 6. Artefacts autoritatifs dérivés

- `generated/MORPHOLOGY_CLASSES.tsv`
- `generated/MORPHOLOGY_CLASSES.json`
- `generated/NUMBERED_CLASS_REFERENCES.tsv`
- `generated/PLACEHOLDER_BASELINE.tsv`

Ne jamais éditer ces fichiers à la main.
