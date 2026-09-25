---
doc_id: DICTMAX-016
title: "Orthographe, Unicode, tokenisation et génération d'identifiants"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Principe

La normalisation technique ne doit jamais effacer une distinction linguistique. `ë` et `ç` restent dans les données lexicales ; leur translittération éventuelle sert uniquement aux identifiants GF.

## Représentations séparées

Chaque entrée peut avoir :

- `lemma_original` — exactement comme la source ;
- `lemma_nfc` — Unicode NFC ;
- `lemma_display` — forme canonique choisie pour l'utilisateur ;
- `id_slug` — translittération technique stable pour `gf_id` ;
- `variant_forms[]` — variantes attestées, chacune sourcée.

## Unicode

- contenu linguistique : NFC ;
- pas de suppression de diacritiques dans `lemma_display` ;
- validation explicite des caractères de contrôle/invisibles ;
- apostrophes typographiques peuvent être harmonisées seulement selon une règle documentée et réversible ;
- aucune normalisation NFKD/NFKC destructrice dans le contenu linguistique final.

Le générateur historique utilise actuellement une translittération NFKD pour construire des IDs. Cette logique doit être confinée à `id_slug` et couverte par des tests de collision.

## Casse

La casse source est conservée. La casse canonique doit distinguer au minimum :

- noms communs ;
- noms propres ;
- acronymes/initialismes ;
- formes dont la casse fait partie de l'orthographe conventionnelle.

Un simple `lower()` ne peut pas déterminer la catégorie `PN`.

## Espaces, traits d'union, apostrophes

Pour les multiwords, conserver la forme source puis produire une forme canonique selon une classe explicite :

- lexicalized fixed expression ;
- inflecting head construction ;
- proper name ;
- compositional phrase ;
- orthographic variant ;
- artifact/noise.

La normalisation d'espace ne transforme pas automatiquement une phrase en lexème.

## Génération de `gf_id`

L'ID doit être ASCII compatible GF, lisible lorsque possible et stable.

Règles :

1. partir de la forme canonique approuvée, jamais d'une forme aléatoire de source ;
2. translittérer `ë→e`, `ç→c` uniquement dans l'ID ;
3. remplacer séparateurs par `_` selon règle stable ;
4. préserver le suffixe historique lorsqu'un ID existe déjà ;
5. ne pas tronquer sans suffixe de hash déterministe ;
6. stocker explicitement le désambiguïsateur de collision ;
7. ne jamais renuméroter après ajout/suppression d'une autre entrée.

## Collisions à tester

Le test de collision doit inclure :

- diacritiques retirés ;
- casse ;
- ponctuation ;
- espaces/traits d'union ;
- homonymes ;
- catégories différentes ;
- IDs historiques déjà réservés.

## Dialecte

Tosk/Geg ne doit pas être normalisé comme simple variante orthographique lorsque la différence est morphologique, lexicale ou grammaticale. Stocker `dialect` séparément et appliquer `08_LINGUISTIC_REFERENCE_POLICY.md`.

## Gate

Toute modification de normalisation qui change un `gf_id` ou plus de 0 surface forms certifiées est une migration de schéma/comportement et suit `20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md`.
