---
document_role: change_control
status: normative
version: 1.0
date: 2026-09-25
---

# Contrôle de changement et journal de décisions

## 1. Changements soumis à décision

Une `DECISION` est requise pour :
- changer une définition normative;
- changer le périmètre Standard;
- changer un dénominateur;
- ajouter/supprimer une feature du modèle;
- déclarer N/A une capacité English;
- accepter/rejeter une variante contestée;
- modifier un gold pour raison linguistique;
- changer de baseline/source-lock;
- modifier les critères R0–R4;
- déclarer un placeholder acceptable durablement.

## 2. Format

```yaml
decision_id: C10-D-...
date: ...
status: proposed | accepted | rejected | superseded

problem: ...
decision: ...
scope: ...
sources: [...]
evidence_ids: [...]
affected_documents: [...]
affected_features: [...]
affected_cases: [...]
affected_golds: [...]
affected_metrics: [...]

alternatives_considered: [...]
migration: ...
reviewer: ...
supersedes: ...
```

## 3. Changement de baseline

Lorsqu'un snapshot change :
1. archiver ancien source-lock;
2. calculer nouveau source-lock;
3. diff de census/modules/API;
4. recalculer feature/paradigm registries;
5. marquer stale ce qui dépend des sorties changées;
6. rerun minimum impact;
7. rerun release gate avant déclaration de maturité.

## 4. Changement de gold

Toujours via la policy Gold :
- diff visible;
- cause;
- evidence;
- reviewer;
- decision reference;
- rerun.

## 5. Changement de métrique

Une métrique peut changer de définition seulement si :
- ancienne et nouvelle formule sont conservées;
- séries historiques ne sont pas fusionnées sans migration;
- dashboard affiche la rupture de définition.

## 6. Constitution

Toute modification de `14_ANTI_DRIFT_CONSTITUTION.md` est une décision de niveau `constitutional` et doit expliquer pourquoi la règle précédente n'est plus adéquate.

## 7. Suppression

Les décisions, bugs, CASEs et preuves historiques ne sont pas supprimés pour nettoyer les statistiques. Ils peuvent être `obsolete`, `superseded`, `stale` ou `rejected`.
