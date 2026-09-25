# Source lock et matrice de preuves

## 1. Statut du verrouillage

**État : `source_lock = incomplete_repository / usable_morphology_core`**.

Le ZIP Albanian disponible dans l'environnement est exploitable pour les quatre fichiers du cœur morphologique, mais le couple archive/index fourni présente des différences ailleurs dans le dépôt (notamment autour des dictionnaires dans les inventaires observés). Par conséquent :

- les décisions locales sur `ResSqi`, `MorphoSqi`, `ParadigmsSqi`, `IrregSqi` peuvent être ancrées sur les hashes ci-dessous ;
- une affirmation de certification du **dépôt entier** exige un nouveau source-lock cohérent avec le tag `albanian-s02-green-20260925` et le run Wordbench correspondant ;
- aucun résultat GF n'est produit dans cet environnement, car l'exécutable `gf` n'y est pas installé.

## 2. Archives fournies

| Source | SHA-256 | Usage |
|---|---|---|
| Albanian snapshot | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` | source cible courant disponible |
| GF RGL AI Compendium | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` | workflow, contrats, patterns, gates |
| GF Wordbench | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` | outil de validation |
| `gf-rgl-master.zip` | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` | baseline RGL complète / modèles / abstract/API |
| Albanian linguistic references | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` | évidence linguistique cible |

## 3. Hashes du cœur morphologique courant

| Fichier | Octets | SHA-256 |
|---|---:|---|
| `AlbanianSQI/GF/lib/src/albanian/ResSqi.gf` | 14477 | `0ce1f35dcedb68d6084d30e781d013b5aa1376526095d7659f5b640ce8e23727` |
| `AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf` | 1074832 | `729706f857ae4b3e31934b218ffb775d2b2386618b5e5ddf3b822edda8702a42` |
| `AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf` | 54260 | `b65f668abd6dc093d5a3eb58ed4eeb44917aa0f4ee97560775f3e4090811cc51` |
| `AlbanianSQI/GF/lib/src/albanian/IrregSqi.gf` | 10602 | `f96cfc6aa0a8c7719f44c4ab2e5ef62969c14154b199e0c79403b8ba1dd4aa05` |

Ces quatre hashes constituent le verrou minimal de Conversation 1. Toute livraison de code doit indiquer si elle part exactement de ces hashes ou d'une révision ultérieure.

## 4. Références linguistiques albanaises fournies

L'archive `Albanian_ref(4).zip` contient :

- `Albanian_Complete_Grammar.html` ;
- cinq leçons avec analyse grammaticale, dont les leçons 1–3 Tosk et 4–5 Geg ;
- `Tosk_Dictionary_Master.html` ;
- `Tosk_Glossary_Master.html` ;
- `Geg_Glossary_Master.html` ;
- `Albanian.pdf`.

### Faits déjà utilisables comme évidence

Les pages HTML fournies soutiennent notamment les observations suivantes :

- système nominal riche en cas, nombre et définitude ;
- cinq cas décrits : nominatif, accusatif, datif, génitif, ablatif ;
- datif et génitif décrits comme morphologiquement identiques, avec distinction du génitif liée au **nyje** ;
- article défini postposé ;
- système de genre décrit comme masculin, féminin et neutre, avec statut du neutre signalé comme disputé ;
- système verbal comportant des formes synthétiques et analytiques ;
- importance des systèmes du présent et de l'aoriste, avec un système participial utile pour plusieurs formes ;
- subjonctif, imparfait, optatif, admiratif, participes et non-actif sont attestés dans les matériaux ;
- les glossaires attestent des entrées étiquetées `ambigeneric`, mais la généralisation exacte vers le standard moderne doit être établie avant modification du type `Gender`.

### Limite de cette passe documentaire

Le PDF a été catalogué mais n'est **pas encore promu comme preuve extraite** dans ce dossier. Les décisions devront citer l'endroit précis d'une référence lorsqu'elles deviennent implémentatoires.

## 5. Sources RGL et modèles

### Benchmark d'API

English RGL fournit une API `ParadigmsEng` en échelle : `mkN`, `mkN2`, `mkN3`, `mkPN`, `mkA`, `mkA2`, `mkV`, `mkV2`, `mkV3`, catégories de compléments et constructeurs plus explicites. L'objectif est de reproduire ce **niveau d'ergonomie et de couverture**, pas la morphologie anglaise.

### Modèles typologiques prioritaires

- Greek, Macedonian, Bulgarian, Romanian, Italian : comparaison principale pour phénomènes balkaniques/romans pertinents.
- Finnish, German : architectures de cas et principal parts lorsque la structure le justifie.
- English : conventions d'API, surface RGL, compatibilité et maturité.

Un modèle étranger ne peut jamais établir une forme albanaise.

## 6. Compendium — règles applicables

Le workflow morphologique du Compendium impose :

- inventorier les dimensions avant de coder ;
- choisir une représentation qui conserve les décisions jusqu'au bon consommateur ;
- définir le domaine des smart paradigms ;
- définir un escape hatch explicite pour les irréguliers ;
- tester une forme régulière canonique, une boundary form, une alternance orthographique, un fallback irrégulier et un input invalide ;
- tester chaque overload public de `ParadigmsSqi` ;
- ne jamais promouvoir la sortie du générateur au rang de gold sans revue.

## 7. Preuve requise pour une décision durable

Toute décision `ACCEPTED` doit porter au minimum :

```text
DECISION-ID
source-lock
catégorie concernée
fait linguistique
référence(s) albanaise(s)
état actuel du code
représentation choisie
alternatives rejetées
tests GF ciblés
gate Wordbench
effet sur DictSqi/MorphoDictSqi
```


## 8. Snapshot fact table v2

Facts calculés sur les quatre fichiers verrouillés :

- `MorphoSqi`: 734 constructeurs numérotés (563 N, 36 A, 135 V).
- Guards `case`: N=336, A=23, V=119.
- `error` explicite: N=334, A=23, V=118.
- Les fichiers de détail sont `generated/MORPHOLOGY_CLASSES.tsv/json`.
- Les mentions des symboles de `ResSqi` sont dans `generated/RES_SYMBOL_MENTIONS.tsv`.

Ces artefacts sont des faits dérivés du snapshot, pas des décisions linguistiques.
