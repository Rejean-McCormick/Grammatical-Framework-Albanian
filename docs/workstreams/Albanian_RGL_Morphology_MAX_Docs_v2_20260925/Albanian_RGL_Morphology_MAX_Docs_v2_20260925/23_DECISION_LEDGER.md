# Decision ledger — append-only

## 1. Rule

Ce fichier enregistre les décisions acceptées/rejetées. `11_OPEN_QUESTIONS_AND_DECISIONS.md` reste une vue de travail ; ici, une entrée n'est jamais supprimée. Une décision est seulement `SUPERSEDED` par une autre ID.

## 2. Schema

```text
ID
DATE
STATUS: PROPOSED | ACCEPTED | REJECTED | SUPERSEDED
SUPERSEDES
SOURCE_LOCK
SCOPE
CLAIM
ALBANIAN_EVIDENCE_IDS
CURRENT_FACTS
DECISION
ALTERNATIVES
PRODUCERS
CONSUMERS
API_IMPACT
TESTS
WORDBENCH_RUN
GOLD_IMPACT
ROLLBACK
NOTES
```

## 3. Seed decisions

### MORPH-SQI-A01 — incremental DRAFT-MAX only
STATUS: ACCEPTED  
Decision: aucun overlay DRAFT-MAX global ; une idée = une décision + patch + tests.

### MORPH-SQI-A02 — numbered classes internal
STATUS: ACCEPTED  
Decision: les IDs `mkN###/mkA###/mkV###` peuvent subsister en implémentation, mais ne constituent pas l'API lexicographique finale.

### MORPH-SQI-A03 — placeholders are debt
STATUS: ACCEPTED  
Decision: `invariantN/A/V` compile-safe ne vaut jamais certification morphologique.

### MORPH-SQI-A04 — explicit guards
STATUS: ACCEPTED  
Decision: un smart paradigm hors domaine doit échouer explicitement.

### MORPH-SQI-A05 — observable principal parts
STATUS: ACCEPTED  
Decision: les formes d'entrée publiques sont observables/verifiables ; les stems opaques restent internes sauf justification documentée.

## 4. Next decisions to resolve

`Gen`, plural-sensitive gender, neuter, minimal verb principal parts, subjunctive boundary, meaning of current `Past`, lexical voice fields, adjective principal parts, and removal of `reg2* → reg*` silent fallbacks.
