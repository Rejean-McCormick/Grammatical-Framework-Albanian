---
doc_id: DICTMAX-017
title: "Politique complète des catégories lexicales RGL"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Objectif

Éviter un Dict « massif » mais réduit à N/A/V. Le benchmark fourni `DictEngAbs` contient **35 catégories GF distinctes**. Elles constituent une checklist de dimensions à évaluer, non une distribution à reproduire.

## Les 35 catégories du benchmark English fourni

| Famille | Catégories observées |
|---|---|
| nominal | `N`, `N2`, `PN`, `NP`, `Pron`, `IP` |
| adjectival | `A`, `A2` |
| verbal | `V`, `V2`, `V3`, `VS`, `VQ`, `VV`, `VA`, `V2A`, `V2S`, `V2Q`, `V2V` |
| adverbial | `Adv`, `AdA`, `AdN`, `AdV`, `IAdv` |
| determiner/quantification | `Det`, `Quant`, `Predet`, `Num`, `IDet`, `IQuant` |
| linking/function | `Prep`, `Conj`, `Subj`, `PConj`, `Interj` |

Le benchmark contient également des fonctions `NP`; cette catégorie n'implique pas qu'un grand Dict albanais doive accumuler arbitrairement des phrases nominales lexicalisées.

## Statuts de décision par catégorie

Chaque catégorie doit recevoir un statut documenté :

- `CORE_LEXICAL` — expansion Dict normalement attendue ;
- `CLOSED_CLASS` — inventaire borné, priorité à `StructuralSqi`/modules RGL ;
- `LEXICALIZED_ONLY` — seulement pour unités réellement lexicalisées ;
- `PROPER_NAME_POLICY` — gouverné par politique PN ;
- `NOT_APPLICABLE` — seulement avec justification contractuelle/linguistique ;
- `DEFERRED_CORE` — dépendance vers un autre workstream.

L'absence silencieuse n'est pas un statut.

## Politique initiale de travail

Sans préjuger des résultats linguistiques :

- `N/N2/N3`, `A/A2`, famille `V*`, `Adv` sont des dimensions lexicales centrales ;
- `PN` suit une stratégie séparée et ne compte pas pour gonfler la parité ;
- `Prep`, `Conj`, `Subj`, `Det`, `Quant`, `Pron`, `Predet`, interrogatifs et autres closed classes doivent être alignés avec `StructuralSqi` et les contrats RGL avant expansion ;
- `NP` n'est admis dans Dict que pour lexicalisation claire et documentée ;
- `AdA/AdN/AdV/IAdv` sont évalués comme catégories fonctionnelles/adverbiales réelles, pas remappés vers `Adv` uniquement pour réduire le nombre de types.

## Matrice obligatoire

Le dashboard final maintient une ligne par catégorie avec :

```text
category
status
current_count
reviewed_count
certified_count
english_reference_count
albanian_rationale
owner_module
open_blocker
```

## Catégories absentes du Dict actuel

Une catégorie absente doit déclencher une des conclusions suivantes :

1. manque de couverture à combler ;
2. catégorie pertinente mais appartenant à `StructuralSqi` plutôt qu'au grand Dict ;
3. catégorie non productive/peu lexicale et volontairement bornée ;
4. manque du core Albanian à handoff ;
5. réellement non applicable, avec preuve.

## Règle de retypage

Ne jamais dégrader une catégorie riche vers une catégorie plus pauvre pour éviter un constructeur manquant. Si l'analyse requise n'est pas représentable, ouvrir un handoff.

## Validation

Pour chaque catégorie active :

- au moins un test de construction GF représentatif ;
- pour catégories à valence : tests positifs et contrastifs ;
- pour closed class : cohérence avec `StructuralSqi` ;
- pour catégories rares : inventaire exhaustif/reviewable plutôt qu'un objectif de volume.
