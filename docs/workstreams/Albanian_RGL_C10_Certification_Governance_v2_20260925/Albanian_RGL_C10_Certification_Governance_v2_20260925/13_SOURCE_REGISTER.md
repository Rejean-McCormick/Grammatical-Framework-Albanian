---
document_role: source_register
status: normative_inventory
version: 2.0
date: 2026-09-25
---

# Registre des sources de la Conversation 10

## 1. Albanian courant

`Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip`

Rôle :
- source cible actuelle;
- `CatSqi`, `ResSqi`, `MorphoSqi`, `ParadigmsSqi`;
- Dict/MorphoDict;
- campagnes, corrections, roadmap, provenance.

Références opérationnelles principales :
- `docs/status/ALBANIAN_ENGLISH_PARITY_ROADMAP_20260925.md`
- `docs/ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`
- `docs/CURRENT_REPAIR_STATE.md`
- `docs/dictionary/*`
- `docs/morphodict/*`
- `validation/*`

## 2. GF Wordbench

`Code_snapshot_GF_Wordbench(20260925-123301).zip`

Rôle :
- contrat de validation;
- linguistic review hash-bound;
- gold update explicite;
- regression comparison;
- release gates.

Autorités principales :
- `docs/validation/LINGUISTIC_REVIEW.md`
- `docs/decisions/ADR-0007-GOLDEN-OUTPUT-TESTING.md`
- `docs/scenarios/GOLDEN_TESTS.md`
- `docs/validation/REGRESSION_COMPARISON.md`
- `docs/validation/RELEASE_GATES.md`

## 3. GF RGL AI Compendium

`Code_snapshot_GF_RGL_AI_Compendium(4).zip`

Rôle :
- règles d'autorité/provenance;
- contrats;
- test protocol T0–T10;
- patterns et workflows.

Autorités principales :
- `Compendium::02_AUTHORITY_AND_PROVENANCE.md`
- `Compendium::engineering_patterns/06_EVIDENCE_AND_MATURITY_POLICY.md`
- `Compendium::testing/TEST_PROTOCOL.md`
- `Compendium::testing/REQUIRED_COVERAGE.yaml`
- `Compendium::testing/RELEASE_GATE.yaml`

Précaution :
les contrats générés du Compendium peuvent être liés à un autre commit RGL que le snapshot upstream courant. Pour une signature exacte, le **source RGL courant fourni** prime.

## 4. Upstream RGL fourni

`gf-rgl-master.zip`

L'archive fournie porte le commentaire ZIP :

`bfc0a89f9912e5db7567c955e0114437643c6eeb`

Ce même identifiant est cité comme baseline English dans le roadmap Albanian fourni.

Rôle :
- abstract signatures;
- English reference;
- modules des langues modèles;
- API et baseline upstream.

Précaution :
le ZIP ne contient pas `.git`; l'identifiant est traité comme **métadonnée fournie et corroborée par le roadmap**, pas comme commit Git reconstruit indépendamment.

## 5. Corpus GF de modèles

### Curaté

`GF_Dict_Morph_Models_Curated_20260924(1).zip`

Usage :
- modèles de dictionnaire/morphologie/paradigmes;
- comparaison architecturale ciblée.

### Dumps

`ModelLanguageGF(5).zip`

Usage :
- contexte source brut;
- vérification d'une architecture de langue modèle.

Aucun de ces corpus ne prouve un fait Albanian.

## 6. Références linguistiques Albanian

`Albanian_ref(20260925-125558).zip`

Contient :
- `Albanian.pdf`;
- `Albanian_Complete_Grammar.html`;
- leçons Tosk 10/20/30;
- leçons Geg 40/50;
- dictionnaire/glossaire Tosk;
- glossaire Geg.

La ressource générale identifie *Albanian Online* et Brian Joseph, Angelo Costanzo et Jonathan Slocum.

Usage :
- descriptions grammaticales;
- formes et exemples;
- distinctions Standard/Tosk/Geg;
- preuves lexicales ciblées.

Restriction :
une attestation dialectale n'est pas automatiquement une attestation Standard Albanian.

## 7. Sources dérivées

Inventaires générés :
- `GF_inventory_working_20260925.md`;
- `GF_inventory_full_20260925.json`;
- `GF_albanian_upstream_diff_inventory_20260925.tsv`.

Ils servent à naviguer et comparer; ils ne remplacent pas leurs sources.

## 8. Changement de source

Toute substitution de snapshot :
1. crée une nouvelle baseline;
2. enregistre le hash;
3. déclenche les règles de staleness;
4. recalcule les matrices;
5. conserve l'ancienne baseline pour audit.
