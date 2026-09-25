# Spécification de table_signature et déduplication

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Objectif

Rendre la notion « une entrée par table flexionnelle » testable indépendamment du texte GF.

Version initiale : `table_signature_version = TSIG-1`.

## 2. Source de la signature

La signature est construite à partir de la **valeur GF compilée/introspectée** et du contrat de catégorie de `16`, jamais à partir de l'expression source seule.

## 3. Canonicalisation

Pour chaque catégorie :

1. produire la liste ordonnée de `feature_path → surface/feature` selon `16` ;
2. normaliser les chaînes en Unicode NFC ;
3. préserver casse, diacritiques, espaces linguistiques et ponctuation ;
4. retirer uniquement les fins de ligne/encodages de transport documentés par l'introspecteur ;
5. sérialiser les enums (`Masc`, `Fem`, etc.) avec leur nom GF canonique ;
6. sérialiser en JSON UTF-8 canonique : clés ordonnées, séparateurs stables, pas de champs de provenance ;
7. calculer SHA-256.

Inclure : catégorie, toutes les cellules de surface, traits inhérents (`g`, `clit`, gouvernement, `Agr`, `spec`, `placement`, etc.).

Exclure : nom de fonction, source, sens, valence, expression GF textuelle, reviewer.

## 4. Règles de déduplication

- même `base + category + table_signature` → un seul lemgramme ;
- même `base + category`, signatures différentes → plusieurs lemgrammes ;
- sens/valences multiples pointant vers la même identité morphologique → fusion ;
- expressions GF différentes mais signature identique → même table ; conserver l'expression canonique choisie et la provenance des alternatives.

## 5. Naming des homographes

Pour signatures multiples : calculer les feature paths où elles diffèrent, puis choisir un ensemble minimal de surfaces discriminantes pour le nom. Si aucune chaîne sûre n'est utilisable dans l'identifiant, decision record pour suffixe stable.

## 6. Syncrétisme

Le syncrétisme n'est pas une duplication. Plusieurs feature paths peuvent avoir la même surface et restent tous présents dans la signature.

## 7. Changement de l'algorithme

Tout passage `TSIG-1 → TSIG-2` est E2 : recalcul global, migration, rapport de collisions/diffs, invalidation ciblée des déduplications et revalidation avant release.
