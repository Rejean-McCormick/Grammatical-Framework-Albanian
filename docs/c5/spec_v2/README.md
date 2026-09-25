---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# Albanian RGL C5 — contrat directeur anti-drift v2

## Mission

Ce paquet gouverne la finalisation du sous-système albanais **clitiques + pronoms + cas + prépositions**. Il définit la cible, les propriétaires de l'information, les frontières avec les autres workstreams, la migration, les preuves et les gates de certification.

Il ne modifie aucun fichier GF. Il sert de **contrat directeur** : une décision de code C5 qui contredit ce paquet doit soit modifier explicitement le contrat avec preuve, soit être rejetée.

## Baseline protégée

- GF 3.12.
- Wordbench 1.3.4 avec découverte native de `src/morphodict`.
- baseline/tag : `albanian-s02-green-20260925`.
- census attendu : **58/58** cibles GF = 51 language + 5 API facades + 2 MorphoDict.
- scénarios historiques : **52/52**.
- `DictSqi` : 6 720 fonctions.
- `MorphoDictSqi` : 592 lemgrammes.
- 569 CASEs reviewables au point de départ.
- compilation verte != certification linguistique.
- aucun nouveau placeholder compile-safe ne peut être présenté comme forme linguistique certifiée.

## Deux axes d'autorité — règle fondamentale

Il ne faut plus utiliser une seule liste d'autorité pour toutes les questions.

### A. Contrat RGL / build / représentation

1. signature abstraite exacte du snapshot RGL fourni;
2. résultat GF 3.12 / Wordbench produit par le source exact;
3. source Albanian courant et ses types réels;
4. décisions Albanian acceptées;
5. Compendium et patterns d'ingénierie;
6. langues modèles comme exemples d'architecture.

### B. Réalisation linguistique albanaise

1. référence linguistique albanaise fournie et précisément localisée;
2. gold/corpus Albanian explicitement revu;
3. décision linguistique Albanian acceptée;
4. source Albanian courant comme comportement à auditer, **pas comme preuve qu'une forme est correcte**;
5. langues modèles uniquement comme analogies typologiques ou techniques.

Conséquence : si le code courant produit une forme en conflit avec une référence albanaise claire, le code est la cible de correction. Si une référence linguistique semble demander une représentation incompatible avec l'abstract RGL, le problème devient un problème d'architecture à résoudre explicitement, pas une raison de violer silencieusement l'interface.

## Vocabulaires séparés

### Statut d'assertion

- `BASELINE_FACT` — observé dans le snapshot/run courant.
- `SOURCE_FACT` — soutenu par une référence albanaise fournie.
- `NORMATIVE_TARGET` — propriété obligatoire de la cible finale.
- `PROVISIONAL_DESIGN` — architecture candidate, à valider avant promotion.
- `OPEN` — non tranché; aucun patch ne doit le résoudre implicitement.

### Statut de décision

- `ACCEPTED_TARGET` — décision de conception adoptée comme cible.
- `PROVISIONAL` — candidate réversible.
- `REJECTED` — explicitement interdite.
- `SUPERSEDED` — ancienne décision remplacée, conservée pour traçabilité.

### Statut de certification

- `UNASSESSED` — pas de preuve exécutée/revue.
- `STRUCTURAL_PASS` — compile/tests structurels passent.
- `LINGUISTIC_REVIEWED` — sorties revues contre références/golds.
- `CERTIFIED` — tous les gates C5 applicables sont satisfaits.

## Carte documentaire

| Fichier | Propriétaire de vérité |
|---|---|
| `00_FINAL_TARGET.md` | définition de la cible finale |
| `01_CURRENT_BASELINE_AND_GAPS.md` | état observé et écarts |
| `02_TYPED_ARCHITECTURE.md` | contrats de types et information différée |
| `03_CLITIC_SYSTEM_SPEC.md` | clitiques, fusion, doubling, contractions |
| `04_PRONOUN_CASE_PREPOSITION_SPEC.md` | pronoms, cas, `cili`, prépositions |
| `05_REALIZATION_CONTEXT_MATRIX.md` | placement par contexte verbal/clausal |
| `06_MODEL_LANGUAGE_POLICY.md` | usage permis des langues modèles |
| `07_MIGRATION_PLAN.md` | migration phase/fichier/gate/rollback |
| `08_TEST_AND_CERTIFICATION_PLAN.md` | stratégie de test et niveaux de certification |
| `09_DECISION_LEDGER.md` | décisions et interdictions stables |
| `10_OPEN_QUESTIONS.md` | questions bloquantes/non bloquantes |
| `11_PATCH_CHECKLIST.md` | checklist obligatoire par patch |
| `12_SOURCE_EVIDENCE_MATRIX.md` | traçabilité des preuves |
| `13_CROSS_WORKSTREAM_BOUNDARIES.md` | ownership avec les autres conversations |
| `14_RGL_API_PARITY_MATRIX.md` | couverture API RGL pertinente à C5 |
| `15_PRODUCER_CONSUMER_OWNERSHIP.md` | producteurs, transporteurs, consommateurs |
| `16_EXHAUSTIVE_LINGUISTIC_INVENTORY.md` | inventaire linguistique minimum à certifier |
| `17_MACHINE_CHECKABLE_DEFINITION_OF_DONE.md` | gates C5-DOD-* |
| `18_VERSIONING_AND_CHANGE_CONTROL.md` | versionnement et contrôle du drift |
| `19_REQUIREMENT_TRACEABILITY_MATRIX.md` | requirement -> preuve -> code -> test |
| `CHANGELOG.md` | historique du paquet documentaire |

## Discipline de changement

Tout patch C5 doit répondre à quatre questions :

1. **Quelle exigence `C5-REQ-*` est concernée ?**
2. **Quelle preuve autorise le changement ?**
3. **Quel propriétaire de données/type change ?**
4. **Quel test/gate prouve qu'il n'y a ni régression ni nouvelle hypothèse cachée ?**

Une modification qui introduit une seconde autorité parallèle (`cl` + nouveau cluster, `Case` + autre enum sans mapping propriétaire, etc.) doit contenir une date/condition de retrait explicite du shim.
