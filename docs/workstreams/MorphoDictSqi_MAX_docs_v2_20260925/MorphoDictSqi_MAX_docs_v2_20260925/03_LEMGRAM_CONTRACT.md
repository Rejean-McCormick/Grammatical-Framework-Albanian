# Contrat de lemgramme MorphoDictSqi

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Définition

La philosophie de `src/morphodict/MkMorphodict.hs` dans le RGL fourni est normative pour l'identité : dictionnaire **purely morphological**, fonctions 1-to-1 avec les lemgrammes, sans sens, sans sous-catégorisation, sans `variants`.

Un lemgramme est l'unité :

`base morphologique + catégorie MorphoDict + propriétés inhérentes + table flexionnelle`.

## 2. Identité et fusion

Deux analyses se fusionnent si elles ont :

- même catégorie MorphoDict après collapse de valence ;
- mêmes propriétés inhérentes pertinentes ;
- même base de lemme selon la convention de la catégorie ;
- même `table_signature` calculée selon `17_TABLE_SIGNATURE_AND_DEDUP_SPEC.md`.

Les sens et valences ne créent pas d'identité morphologique distincte.

## 3. Homographes

Même base + même catégorie + tables différentes = plusieurs lemgrammes légitimes. Leur identifiant GF doit être désambiguïsé par une forme morphologique discriminante stable, jamais par un sens (`finance`, `river`) ni par une valence (`V2`, `V3`).

## 4. Collapse de catégories syntaxiques

Par défaut :

- `V`, `V2`, `V3`, `VS`, `VQ`, `VV`, `VA`, etc. → `V` si la morphologie lexicale est la même ;
- `N2`, `N3` → `N` ;
- `A2` et spécialisations syntaxiques → `A` si la table est identique.

Le mapping source exact doit être machine-readable ; aucune règle ne peut être implicite dans le nom d'une fonction.

## 5. Nommage

Nom par défaut : `<baseform>_<Cat>` après échappement GF déterministe.

Si plusieurs tables existent, utiliser le plus petit ensemble de formes caractéristiques qui les distingue, dans l'esprit de `MkMorphodict.hs`. Une numérotation (`_1_`, `_2_`) n'est qu'un dernier recours documenté.

## 6. Multiwords

Exclus par défaut. Une exception requiert : unité morphologique non décomposable utilement, justification, decision id et règle explicite du validateur.

## 7. `variants`

Interdit. Une variation réelle doit être modélisée dans la table/paradigme ou séparée en lemgrammes réellement distincts selon le contrat morphologique.

## 8. Placeholders

`invariantN`, `invariantA`, `invariantV` ou équivalent peuvent exister temporairement comme scaffolding, mais : statut `PLACEHOLDER_ACTIVE`, jamais C6, blocker obligatoire, exclusion du KPI certifié. Une expansion massive ne doit jamais être fondée sur ces helpers.

## 9. Records bas niveau

Ordre préféré : constructeur `ParadigmsSqi` P3 → constructeur spécialisé/principal parts → `MakeStructuralSqi` approprié → exception explicite documentée.

La répétition de records `ResSqi` pour plusieurs lexèmes est un signal de classe manquante, pas une stratégie de dictionnaire.

## 10. Signature de table

La déduplication finale est fondée sur la table compilée/introspectée et ses métadonnées inhérentes selon `17_TABLE_SIGNATURE_AND_DEDUP_SPEC.md`. Le texte de l'expression GF n'est pas une identité : deux expressions différentes pouvant produire la même table restent un seul lemgramme si toutes les autres composantes d'identité concordent.
