---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 18 — Versionnement et contrôle du changement

## Lifecycle du document set

- `DRAFT` — structure en construction, non utilisable pour guider un patch sans revue.
- `IMPLEMENTABLE` — architecture suffisamment stable pour migration phasée; questions bloquantes sont explicitement localisées.
- `CANDIDATE` — code final implémenté, certification en cours.
- `CERTIFIED` — C5-DOD complet sur un source-lock précis.

Cette v2 est `IMPLEMENTABLE`, pas `CERTIFIED`.

## SemVer documentaire

- PATCH : clarification sans changement de requirement/decision.
- MINOR : nouveau requirement, nouvelle preuve, nouvelle matrice ou décision compatible.
- MAJOR : changement de contrat de type, ownership ou critère de certification incompatible.

## Règle anti-drift

Tout changement de `NORMATIVE_TARGET`, `ACCEPTED_TARGET`, ownership ou `C5-DOD-*` exige :

1. incrément de version approprié;
2. entrée `CHANGELOG.md`;
3. mise à jour de `19_REQUIREMENT_TRACEABILITY_MATRIX.md`;
4. justification et preuve;
5. impact migration/tests.

## Supersession

Une décision n'est jamais effacée. Elle devient `SUPERSEDED` avec l'ID de la décision qui la remplace. Cela évite qu'une ancienne idée réapparaisse sans contexte.
