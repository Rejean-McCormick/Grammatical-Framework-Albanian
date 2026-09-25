---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 19 — Matrice de traçabilité des exigences

| Requirement | Preuve principale | Propriétaire code cible | Tests/Gates |
|---|---|---|---|
| C5-REQ-001 | architecture + Compendium | Res/Clause kernel | C5-DOD-005/006 |
| C5-REQ-002 | pronoms forts/faibles §16-17 | Res/Cat/Noun/Structural | pronoun + saturation |
| C5-REQ-003 | weak inventory | Res/Verb | cluster unit tests |
| C5-REQ-004 | Dat-before-Acc + EP020 | Clause service | commutativity + 18 matrix |
| C5-REQ-005 | Lesson20 + abstract Prep | Res/Paradigms/Structural | prep registry |
| C5-REQ-006 | five cases + nyje | Res/Cat/Noun | gen/dat tests |
| C5-REQ-007 | placement rules | ClauseSqiRes + interfaces | context matrix |
| C5-REQ-008 | Lesson40 + weak u | C5/voice interface | role-distinction tests |
| C5-REQ-009 | abstract Verb/Q/Rel | Verb/Question/Relative | API parity tests |
| C5-REQ-010 | Lesson30 tables | Structural/Relative | cell matrices |
| C5-REQ-011 | Structural abstract + Lesson20 | StructuralSqiClause | all-prep classification |
| C5-REQ-012 | project policy | validation/docs | gold provenance check |
| C5-REQ-013 | Compendium ownership patterns | Res/Cat/Clause | producer-consumer audit |
| C5-REQ-014 | homophony in weak inventory | Res/cluster | role tests |
| C5-REQ-015 | Lesson30 §17.4 | flattenClitics | 18/18 |
| C5-REQ-016 | Lesson20 §7 | Prep registry | 14 minimum |

## Règle

Un requirement sans test futur identifiable est incomplet. Un test sans requirement ou bug record doit être justifié comme régression historique ou retiré du scope C5.
