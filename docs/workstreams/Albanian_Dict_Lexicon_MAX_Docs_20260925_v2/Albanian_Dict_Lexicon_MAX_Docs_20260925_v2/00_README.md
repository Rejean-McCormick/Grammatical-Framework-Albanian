---
doc_id: DICTMAX-000
title: "DictSqi + LexiconSqi MAX — corpus directeur"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# But de ce corpus

**Spec package : v2.0.0 — optimisé pour expansion à grande échelle.**


Ce dossier est le **contrat directeur anti-drift** du workstream `DictSqi + LexiconSqi MAX`.
Il décrit ce qui doit être construit pour considérer le lexique RGL albanais comme mature, comment les entrées sont promues, quelles preuves sont requises, ce qui est généré, ce qui reste manuel, et quels gates empêchent une régression silencieuse.

Il ne remplace ni le code, ni le compilateur GF, ni Wordbench, ni les sources linguistiques. Il fixe les **règles stables** selon lesquelles ces sources sont utilisées.

## Baseline protégée

Baseline de projet déclarée :

- GF 3.12 ;
- Wordbench 1.3.4 avec découverte native de `src/morphodict` ;
- 58/58 cibles GF attendues = 51 language + 5 API facades + 2 MorphoDict ;
- 52/52 scénarios ;
- tag/baseline : `albanian-s02-green-20260925` ;
- `DictSqi` : 6 720 fonctions ;
- `MorphoDictSqi` : 592 lemgrammes ;
- revue linguistique : 569 CASEs reviewables ;
- compilation verte != certification linguistique.

Toute modification de ce workstream doit préserver cette baseline ou fournir une migration testée, explicitement justifiée et réversible.

## État de départ observé pour Conversation 3

Le snapshot courant contient :

- `LexiconSqi.gf` couvrant les 348 fonctions requises par `abstract/Lexicon.gf` ;
- `DictSqiAbs.gf` / `DictSqi.gf` avec 6 720 entrées ;
- 337 entrées `baseline_lexicon_exact` ;
- 6 339 entrées `imported_unreviewed` ;
- 44 entrées `reference_attested_unreviewed` ;
- 1 830 entrées multiwords signalées ;
- 4 134 N + 64 A + 2 141 V `imported_unreviewed` actuellement réalisés par helpers compile-safe invariants ;
- registre de provenance, générateur, validateur statique et queue de revue existants.

Le benchmark anglais fourni contient 64 931 fonctions dans `DictEngAbs`. Ce nombre donne une **échelle de profondeur**, pas un quota à copier.

## Principe final

> **Même capacité de travail que l’English RGL, grammaire réellement albanaise.**

English sert à vérifier la profondeur d’API, la diversité catégorielle, la maturité des outils et la capacité lexicale. Il ne sert jamais à décider automatiquement de la valence, du gouvernement, de la morphologie ou de la syntaxe albanaise.

## Carte des documents

1. [01_FINAL_TARGET.md](01_FINAL_TARGET.md) — définition de la version finale.
2. [02_SOURCE_AUTHORITY_AND_LOCK.md](02_SOURCE_AUTHORITY_AND_LOCK.md) — sources, hashes, autorité et règle de rebase.
3. [03_LEXICON_SQI_CANONICAL_POLICY.md](03_LEXICON_SQI_CANONICAL_POLICY.md) — politique du petit lexique canonique.
4. [04_DICT_SQI_TARGET_MODEL.md](04_DICT_SQI_TARGET_MODEL.md) — rôle et architecture du grand dictionnaire.
5. [05_PROVENANCE_AND_REVIEW_STATES.md](05_PROVENANCE_AND_REVIEW_STATES.md) — schéma de provenance et états de promotion.
6. [06_CATEGORY_VALENCY_GOVERNMENT_POLICY.md](06_CATEGORY_VALENCY_GOVERNMENT_POLICY.md) — typage lexical, valence et gouvernement.
7. [07_GENERATOR_AND_REPRODUCIBILITY.md](07_GENERATOR_AND_REPRODUCIBILITY.md) — génération déterministe et anti-drift.
8. [08_LINGUISTIC_REFERENCE_POLICY.md](08_LINGUISTIC_REFERENCE_POLICY.md) — usage des références Tosk/Geg et autres sources.
9. [09_TEST_VALIDATION_CERTIFICATION.md](09_TEST_VALIDATION_CERTIFICATION.md) — gates statiques, GF, Wordbench et gold.
10. [10_METRICS_AND_PARITY_DASHBOARD.md](10_METRICS_AND_PARITY_DASHBOARD.md) — métriques de progression.
11. [11_WORK_PACKAGES_AND_HANDOFFS.md](11_WORK_PACKAGES_AND_HANDOFFS.md) — phases de réalisation et limites du workstream.
12. [12_DRIFT_CONTROL_AND_DECISIONS.md](12_DRIFT_CONTROL_AND_DECISIONS.md) — invariants, décisions et procédure de changement.
13. [13_FINAL_RELEASE_CHECKLIST.md](13_FINAL_RELEASE_CHECKLIST.md) — checklist de sortie.
14. [14_IDENTITY_SENSE_HOMONYMY_POLICY.md](14_IDENTITY_SENSE_HOMONYMY_POLICY.md) — identité lexicale, polysémie, homonymie, splits/merges.
15. [15_INGESTION_DEDUPLICATION_MERGE_POLICY.md](15_INGESTION_DEDUPLICATION_MERGE_POLICY.md) — ingestion multi-sources et déduplication.
16. [16_ORTHOGRAPHY_NORMALIZATION_ID_POLICY.md](16_ORTHOGRAPHY_NORMALIZATION_ID_POLICY.md) — Unicode, orthographe, tokenisation, IDs.
17. [17_FULL_CATEGORY_COVERAGE_POLICY.md](17_FULL_CATEGORY_COVERAGE_POLICY.md) — matrice des 35 catégories de référence.
18. [18_COVERAGE_PRIORITIZATION_AND_EXPANSION.md](18_COVERAGE_PRIORITIZATION_AND_EXPANSION.md) — ordre d’expansion et anti-gaming.
19. [19_REVIEW_QA_SAMPLING_AND_ADJUDICATION.md](19_REVIEW_QA_SAMPLING_AND_ADJUDICATION.md) — QA de revue et adjudication.
20. [20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md](20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md) — compatibilité, migrations, performance.
21. [21_CURRENT_GAP_REGISTER.md](21_CURRENT_GAP_REGISTER.md) — écarts actifs entre spec et implémentation.
22. [CHANGELOG.md](CHANGELOG.md) — évolution du spec package.
23. `templates/` — formats obligatoires de revue, livraison, ingestion, migration et décision.

## Discipline d’utilisation

Avant un lot : lire `02`, `05`, `06`, `12` et les politiques `14`–`20` pertinentes.
Après un lot : mettre à jour provenance, métriques, tests, risques et décisions affectées.
Avant toute affirmation « final », « parity », « certified » ou « ready » : passer `13_FINAL_RELEASE_CHECKLIST.md`.

## Règle anti-drift centrale

Aucun de ces raccourcis n’est permis :

- compter un placeholder comme analyse linguistique ;
- déduire une valence d’un POS WordNet ;
- copier une catégorie anglaise sans preuve albanaise ;
- changer un identifiant existant pour « nettoyer » un suffixe ;
- corriger une entrée en modifiant la morphologie fondamentale dans ce workstream ;
- promouvoir un output parce qu’il compile ;
- éditer silencieusement un fichier généré sans mettre à jour sa source de vérité ;
- mélanger des snapshots/hashes incompatibles.

## Gate P0 avant expansion massive

Ne pas lancer une ingestion de grande ampleur tant que :

- le générateur n'est pas repo-relative ;
- le schéma canonique n'est pas versionné ;
- les règles d'identité/déduplication/orthographe ne sont pas actives ;
- la matrice des catégories n'a pas un verdict pour chaque catégorie de référence ;
- le QA de batch et le manifest de release ne sont pas automatisables.
