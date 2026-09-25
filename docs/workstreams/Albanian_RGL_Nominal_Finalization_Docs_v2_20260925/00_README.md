# Dossier de finalisation — système nominal albanais

> **Document version**: 2.0  
> **Document status**: NORMATIVE  
> **Baseline evidence authority**: `19_BASELINE_EVIDENCE_LOCK.md`  
> **Source/provenance authority**: `02_SOURCE_LOCK_AND_AUTHORITY.md`  

> **Projet**: Albanian RGL — domaine nominal complet  
> **Date de verrouillage documentaire**: 2026-09-25  
> **Baseline d’intégration fournie par le mainteneur**: `albanian-s02-green-20260925`  
> **GF**: 3.12  
> **GF Wordbench**: 1.3.4  
> **Gate d’intégration**: voir `19_BASELINE_EVIDENCE_LOCK.md`  
> **Certification linguistique globale**: non établie  
> **Principe**: compilation verte ≠ certification linguistique.  

## But de ce dossier

Ce dossier est le **contrat de cohérence** de la Conversation 6. Il documente ce qui doit être construit pour que le domaine nominal de la RGL albanaise atteigne une maturité comparable à English RGL **sans copier l’analyse linguistique anglaise**.

Il doit être relu avant toute modification de `ResSqi`, `CatSqi`, `MorphoSqi`, `ParadigmsSqi`, `NounSqi`, `AdjectiveSqi`, `NumeralSqi`, `NamesSqi`, `StructuralSqiNominal` ou des scénarios/golds nominaux.

## Rôle normatif des fichiers

1. `01_FINAL_TARGET.md` — définit le résultat final et la définition de « terminé ».
2. `02_SOURCE_LOCK_AND_AUTHORITY.md` — verrouille les sources et leur ordre d’autorité.
3. `03_TARGET_ARCHITECTURE.md` — fixe la représentation nominale cible et ses frontières.
4. `04_ALBANIAN_LINGUISTIC_CONTRACTS.md` — sépare les faits albanais attestés des choix GF.
5. `05_API_AND_ENGLISH_PARITY.md` — fixe la surface RGL attendue et la notion de parité avec English.
6. `06_IMPLEMENTATION_SEQUENCE.md` — impose l’ordre de migration incrémental.
7. `07_TEST_AND_CERTIFICATION_PLAN.md` — définit les cellules, interactions et gates à tester.
8. `08_DECISIONS_AND_OPEN_QUESTIONS.md` — registre vivant des décisions et questions non résolues.
9. `09_DRIFT_PREVENTION_PROTOCOL.md` — protocole obligatoire avant/pendant/après chaque patch.
10. `10_TRACEABILITY_MATRIX.md` — relie exigence → preuve → représentation → code → test.
11. `11_DELIVERY_TEMPLATE.md` — format obligatoire des livraisons du chantier.

## Vocabulaire de statut

- **FACT** — directement soutenu par une source albanaise fournie.
- **CURRENT** — décrit le code actuel, sans jugement de correction linguistique.
- **DECISION** — choix d’architecture adopté pour le chantier, révisable seulement par nouvelle preuve.
- **PROPOSAL** — architecture plausible mais pas encore acceptée/compilée/testée.
- **GAP** — information linguistique ou technique insuffisamment établie.
- **CERTIFIED** — soutenu par preuve linguistique acceptée + test/gold reproductible.
- **STRUCTURALLY GREEN** — compile/exécute sans établir la correction linguistique.

## Invariant principal

Aucun futur patch ne doit transformer silencieusement un **PROPOSAL** ou un **GAP** en **FACT**. Toute promotion de statut doit être enregistrée dans `08_DECISIONS_AND_OPEN_QUESTIONS.md` et reflétée dans la matrice de traçabilité.

## V2 — extensions de gouvernance

12. `12_EXACT_RGL_CONTRACT_LOCK.md` — signatures abstraites exactes + hashes.
13. `13_ENGLISH_PARITY_LEDGER.md` — couverture fonction par fonction + maturité de `ParadigmsSqi`.
14. `14_PRODUCER_CONSUMER_IMPACT_MATRIX.md` — inventaire d’impact avant migration de types centraux.
15. `15_LINGUISTIC_EVIDENCE_LEDGER.md` — locators, hashes, scope Tosk/Geg/Standard et limites de preuve.
16. `16_CANONICAL_NOMINAL_TEST_VECTORS.md` — IDs stables des tests attendus et règles de gold.
17. `17_MIGRATION_CONTRACTS.md` — entry/exit/rollback N0–N9.
18. `18_LEXICAL_DEBT_AND_PROMOTION.md` — dette Dict/MorphoDict et promotion vers paradigmes certifiés.
19. `19_BASELINE_EVIDENCE_LOCK.md` — **unique autorité** des counts/hashes de baseline.
20. `20_V2_AUDIT.md` — audit de complétude et gaps légitimes.

### Single-source-of-truth rules

- Counts/run/source-lock → **19 seulement**.
- Hashes/provenance des sources → **02**, abstractions exactes → **12**, références linguistiques → **15**.
- Décisions → **08**; architecture cible → **03**; migrations → **17**; tests → **16/07**.
- Les autres documents peuvent résumer ces faits mais ne doivent pas devenir une seconde autorité.
