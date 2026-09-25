---
document_role: maturity_dashboard_spec
status: normative
date: 2026-09-25
---

# Tableau de bord de maturité

> La baseline initiale canonique est `27_INITIAL_DEBT_AND_RISK_BASELINE.md`; ne pas recopier ses nombres dans une nouvelle série sans source-lock.

## 1. Vue principale

Le dashboard doit afficher au minimum :

### Structure
- GF version
- Wordbench version
- source-lock
- GF targets OK / total
- scenarios OK / total
- direct/downstream failures
- blocking warnings

### Revue linguistique
- CASEs total
- CASEs reviewed
- `valid`
- `valid_variant`
- `questionable`
- `invalid`
- high / medium / low confidence
- AI-reviewed / human-reviewed / dual-reviewed

### Gold
- gold-eligible
- gold-promoted
- required golds passing
- mismatches
- stale/incompatible golds

### Couverture
- core function coverage
- active morphology-cell coverage
- phenomenon coverage
- paradigm boundary coverage
- lexicon sample coverage

### Parité
- implemented
- equivalent
- partial
- missing
- linguistically_not_applicable
- needs_review

### Dette
- placeholders
- open linguistic bugs
- unresolved questionable
- uncertified core areas

## 2. Métriques de progression

Les séries temporelles doivent conserver le dénominateur de chaque run.

Exemples :
- `review_rate = reviewed_cases / required_cases`
- `gold_rate = golded_cases / required_cases`
- `certified_cell_rate = golded_active_cells / active_cells`
- `regression_pass_rate = passing_required_golds / required_golds`

## 3. Anti-Goodhart

Interdit :
- supprimer des CASEs difficiles pour faire monter le taux;
- remplacer `invalid` par `valid_variant` sans nouvelle preuve;
- compter `executed_only` comme certifié;
- augmenter le lexique par des placeholders et présenter le volume comme maturité;
- diminuer un dénominateur sans décision enregistrée;
- mélanger Standard/Tosk/Geg dans un taux unique.

## 4. Comparaison de campagnes

Chaque dashboard doit permettre de répondre :
- qu'est-ce qui a été ajouté?
- qu'est-ce qui a changé de verdict?
- quels golds ont changé?
- quelles zones ont gagné/perdu de la couverture?
- quels bugs ont été ouverts/fermés?
- le changement est-il linguistique, structurel ou seulement de normalisation?

## 5. Snapshot de référence initial

```text
GF: 3.12
Wordbench: 1.3.4
GF targets: 58/58
Scenarios: 52/52
DictSqi: 6720
MorphoDictSqi: 592
Reviewable CASEs: 569
Linguistic certification: NOT ESTABLISHED
Gold corpus: NOT ESTABLISHED
```

Ce bloc sert de point zéro, pas de cible finale.
