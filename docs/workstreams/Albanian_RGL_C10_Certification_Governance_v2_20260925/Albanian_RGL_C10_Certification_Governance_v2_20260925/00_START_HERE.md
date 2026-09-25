---
document_role: certification_governance_router
status: normative_for_conversation_10
version: 2.0
date: 2026-09-25
target_language: Standard Albanian
project: Albanian RGL
---

# Conversation 10 — Certification linguistique, Gold et parité English

## 1. Mission

La Conversation 10 mesure, certifie, documente et protège la maturité linguistique de l'Albanian RGL. Elle ne transforme jamais un succès de compilation ou d'exécution en preuve linguistique et n'introduit pas de hacks de compilation pour faire passer une campagne.

La cible est une Albanian RGL comparable à English RGL en **maturité fonctionnelle, couverture, profondeur de validation et maintenabilité**, avec des analyses proprement albanaises.

## 2. Architecture en trois couches

### Couche A — Constitution et règles stables

Documents propriétaires des définitions :

- `14_ANTI_DRIFT_CONSTITUTION.md` — règles non négociables;
- `16_NORMATIVE_VOCABULARY.md` — vocabulaire canonique;
- `02_AUTHORITY_EVIDENCE_AND_VARIETY_POLICY.md` — hiérarchie des preuves;
- `04_GOLD_PROMOTION_POLICY.md` — règles gold;
- `20_CERTIFICATION_THRESHOLDS_AND_LEVELS.md` — niveaux et gates;
- `22_STANDARD_ALBANIAN_VARIETY_POLICY.md` — variété cible;
- `23_CHANGE_CONTROL_AND_DECISION_LOG.md` — changement de règles/baseline;
- `29_REVIEWER_AND_HUMAN_CERTIFICATION_POLICY.md` — portée AI/humaine.

### Couche B — Modèle de référence

- `01_FINAL_STATE_AND_DEFINITION_OF_DONE.md`
- `12_ALBANIAN_LINGUISTIC_SCOPE.md`
- `17_ALBANIAN_GRAMMATICAL_FEATURE_MODEL.md`
- `18_PARADIGM_AND_MORPHOLOGICAL_CELL_REGISTRY.md`
- `19_ENGLISH_REFERENCE_BASELINE.md`
- `07_ENGLISH_PARITY_MATRIX_SPEC.md`
- `13_SOURCE_REGISTER.md`
- `15_SOURCE_CHECKSUMS.md`
- `27_INITIAL_DEBT_AND_RISK_BASELINE.md`
- `28_OPEN_QUESTIONS_REGISTER.md`

### Couche C — Évidence vivante et opérations

- `03_CASE_REVIEW_PROTOCOL.md`
- `05_CAMPAIGN_SCALING_569_5000_20000.md`
- `06_COVERAGE_MATRIX_SPEC.md`
- `08_BUG_TRIAGE_AND_HANDOFF.md`
- `09_RELEASE_CERTIFICATION_GATES.md`
- `10_DASHBOARD_AND_METRICS.md`
- `11_ARTIFACT_LAYOUT_AND_SCHEMAS.md`
- `21_TRACEABILITY_AND_STALENESS_MODEL.md`
- `24_AUTOMATED_CONSISTENCY_CHECKS.md`
- `25_OWNER_ROUTING_REGISTRY.md`
- `26_RELEASE_EVIDENCE_PACKET_TEMPLATE.md`
- `30_DOC_VALIDATION_REPORT.md` — contrôle de cohérence du paquet
- `31_OPTIMIZATION_CHANGELOG.md` — différences v1→v2

## 3. Baseline courante

La baseline canonique détaillée est dans `27_INITIAL_DEBT_AND_RISK_BASELINE.md`.

Résumé :

- GF `3.12`;
- Wordbench `1.3.4`;
- tag `albanian-s02-green-20260925`;
- `58/58` cibles GF;
- `52/52` scénarios;
- `6 720` fonctions `DictSqi`;
- `592` lemgrammes `MorphoDictSqi`;
- `569` CASEs reviewables;
- certification linguistique globale : **non établie**;
- corpus gold linguistiquement certifié : **non établi**.

Ces nombres décrivent un état de départ, jamais la définition de « terminé ».

## 4. Single-source-of-truth map

En cas de duplication accidentelle, le propriétaire suivant gagne :

| Concept | Document propriétaire |
|---|---|
| sens de `valid`, `golded`, `certified`, etc. | `16_NORMATIVE_VOCABULARY.md` |
| hiérarchie des preuves | `02_AUTHORITY_EVIDENCE_AND_VARIETY_POLICY.md` |
| variété Standard Albanian | `22_STANDARD_ALBANIAN_VARIETY_POLICY.md` |
| modèle des features/cellules | `17_ALBANIAN_GRAMMATICAL_FEATURE_MODEL.md` |
| paradigmes/API morphologique | `18_PARADIGM_AND_MORPHOLOGICAL_CELL_REGISTRY.md` |
| gold promotion | `04_GOLD_PROMOTION_POLICY.md` |
| maturité R0–R4 | `20_CERTIFICATION_THRESHOLDS_AND_LEVELS.md` |
| parité English | `07_ENGLISH_PARITY_MATRIX_SPEC.md` + baseline `19_*` |
| dette initiale | `27_INITIAL_DEBT_AND_RISK_BASELINE.md` |
| changement/staleness | `21_*` et `23_*` |
| mapping conversations 1–9 | `25_OWNER_ROUTING_REGISTRY.md` |

## 5. Règle de conflit

Ordre local :

1. `14_ANTI_DRIFT_CONSTITUTION.md`;
2. contrat exact GF/RGL/Wordbench de la source verrouillée;
3. `02_AUTHORITY_EVIDENCE_AND_VARIETY_POLICY.md`;
4. document propriétaire du concept selon la table ci-dessus;
5. autres documents de ce paquet.

Une contradiction est un bug documentaire. Elle doit être enregistrée et corrigée, jamais arbitrée silencieusement.

## 6. Règle de mise à jour

Un nouveau snapshot ne remplace pas silencieusement la baseline. Il déclenche le workflow de `23_CHANGE_CONTROL_AND_DECISION_LOG.md` et les règles de staleness de `21_TRACEABILITY_AND_STALENESS_MODEL.md`.
