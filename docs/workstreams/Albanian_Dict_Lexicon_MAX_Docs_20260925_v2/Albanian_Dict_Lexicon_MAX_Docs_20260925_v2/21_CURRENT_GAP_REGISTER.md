---
doc_id: DICTMAX-021
title: "Registre courant des écarts entre la spécification et l'implémentation"
status: normative-live

date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Rôle

Ce fichier empêche de confondre **documentation cible** et **implémentation déjà réalisée**. Une règle écrite dans ce corpus n'est pas automatiquement satisfaite par le code courant.

Chaque gap possède un ID stable, un état et une condition de fermeture.

## États

- `OPEN` — écart actuel démontré ;
- `IN_PROGRESS` — patch en cours ;
- `BLOCKED` — dépendance externe/core ;
- `CLOSED` — preuve de fermeture disponible ;
- `SUPERSEDED` — remplacé par un autre gap/décision.

## Gaps initiaux v2

### GAP-DICT-001 — générateur non repo-relative

**État : OPEN**

`tools/dictionary/build_complete_dict.py` contient des chemins absolus `/mnt/data` pour `BASE`, `OUT`, `SOURCE_TSV` et `OLD_DICT`.

**Impact** : viole GEN-01 ; empêche de considérer le rebuild final comme portable.

**Fermeture** : CLI/config repository-relative + round-trip démontré + tests.

### GAP-DICT-002 — schéma canonique v2 non matérialisé

**État : OPEN**

Le TSV historique ne porte pas encore toutes les dimensions v2 (`schema_version`, source record IDs structurés, identity/sense/analysis keys, review dimensions, compatibility mappings, etc.).

**Impact** : l'expansion multi-sources à grande échelle reste staging-only.

**Fermeture** : schéma versionné + migration + validateur + fixtures.

### GAP-DICT-003 — preuve archivée de la baseline verte à réconcilier

**État : OPEN**

Le contrat de projet fournit `albanian-s02-green-20260925` à 58/58 + 52/52, alors que les rapports historiques inclus dans le snapshot documentent encore l'étape 56/58 + correctif v4 avant rerun.

**Impact** : ne pas citer le ZIP actuel comme preuve du run final non inclus.

**Fermeture** : archiver le summary/run correspondant au tag vert et synchroniser les rapports courants sans réécrire l'historique.

### GAP-DICT-004 — placeholders encore majoritaires dans le matériel importé non revu

**État : OPEN**

La baseline contient des milliers d'entrées `imported_unreviewed` protégées par helpers compile-safe.

**Impact** : le volume actuel n'est pas une mesure de maturité linguistique.

**Fermeture** : promotion par familles vers analyses réelles, ou maintien hors couverture certifiée finale.

### GAP-DICT-005 — matrice 35 catégories non matérialisée

**État : OPEN**

La politique existe en v2 mais le dashboard machine-readable catégorie→statut→owner→rationale n'existe pas encore.

**Fermeture** : produire et valider la matrice décrite dans `17_FULL_CATEGORY_COVERAGE_POLICY.md`.

### GAP-DICT-006 — QA sampling/adjudication non automatisé

**État : OPEN**

Les templates et règles sont définis mais aucun rapport machine-readable de sampling/adjudication n'est encore exigé par le validateur courant.

**Fermeture** : format + validateur + rapport de batch.

### GAP-DICT-007 — baselines de performance non établies

**État : OPEN**

Les temps/mémoire/taille de génération et compilation n'ont pas encore de baseline officielle pour ce workstream.

**Fermeture** : mesurer un run reproductible sur environnement documenté et stocker les résultats.

## Règle de maintenance

Chaque livraison doit :

1. citer les gaps qu'elle ferme ;
2. ajouter tout nouveau gap découvert ;
3. ne jamais supprimer un gap sans statut `CLOSED` ou `SUPERSEDED` ;
4. lier la preuve de fermeture (commit/snapshot/hash/test/run/decision) ;
5. mettre à jour `13_FINAL_RELEASE_CHECKLIST.md` si le gap révèle une nouvelle classe de risque.

## Condition de sortie

`MAX final` exige **0 gap OPEN/BLOCKED** ayant une sévérité bloquante pour A–M. Les limitations volontairement hors scope doivent être transformées en décisions explicites, pas simplement laissées ouvertes.
