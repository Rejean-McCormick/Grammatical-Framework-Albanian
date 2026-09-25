# Lexical Debt and Promotion Ledger — DictSqi / MorphoDictSqi
> **Document version**: 2.0  
> **Document status**: GENERATED BASELINE + NORMATIVE PROMOTION RULES  
## 1. Baseline lexicale du snapshot

### DictSqi — 6,720 fonctions

| `validation_status` | Count |
|---|---:|
| `imported_unreviewed` | 6,339 |
| `baseline_lexicon_exact` | 337 |
| `reference_attested_unreviewed` | 44 |

Catégories principales:

- `N`: 4,310
- `V`: 2,174
- `A`: 108
- `V2`: 50
- `Adv`: 19
- `Conj`: 16
- `Prep`: 12
- `V3`: 5
- `VS`: 4
- `N2`: 3
- `Interj`: 2
- `Ord`: 2

Appels compile-safe visibles dans `DictSqi.gf`: `invariantN` 4,135, `invariantA` 65, `invariantV` 2,142. Les occurrences incluent la définition helper elle-même; les counts de provenance, pas les appels textuels, sont l’autorité pour le statut lexical.

### MorphoDictSqi — 592 lemgrammes

| `quality` | Count |
|---|---:|
| `exact` | 367 |
| `compile-safe-placeholder` | 155 |
| `direct-invariant` | 23 |
| `exact-irregular` | 22 |
| `rgl+reference-characteristic` | 11 |
| `exact-normalized` | 10 |
| `direct-with-government` | 3 |
| `rgl-derived-explicit` | 1 |

La dette explicite `compile-safe-placeholder` est de **155 / 592** au snapshot verrouillé. Appels visibles: `invariantN` 98, `invariantA` 36, `invariantV` 27.

## 2. Règle de promotion

### DictSqi

`imported_unreviewed` ne devient pas « linguistiquement validé » parce qu’un nouveau smart paradigm compile. Promotion minimale:

`imported_unreviewed → category/valence reviewed → paradigm selected with evidence → scenario/review → certified lexical entry`.

Dict conserve **sens + catégorie/valence**. Une amélioration purement flexionnelle ne doit pas transformer Dict en MorphoDict.

### MorphoDictSqi

`compile-safe-placeholder → attested lemma/form evidence → explicit/productive ParadigmsSqi constructor → full inflection table review → certified morpho lemgram`.

Contraintes permanentes: un lemgramme par table flexionnelle; pas de sens/subcatégorie; pas de `variants`; pas de multiword sauf justification morphologique exceptionnelle.

## 3. Debt-burn linkage avec le core

| Core stage | Dette qui peut être réduite | Condition de promotion |
|---|---|---|
| N2 | noms ambigénériques | genre sg/pl prouvé + tests accord |
| N3 | placeholders N | classe/principal parts certifiés + 20 cellules |
| N5 | placeholders A | classe articulée/non-articulée + formes G×N certifiées |
| N6 | function words/possessives | paradigme structurel revu; ne pas dupliquer le rôle de StructuralSqi |
| N7 | Ord | preuve Standard pour ordinaux |
| N8 | PN/Names | règles de cas prouvées |

## 4. Métriques de livraison

Chaque handoff nominal doit reporter:

- `MorphoDict compile-safe-placeholder before/after`;
- `Dict imported_unreviewed before/after` si le patch touche Dict;
- nombre de placeholders **ajoutés** (cible: 0);
- nombre de promotions soutenues par Evidence IDs;
- toute régression vers un helper invariant.

Le succès du chantier n’est pas « zéro placeholder à tout prix ». Une entrée reste explicitement non certifiée tant que le core ou la preuve ne permettent pas une promotion honnête.
