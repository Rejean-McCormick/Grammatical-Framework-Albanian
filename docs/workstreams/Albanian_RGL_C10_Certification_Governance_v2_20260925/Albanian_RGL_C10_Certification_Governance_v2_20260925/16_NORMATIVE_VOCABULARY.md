---
document_role: normative_vocabulary
status: normative
version: 1.0
date: 2026-09-25
---

# Vocabulaire normatif

Ce fichier est la source canonique des mots de statut. Les autres documents doivent les référencer sans redéfinir leur sens.

## Structure et exécution

**`structurally_green`**  
Tous les targets structurels requis du source-lock courant satisfont les gates techniques applicables.

**`scenario_executed`**  
GF a exécuté le scénario et les assertions techniques requises ont été produites. Aucun jugement linguistique implicite.

**`executed_only`**  
Sortie observée mais non revue linguistiquement.

## Revue linguistique

Les verdicts Wordbench sont normatifs :

**`valid`**  
Grammatical et naturel pour la variété et le contexte déclarés.

**`valid_variant`**  
Grammatical mais stylistiquement marqué, dépendant du contexte ou membre d'un ensemble de variantes acceptées.

**`questionable`**  
Preuve insuffisante ou incertitude matérielle. Bloquant dans le périmètre requis.

**`invalid`**  
Inacceptable morphologiquement, syntaxiquement, lexicalement ou normativement pour la variété déclarée. Bloquant.

Confiance :
- `high`
- `medium`
- `low`

`low` n'est pas gold-éligible par défaut.

## Gold

**`gold_eligible`**  
Le CASE satisfait les préconditions de promotion mais le gold n'a pas encore été explicitement écrit/revu.

**`golded`**  
La sortie exacte a été explicitement promue en gold avec diff, reviewer, rationale et decision reference.

**`gold_regression_pass`**  
La sortie normalisée courante correspond au gold compatible requis.

Un gold pass signifie stabilité contre l'attente revue, pas correction universelle.

## Couverture

**`untested`**  
Aucun test pertinent exécuté.

**`reviewed_valid` / `reviewed_valid_variant`**  
CASE revu mais pas nécessairement goldé.

**`not_applicable_justified`**  
Absence de capacité/cellule justifiée par l'analyse linguistique ou le contrat; preuve obligatoire.

## Parité

Statuts uniques :
- `implemented`
- `equivalent`
- `partial`
- `missing`
- `linguistically_not_applicable`
- `needs_review`

## Preuve

**`source_fact`** : observation directe du source exact.  
**`compiler_fact`** : résultat compilateur enregistré.  
**`test_fact`** : résultat de test enregistré.  
**`linguistic_evidence`** : proposition soutenue par une autorité Albanian.  
**`accepted_decision`** : choix projet explicitement adopté.  
**`inference`** : conclusion dérivée, jamais stockée comme fait direct.  
**`provisional`** : utilisable pour exploration, insuffisant pour certification.  
**`stale`** : auparavant applicable, invalidé par changement de source/décision.

## Certification

Le mot nu **« certifié » est interdit**.

Employer :

**`AI_reviewed_in_scope`**  
Périmètre entièrement revu par un reviewer AI identifié, conformément au contrat Wordbench.

**`human_reviewed_in_scope`**  
Périmètre entièrement revu selon une procédure humaine enregistrée.

**`dual_reviewed_in_scope`**  
Périmètre satisfaisant les deux niveaux définis dans la policy reviewer.

**`gold_protected_in_scope`**  
Périmètre revu dont les sorties déterministes requises sont protégées par golds compatibles.

**`R4_candidate`**  
Satisfait les gates de maturité R4; le suffixe reviewer (`AI`, `human`, `dual`) doit être ajouté dans le rapport.

## Dette

**`placeholder`**  
Réalisation technique destinée à compiler sans constituer une analyse linguistique certifiée.

**`known_debt`**  
Limitation connue avec ID, portée et owner.

**`unknown`** n'est jamais synonyme de `valid`.
