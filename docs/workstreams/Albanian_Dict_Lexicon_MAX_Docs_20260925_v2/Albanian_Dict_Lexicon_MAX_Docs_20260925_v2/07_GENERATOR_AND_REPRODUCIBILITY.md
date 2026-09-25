---
doc_id: DICTMAX-007
title: "Générateur, sources de vérité et reproductibilité"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Objectif

Le générateur final doit permettre :

> mêmes sources + mêmes décisions + même version du générateur = mêmes octets générés.

Le générateur courant constitue une base utile mais contient encore des chemins de build historiques/hardcodés ; la version finale doit être exécutable depuis le dépôt sans dépendre de `/mnt/data` ou d’un arbre temporaire particulier.

## Sources de vérité

Le code GF généré n’est pas le seul registre de connaissance. La chaîne finale doit séparer :

1. **sources importées normalisées** ;
2. **analyses/revues structurées** ;
3. **overrides certifiés** ;
4. **générateur** ;
5. **outputs GF** ;
6. **rapports et métriques**.

## Architecture cible

### Inputs

- inventaires source normalisés ;
- table canonique `LexiconSqi`/aliases ;
- table de provenance enrichie ;
- table de revues/overrides ;
- éventuelle table de quarantaine/exclusion.

### Outputs

- `DictSqiAbs.gf` ;
- `DictSqi.gf` ;
- provenance consolidée ;
- rapport de validation JSON ;
- queue de revue ;
- métriques/parité ;
- manifest de hashes.

## Invariants de génération

### GEN-01 — repository-relative

Tous les chemins sont relatifs au repo ou passés explicitement par CLI. Aucun chemin machine-local encodé dans le générateur final.

### GEN-02 — deterministic order

Tri stable explicite ; aucune dépendance à l’ordre d’un filesystem, d’un dict non contrôlé ou d’un fetch réseau.

### GEN-03 — Unicode

Normalisation Unicode documentée (NFC pour contenu linguistique, translittération seulement pour IDs selon règle stable). Les diacritiques du lemme ne sont jamais perdus dans les données linguistiques.

### GEN-04 — stable IDs

Une même entrée source/revue produit le même `gf_id`. Une collision produit une erreur ou un désambiguïsateur déterministe, jamais un suffixe dépendant de l’ordre d’import.

### GEN-05 — fail closed

Catégorie inconnue, analyse incohérente, absence de constructeur requis ou conflit d’override = erreur de build, pas fallback silencieux.

### GEN-06 — placeholders visibles

Pendant les phases intermédiaires, un placeholder doit être explicitement étiqueté dans la provenance et les métriques. Aucun helper invariant ne peut être émis par une entrée marquée `certified`.

### GEN-07 — alias exact

Les aliases `LexiconSqi` sont générés seulement si la catégorie et le lexème/revue correspondent au contrat attendu.

### GEN-08 — headers

Les outputs générés portent au minimum :

- version/commit du générateur si disponible ;
- source lock ;
- date de génération ;
- avertissement « generated, edit source data instead ».

## Overrides manuels

La correction d’une entrée générée ne doit pas être faite uniquement dans `DictSqi.gf`.
Elle doit être représentée dans une table structurée (ou source canonique dédiée), puis régénérée.

Exceptions : code GF explicitement désigné comme manuel par architecture. Cette exception doit être documentée fichier par fichier.

## Round-trip gate

Avant livraison :

1. partir d’un checkout/snapshot propre ;
2. exécuter le générateur ;
3. comparer aux outputs versionnés ;
4. **zéro diff inattendu** ;
5. relancer une seconde fois ;
6. seconde génération byte-identique.

## Validateur statique final

Doit au minimum vérifier :

- nombre et unicité des IDs ;
- inventaire abstrait = inventaire concret ;
- catégories valides ;
- provenance 100 % ;
- aucune entrée certified avec placeholder ;
- aucune entrée structurée sans metadata de valence requise ;
- aliases Lexicon valides ;
- multiwords non revus non promus ;
- aucune suppression implicite ;
- source hashes conformes ;
- headers générés conformes.

## Changement du générateur

Un changement de générateur est une modification de comportement potentiellement globale. Il exige :

- diff des sorties ;
- classement des diffs attendus/inattendus ;
- validation statique complète ;
- compilation GF ;
- Wordbench complet si les GF générés changent ;
- mise à jour de la décision correspondante.

## État de conformité du générateur courant

Le fichier courant `tools/dictionary/build_complete_dict.py` contient encore des chemins absolus sous `/mnt/data` (`BASE`, `OUT`, `SOURCE_TSV`, `OLD_DICT`). Il est donc **NON CONFORME à GEN-01** et doit être considéré comme générateur historique/reconstructif tant que ce point n'est pas refactoré.

Avant toute expansion massive, P0 exige :

- CLI ou configuration explicite ;
- chemins repository-relative ;
- aucune copie implicite depuis un arbre temporaire ;
- inputs déclarés dans un manifest ;
- `schema_version` vérifiée ;
- output dans un répertoire propre ;
- mode `--check` ou équivalent pour round-trip sans modification.

Le refactor doit reproduire byte-for-byte l'état attendu ou expliquer chaque diff.

## Versioning

Le générateur final déclare `generator_version` et les versions de schéma acceptées. Voir `20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md`.
