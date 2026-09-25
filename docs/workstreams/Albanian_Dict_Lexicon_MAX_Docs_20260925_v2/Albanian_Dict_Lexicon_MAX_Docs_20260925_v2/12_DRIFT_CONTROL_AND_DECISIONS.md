---
doc_id: DICTMAX-012
title: "Contrôle du drift et registre initial de décisions"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Objectif

Le drift apparaît quand un lot local modifie implicitement le sens des statuts, la frontière Dict/MorphoDict, la politique de valence, les identifiants ou les critères de certification.
Ce document contient les invariants qui ne peuvent changer qu’au moyen d’une décision explicite.

# Décisions initiales

## D-001 — Deux lexiques, deux objectifs

**Décision** : `LexiconSqi` reste petit/canonique ; `DictSqi` devient massif/syntaxique.

**Interdit** : gonfler Lexicon pour atteindre la taille Dict.

## D-002 — Dict != MorphoDict

**Décision** : Dict conserve catégorie/valence/sens utiles ; MorphoDict collapse valence et déduplique les sens morphologiquement identiques.

## D-003 — Compilation != certification

**Décision** : un résultat GF vert ne change pas automatiquement `review_state` linguistique.

## D-004 — Placeholders = dette

**Décision** : `invariantN/A/V` compile-safe est un échafaudage temporaire, jamais une analyse finale.

## D-005 — Identifiants stables

**Décision** : corriger un type ne renomme pas un `gf_id` existant. Les anomalies historiques sont représentées par metadata/migration.

## D-006 — English est benchmark, pas autorité linguistique

**Décision** : English mesure couverture/API/maturité. Les choix albanais requièrent preuve albanaise.

## D-007 — Pas de DRAFT-MAX en bloc

**Décision** : toute idée expérimentale est reprise isolément avec preuve, tests et gate.

## D-008 — Generator source-of-truth

**Décision** : les corrections des fichiers générés doivent remonter dans les données/overrides et le générateur.

## D-009 — Handoff plutôt que dégradation

**Décision** : si le bon paradigme/type manque, l’entrée est bloquée et transmise au workstream core. On ne dégrade pas son analyse pour compiler.

## D-010 — Final certified Dict sans placeholder actif

**Décision** : les entrées non résolues peuvent rester conservées dans la queue/source, mais ne sont pas émises comme couverture certifiée finale.

## D-011 — Distinguer baseline déclarée et preuve archivée

**Décision** : un tag/baseline déclaré par le projet peut servir d'invariant de travail, mais une affirmation de certification historique doit pointer vers le run/summary correspondant. Les rapports internes stale ne sont pas réécrits comme s'ils avaient observé un run ultérieur.

# Déclencheurs de drift

Une revue est obligatoire si un patch :

- change la signification d’un `validation_status` ;
- change le schéma de provenance ;
- renomme un `gf_id` ;
- change la priorité des sources ;
- introduit un nouveau fallback ;
- modifie plus d’une famille morphosyntaxique sans tests séparés ;
- change le générateur et produit un diff massif ;
- modifie un gold ;
- modifie la frontière Dict/MorphoDict ;
- modifie un module core hors scope.

# Procédure de décision

1. créer un record à partir de `templates/DECISION_RECORD_TEMPLATE.md` ;
2. énoncer problème et alternatives ;
3. citer source lock et preuves ;
4. préciser impacts générateur/provenance/tests ;
5. faire le patch minimal ;
6. exécuter gates ;
7. accepter/rejeter ;
8. mettre à jour ce corpus si l’invariant change.

# Rebase documentaire

À chaque nouveau snapshot Albanian :

- recalculer la baseline métrique ;
- vérifier les décisions D-001..D-010 ;
- marquer les documents `stale` si leurs faits observés ne correspondent plus ;
- ne pas corriger silencieusement les nombres sans changelog.

# Changelog minimal

Chaque mise à jour de ce corpus ajoute :

- date ;
- snapshot/hash ;
- documents modifiés ;
- décision motivante ;
- métriques affectées.

## Décisions v2 supplémentaires

### D-012 — Lemma != lexeme != sense != GF function

L'identité lexicale suit `14_IDENTITY_SENSE_HOMONYMY_POLICY.md`.

### D-013 — Fuzzy matching propose, ne fusionne jamais seul

Toute fusion non exacte exige règle approuvée ou revue.

### D-014 — Normalisation linguistique non destructive

`ë/ç`, dialecte et variantes ne sont jamais perdus par la génération d'IDs.

### D-015 — Toutes les catégories de référence reçoivent un verdict

Les 35 catégories de `DictEngAbs` fourni forment une checklist, pas un quota.

### D-016 — Expansion guidée par utilité + maturité

Le volume brut ne suffit jamais à promouvoir une milestone.

### D-017 — QA de famille requiert échantillon et exceptions

Une règle productive ne certifie pas automatiquement toutes ses entrées.

### D-018 — Schéma versionné et migrations explicites

Aucun changement sémantique de colonne sans migration.

### D-019 — Compatibilité des IDs publiée

Split/merge/deprecation d'un ID public exige mapping et test.

### D-020 — Performance mesurée, jamais optimisée au détriment de la linguistique

Le premier jalon v2 établit les baselines ; les optimisations futures doivent préserver les outputs certifiés.
