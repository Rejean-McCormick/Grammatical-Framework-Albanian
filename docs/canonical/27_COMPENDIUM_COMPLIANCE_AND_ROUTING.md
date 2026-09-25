# Conformité Compendium et routing obligatoire

**Référence normative auditée :** `DocGF-Compendium(4).zip` SHA-256 `c635c426af5f16efbf798cc7ee87c2976247f08944385191a22c826e22b38ef7`.

Ce document adapte le Master Router et le Patch Protocol du Compendium au projet Albanian sans créer une gouvernance concurrente. En cas de conflit, source exact + règles domain-specific du Compendium contrôlent la procédure ; les décisions Albanian contrôlent les choix linguistiques acceptés.

## 1. Mandatory Task Header

Avant toute édition :

```yaml
language: Albanian
language_code: Sqi
route: <R01-R14>
target_module: <module|unknown>
target_symbols: []
gf_version: 3.12
rgl_revision: <commit|archive-hash|unknown>
source_lock: locked | incomplete | unknown
language_state: <S00-S11>
subsystem_state: <S00-S11>
blockers: []
```

La route est celle du **premier unresolved decision**. Une route secondaire n'est ajoutée qu'après découverte d'une dependency.

## 2. Routes

| Route | Usage Albanian | Workflow |
|---|---|---|
| R01 | survey état/coverage | EXTEND_EXISTING_LANGUAGE |
| R02 | nouveau langage (normalement N/A ici) | NEW_RGL_LANGUAGE |
| R03 | morphologie / paradigmes | MORPHOLOGY_DEVELOPMENT |
| R04 | Cat/Res/types/records | CATEGORY_AND_RESOURCE_DESIGN |
| R05 | syntaxe | SYNTAX_IMPLEMENTATION |
| R06 | family/functor reuse | FAMILY_REUSE_AND_FUNCTORS |
| R07 | Extend/Extra/Missing/compat | EXTEND_EXTRA_AND_MISSING |
| R08 | build/compile | BUILD_AND_COMPILE |
| R09 | compiler/type repair | REPAIR_COMPILATION |
| R10 | output linguistique incorrect | REPAIR_LINGUISTIC_OUTPUT |
| R11 | tests/couverture | TEST_PROTOCOL |
| R12 | review patch | AI_REVIEW_PROTOCOL |
| R13 | upstream delivery | UPSTREAM_DELIVERY |
| R14 | régénération contracts/indexes | CHANGE_RECONCILIATION |

## 3. Procédure canonique

1. classifier route ;
2. verrouiller language/source/module/symbols ;
3. charger un workflow primaire et contrats nécessaires ;
4. résoudre signatures/category contracts exacts ;
5. consulter Engineering Patterns uniquement pour une vraie décision architecture ;
6. produire causal analysis + alternatives + patch envelope ;
7. faire le plus petit changement justifié ;
8. compiler du plus local au complet ;
9. tester local, interactions, full regression ;
10. réconcilier code/evidence/decisions/status/tests/docs.

Une source ou un contrat manquant devient dependency/blocker ; il n'est jamais remplacé par mémoire ou invention.

## 4. Pattern policy

Quand un pattern réutilisable s'applique : un `primary`, au plus deux `supporting`. Toujours documenter applicability et rejected patterns. Pour Albanian, les patterns particulièrement fréquents sont smart paradigm ladder, explicit guards, information preservation, final realization boundaries, producer/consumer contracts, virtual case resolution et centralized realization.

## 5. Context minimization

Ne pas charger tous les modèles de langues. Charger uniquement : exact target source, exact contracts, inherited source réellement utilisé, Albanian evidence, tests concernés et modèles dont la compatibilité architecturale est explicitement pertinente.

## 6. Completion

Aucun patch AI n'est terminé sans : patch record, evidence, compile/test results ou `not_run`, output-change classification, review pass et reconciliation W08.
