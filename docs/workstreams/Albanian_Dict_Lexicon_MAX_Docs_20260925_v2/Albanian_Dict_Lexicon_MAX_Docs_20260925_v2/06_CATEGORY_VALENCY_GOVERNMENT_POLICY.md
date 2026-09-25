---
doc_id: DICTMAX-006
title: "Catégories, valence et gouvernement — politique normative"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Principe

Le type GF d’un lexème doit représenter le **comportement syntaxique albanais** nécessaire à son emploi dans la RGL.
Un POS lexical générique n’est pas une valence.

## Décision par famille

### N / N2 / N3

- `N` : nom sans complément lexicalement sélectionné requis par l’analyse Dict.
- `N2` : nom relationnel ou nominal exigeant/acceptant un complément structuré pertinent pour le contrat GF.
- `N3` : deux relations/complements lorsqu’ils sont réellement lexicalisés.

Ne pas créer `N2/N3` seulement parce qu’un équivalent anglais l’est ; ne pas réduire un nom relationnel attesté à `N` seulement parce que l’import source ne code pas la relation.

### A / A2

- `A` : adjectif sans complément lexicalement sélectionné dans l’usage visé.
- `A2` : adjectif avec complément gouverné selon le contrat GF.

La préposition/cas doit être documenté lorsqu’il est lexical.

### V

`V` est réservé aux emplois intransitifs correspondant réellement à cette analyse. Il ne doit pas devenir le type par défaut de tous les verbes dont la valence est inconnue dans le dictionnaire final.

### V2

Verbe transitif avec objet/complement NP selon le contrat GF. Documenter cas/préposition lorsque non trivial.

### V3

Verbe à deux compléments objets/obliques structurés. L’ordre, le cas et les prépositions doivent être établis.

### VA

Complément adjectival/AP.

### VS

Complément propositionnel déclaratif/S.

### VQ

Complément interrogatif/Q.

### VV

Complément verbal/VP ; contrôler explicitement la forme de complément et les phénomènes de contrôle/raising lorsque pertinents.

### V2A / V2S / V2Q / V2V

Combinent objet nominal et complément secondaire. Ce sont des catégories prioritaires pour les tests parce que les erreurs de valence ont des effets syntaxiques visibles.

## Gouvernement

Le registre lexical doit distinguer :

- argument direct sans préposition ;
- préposition lexicalement sélectionnée ;
- cas sélectionné ;
- complément optionnel vs obligatoire lorsque le modèle GF l’exprime ;
- variation de sens liée au frame.

Une préposition observée dans un seul exemple ne devient pas automatiquement « governed prep » : rechercher un comportement lexical récurrent ou une source grammaticale explicite.

## Procédure de décision

Pour chaque entrée structurée :

1. identifier le sens/emploi visé ;
2. recueillir des exemples albanais ;
3. déterminer nombre et nature des arguments ;
4. distinguer argument et adjunct ;
5. déterminer cas/préposition du complément ;
6. sélectionner la catégorie GF compatible ;
7. vérifier le constructeur disponible dans `ParadigmsSqi`/API ;
8. si le constructeur manque, **handoff** vers le workstream approprié ;
9. ajouter un test constructionnel ;
10. seulement ensuite promouvoir le statut.

## Sources de preuve

Ordre pratique pour la valence :

1. exemples annotés ou grammaire albanaise fournie ;
2. `LexiconSqi`/`StructuralSqi` déjà revus pour le même lexème ;
3. autres sources albanaises verrouillées ;
4. comparaison typologique comme support architectural seulement.

WordNet/Albanet peut identifier lemme, POS et sens ; il **ne suffit pas** à inventer `V2S`, `N2`, gouvernement, etc.

## Règles de non-contournement

Interdit :

- convertir un V2 problématique en V pour compiler ;
- remplacer une préposition inconnue par `noPrep` sans preuve ;
- utiliser `invariantV` comme réalisation finale d’un verbe fléchi ;
- injecter un record bas niveau pour contourner un paradigme public absent ;
- modifier `MorphoSqi` ou un type core dans ce workstream pour une seule entrée.

## Handoff

Si l’analyse est claire mais impossible à exprimer avec l’API actuelle :

- conserver l’entrée en queue avec analyse et preuve ;
- créer un ticket/handoff décrivant le constructeur nécessaire ;
- ne pas dégrader l’analyse ;
- reprendre l’entrée après livraison du paradigme/type/construction.

## Couverture catégorielle complète

Ce document détaille les familles à valence. Il est complété par `17_FULL_CATEGORY_COVERAGE_POLICY.md`, qui oblige à statuer explicitement sur les **35 catégories observées dans `DictEngAbs` fourni**, y compris les catégories adverbiales et closed-class absentes de cette page.

Aucune catégorie ne doit être remappée vers un type plus pauvre uniquement parce que le pipeline actuel ne sait pas encore la générer.
