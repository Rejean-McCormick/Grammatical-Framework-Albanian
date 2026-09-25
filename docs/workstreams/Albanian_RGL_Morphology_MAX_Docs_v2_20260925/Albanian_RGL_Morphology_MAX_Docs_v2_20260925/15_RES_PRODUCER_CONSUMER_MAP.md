# `ResSqi` producer / consumer map

## 1. Purpose

Toute modification d'un type central exige une carte d'impact. Les counts ci-dessous sont des mentions lexicales dans les `.gf` actifs du snapshot ; ils servent à localiser les consumers, pas à prouver le sens de chaque usage.

## 2. Ownership primaire

| Contrat | Owner | Consumers à auditer en priorité |
|---|---|---|
| `Species` / `Indef` / `Def` | `ResSqi` | `ResSqi.gf` (6)<br>`CatSqi.gf` (3)<br>`ConjunctionSqi.gf` (2)<br>`ExtendSqiHelpers.gf` (1) |
| `Case` / `Nom Acc Dat Ablat` | `ResSqi` | `CatSqi.gf` (16)<br>`ResSqi.gf` (13)<br>`ParadigmsSqi.gf` (9)<br>`ConjunctionSqi.gf` (4)<br>`NounSqi.gf` (4)<br>`SymbolSqi.gf` (3) |
| `Gender` / `Masc Fem` | `ResSqi` | `ResSqi.gf` (12)<br>`ParadigmsSqi.gf` (11)<br>`CatSqi.gf` (9)<br>`ExtendSqiHelpers.gf` (4)<br>`ConjunctionSqi.gf` (3)<br>`ConstructionSqi.gf` (3) |
| `GenNum` / `Agr` | `ResSqi` | `ExtendSqi.gf` (15)<br>`ResSqi.gf` (13)<br>`ClauseSqiRes.gf` (10)<br>`ExtendSqiVPS.gf` (9)<br>`CatSqi.gf` (8)<br>`ExtraSqi.gf` (6) |
| `Noun` | `ResSqi` record; `MorphoSqi` producers | `CatSqi.gf` (4)<br>`ResSqi.gf` (2)<br>`ConstructionSqi.gf` (1)<br>`NounSqi.gf` (1) |
| `Adj` | `ResSqi` record; `MorphoSqi` producers | `CatSqi.gf` (2)<br>`ResSqi.gf` (2)<br>`AdverbSqi.gf` (1)<br>`NounSqi.gf` (1) |
| `Tense` | `ResSqi` | `ResSqi.gf` (8)<br>`CatSqi.gf` (4)<br>`ClauseSqiRes.gf` (3)<br>`ExtendSqiScaffolding.gf` (2)<br>`TenseSqi.gf` (2)<br>`ExtraSqi.gf` (1) |
| `Verb` | `ResSqi` record; `MorphoSqi`/`ParadigmsSqi` producers | `VerbSqi.gf` (13)<br>`ConstructionSqi.gf` (7)<br>`ResSqi.gf` (4)<br>`CatSqi.gf` (3)<br>`ExtendSqiVPBridge.gf` (3)<br>`ClauseSqiRes.gf` (1) |
| `VP` / `VPSlash` | `ResSqi` shared representation | `ExtendSqi.gf` (30)<br>`ClauseSqiRes.gf` (17)<br>`ExtendSqiScaffolding.gf` (14)<br>`ExtendSqiVPBridge.gf` (10)<br>`ExtraSqi.gf` (10)<br>`VerbSqi.gf` (10) |
| `Compl` / `Prep` | `ResSqi` government | `StructuralSqiClause.gf` (21)<br>`CatSqi.gf` (8)<br>`ResSqi.gf` (5)<br>`ExtendSqi.gf` (4)<br>`ExtendSqiVPS.gf` (2)<br>`ClauseSqiRes.gf` (1) |

## 3. Migration rule

Pour ajouter/modifier un champ ou une valeur :

1. inventorier les fichiers dans `generated/RES_SYMBOL_MENTIONS.tsv` ;
2. classifier chaque usage : producer / carrier / consumer / dead ;
3. créer une décision `MORPH-SQI-*` ;
4. modifier tous les producers directs dans le même change-set ;
5. adapter ou bloquer les consumers incompatibles ;
6. ajouter tests de branche exhaustive ;
7. compiler les modules touchés puis full Wordbench.

## 4. Gates spécifiques aux candidats DRAFT-MAX

### `Gen`

Ne peut passer `CANDIDATE → ACCEPTED` qu'après carte explicite des consumers de `Case`, de `mkPrep`, des tables N/A, des PN/LN/GN/IP/Pron et des réalisateurs de génitif/nyje.

### `Noun.g : Number => Gender`

Ne peut passer qu'après audit des accès `.g`, des constructeurs N, des conversions `Agr`, de CN/NP, adjectifs et déterminants. Le simple fait qu'un corpus historique note `ambigeneric` ne suffit pas.

### Voice/TAM

Toute extension de `Verb` qui modifie la voix ou les temps analytiques exige un contrat partagé avec les workstreams VP/TAM/voix/clitiques avant implémentation.

## 5. Artefact détaillé

`generated/RES_SYMBOL_MENTIONS.tsv` contient chaque symbole, fichier actif et nombre de mentions.
