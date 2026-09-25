# Contrôle du drift

## 1. But

Ce fichier prévaut comme protocole de cohérence pour Conversation 1. Si une proposition future contredit ces règles, elle doit être accompagnée d'une décision explicite qui modifie ce document.

## 2. Invariants de workstream

### MORPH-MAX-001 — baseline recoverable

La baseline verte doit toujours être récupérable. Pas de refactor irréversible sans checkpoint.

### MORPH-MAX-002 — English n'est pas une autorité linguistique

English définit une attente de maturité/API, pas les catégories grammaticales albanaises.

### MORPH-MAX-003 — source albanaise avant modèle étranger

Une forme albanaise doit venir d'une référence/corpus/revue albanaise.

### MORPH-MAX-004 — dimensions avec consommateurs

Aucune dimension `Case/Mood/Voice/...` n'est ajoutée sans producer/consumer map.

### MORPH-MAX-005 — observable principal parts

L'API publique privilégie les formes observables. Les stems internes restent internes sauf justification.

### MORPH-MAX-006 — guards explicites

Un smart paradigm qui ne sait pas doit échouer.

### MORPH-MAX-007 — placeholders != solution

`invariantN/A/V` ne compte jamais comme fermeture d'une lacune morphologique productive.

### MORPH-MAX-008 — irrégulier ≠ classe manquante

Avant d'ajouter un mot à `IrregSqi`, vérifier si plusieurs lexèmes montrent la même règle.

### MORPH-MAX-009 — DRAFT-MAX atomique

Une idée DRAFT-MAX = une décision + un patch + des tests. Aucun overlay global.

### MORPH-MAX-010 — table complète

Toute classe certifiée est testée sur toutes les cellules actives.

### MORPH-MAX-011 — pas de correction syntaxique dans Morpho

Si les formes stockées sont correctes mais l'ordre/gouvernement est faux, router au workstream syntaxique.

### MORPH-MAX-012 — pas de réparation morphologique dans Dict

`DictSqi` ne doit pas compenser une classe morphologique manquante par des tables constantes lorsque la classe est productive.

## 3. Template de décision

```text
ID: MORPH-SQI-NNN
STATUS: OPEN | PROPOSED | ACCEPTED | REJECTED | SUPERSEDED
BASE SOURCE LOCK:
CATEGORY:
PROBLEM:
ALBANIAN EVIDENCE:
CURRENT REPRESENTATION:
PROPOSED REPRESENTATION:
PRODUCERS:
CONSUMERS:
PUBLIC API IMPACT:
DICT/MORPHODICT IMPACT:
ALTERNATIVES:
TESTS:
WORDBENCH:
RISKS:
ROLLBACK:
```

## 4. Template de patch/handoff

```text
WORKSTREAM: Morphologie fondamentale MAX
BASE SOURCE LOCK:
DECISION IDS:
FILES CHANGED:
PUBLIC API CHANGES:
MORPHOLOGY FAMILIES CHANGED:
IRREGULARS CHANGED:
STATIC CHECKS:
GF 3.12 COMPILE:
WORDBENCH:
GOLD IMPACT:
PLACEHOLDERS REMOVED:
PLACEHOLDERS REMAINING:
KNOWN UNCERTIFIED FORMS:
DEPENDENCIES:
ROLLBACK:
```

## 5. Détection automatique de drift à ajouter

Les validateurs futurs doivent pouvoir signaler :

- nouvel accès direct à une classe `mkN###/mkA###/mkV###` hors `MorphoSqi`/zones autorisées ;
- nouveau `invariantN/A/V` dans un fichier final sans waiver ;
- nouveau fallback smart qui ignore une principal part ;
- nouvelle dimension sans branche exhaustive ;
- nouvel irrégulier sans entrée de provenance ;
- changement d'API publique non documenté ;
- diminution de tests ou de golds sans décision.

## 6. Cross-conversation contract

Conversation 1 possède :

- records morphologiques de base ;
- classes productives ;
- principal parts ;
- API morphologique publique ;
- irréguliers.

Elle ne possède pas seule :

- ordre des clitiques ;
- réalisation complète TAM analytique ;
- politique de voix syntaxique ;
- valence ;
- syntaxe nominale.

Toute modification `ResSqi` qui affecte ces domaines doit être proposée comme contrat partagé avant implémentation.

## 7. Machine-enforced drift signals v2

Les baselines calculées résident dans `generated/`. Tout patch doit régénérer les inventories et échouer en review si : nouveaux IDs numériques hors zones autorisées, hausse non-waivée des placeholders, symboles de `ResSqi` nouveaux sans consumer map, API English parity row laissée sans statut, ou décision de type sans ledger.
