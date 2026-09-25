# Albanian RGL — Morphologie fondamentale MAX — Start Here v2

**Date :** 2026-09-25  
**Cible :** `ResSqi`, `MorphoSqi`, `ParadigmsSqi`, `IrregSqi`  
**GF :** 3.12  
**Wordbench :** 1.3.4  
**Baseline de travail déclarée :** `albanian-s02-green-20260925`  
**Gate structurel :** 58/58 cibles + 52/52 scénarios

## 1. Définition de la mission

Construire une morphologie albanaise productive, exacte, auditée et publiquement utilisable, de maturité comparable à English RGL **pour les phénomènes propres à l'albanais**. Le résultat final doit permettre à `DictSqi` et `MorphoDictSqi` de fournir des formes observables/principal parts à `ParadigmsSqi`, et non de compenser une faiblesse du core par des placeholders constants.

## 2. Réalité CURRENT calculée

- classes internes : **734** = 563 N + 36 A + 135 V ;
- classes avec branche `case` : **478** ;
- classes avec `error` explicite : **475** ;
- références actives aux classes numérotées hors `MorphoSqi` : **1168**, dont **3** hors `ParadigmsSqi` ;
- baseline d'appels `invariantN/A/V` dans les sources actives : **4233 / 101 / 2173** mentions (définitions incluses) ;
- le core morphologique est hash-verrouillé dans `01_SOURCE_LOCK_AND_EVIDENCE.md`, mais le lock du dépôt entier reste à réconcilier avec le tag/run vert.

## 3. Ordre d'autorité documentaire

Quand deux documents se contredisent :

1. source exacte + hash du source-lock ;
2. sortie GF/Wordbench du même source-lock ;
3. décision `ACCEPTED` dans le ledger ;
4. preuve linguistique albanaise localisée ;
5. contrats normatifs de ce pack ;
6. inventaires `generated/` ;
7. plans `TARGET/CANDIDATE` ;
8. DRAFT-MAX et historique.

Un document de plan ne peut jamais transformer un `CANDIDATE` en état courant.

## 4. Documents normatifs

- [`01_SOURCE_LOCK_AND_EVIDENCE.md`](01_SOURCE_LOCK_AND_EVIDENCE.md) — provenance et hashes.
- [`02_FINAL_MORPHOLOGY_ARCHITECTURE.md`](02_FINAL_MORPHOLOGY_ARCHITECTURE.md) — frontière Res/Morpho/Paradigms/Irreg.
- [`06_PARADIGMS_API_SPEC.md`](06_PARADIGMS_API_SPEC.md) — contrat API public.
- [`07_IRREGULARS_POLICY.md`](07_IRREGULARS_POLICY.md) — admission des irréguliers.
- [`10_DRIFT_CONTROL.md`](10_DRIFT_CONTROL.md) — invariants anti-drift.
- [`19_QUANTITATIVE_RELEASE_GATES.md`](19_QUANTITATIVE_RELEASE_GATES.md) — définition mesurable de réussite.
- [`20_CROSS_WORKSTREAM_CONTRACTS.md`](20_CROSS_WORKSTREAM_CONTRACTS.md) — ownership et frontières.
- [`21_API_COMPATIBILITY_AND_DEPRECATION.md`](21_API_COMPATIBILITY_AND_DEPRECATION.md) — migrations sans casse.
- [`23_DECISION_LEDGER.md`](23_DECISION_LEDGER.md) — décisions append-only.

## 5. Documents de plan

- [`03_NOMINAL_MORPHOLOGY_PLAN.md`](03_NOMINAL_MORPHOLOGY_PLAN.md)
- [`04_ADJECTIVAL_MORPHOLOGY_PLAN.md`](04_ADJECTIVAL_MORPHOLOGY_PLAN.md)
- [`05_VERBAL_MORPHOLOGY_PLAN.md`](05_VERBAL_MORPHOLOGY_PLAN.md)
- [`08_DRAFTMAX_REINTEGRATION.md`](08_DRAFTMAX_REINTEGRATION.md)
- [`09_TEST_AND_CERTIFICATION_PLAN.md`](09_TEST_AND_CERTIFICATION_PLAN.md)
- [`11_OPEN_QUESTIONS_AND_DECISIONS.md`](11_OPEN_QUESTIONS_AND_DECISIONS.md)
- [`12_ROADMAP_AND_DEFINITION_OF_DONE.md`](12_ROADMAP_AND_DEFINITION_OF_DONE.md)
- [`13_FINAL_CONTENT_MANIFEST.md`](13_FINAL_CONTENT_MANIFEST.md)
- [`18_MORPHOPHONOLOGY_SPEC.md`](18_MORPHOPHONOLOGY_SPEC.md)

## 6. Inventaires de fermeture

- [`14_CURRENT_MORPHOLOGY_INVENTORY.md`](14_CURRENT_MORPHOLOGY_INVENTORY.md)
- [`15_RES_PRODUCER_CONSUMER_MAP.md`](15_RES_PRODUCER_CONSUMER_MAP.md)
- [`16_ENGLISH_PARITY_MATRIX.md`](16_ENGLISH_PARITY_MATRIX.md)
- [`17_ALBANIAN_EVIDENCE_LEDGER.md`](17_ALBANIAN_EVIDENCE_LEDGER.md)
- [`22_GENERATION_AND_REPRODUCIBILITY.md`](22_GENERATION_AND_REPRODUCIBILITY.md)
- [`24_IMPLEMENTATION_PLAYBOOK.md`](24_IMPLEMENTATION_PLAYBOOK.md)
- [`25_CHANGE_CHECKLIST.md`](25_CHANGE_CHECKLIST.md)

## 7. Règles non négociables

1. compilation verte ≠ certification linguistique ;
2. aucune principal part fournie ne peut être ignorée silencieusement ;
3. aucun nouveau `invariant*` sans waiver explicite ;
4. aucune classe productive ne va dans `IrregSqi` faute de smart paradigm ;
5. aucune dimension de `ResSqi` sans producer + consumer + tests ;
6. DRAFT-MAX s'intègre décision par décision ;
7. une migration de record central est atomique au niveau du contrat ;
8. les classes `mkN###/mkA###/mkV###` restent internes ;
9. le final doit avoir une voie de rollback et une preuve de non-régression ;
10. tout changement modifie ou confirme le ledger et les métriques concernées.

## 8. Boucle de développement autorisée

```text
source-lock
→ inventaire généré
→ question linguistique localisée
→ décision proposée
→ producer/consumer impact
→ patch minimal
→ tests de table + négatifs
→ compile ciblée
→ 58/58 + 52/52
→ revue/gold
→ décision ACCEPTED
→ régénération des inventaires
```
