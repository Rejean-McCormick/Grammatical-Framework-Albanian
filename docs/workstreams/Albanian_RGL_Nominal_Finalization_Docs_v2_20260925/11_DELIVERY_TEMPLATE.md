# Template de livraison — Conversation 6

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

## Handoff obligatoire

Chaque livraison de code de ce chantier doit fournir ce bloc rempli :

```text
WORKSTREAM: Conversation 6 — Domaine nominal
BASELINE TAG:
BASE SOURCE LOCK:
PATCH / OVERLAY ID:

CAPABILITY / DEFECT:
LINGUISTIC EVIDENCE:
ABSTRACT CONTRACT:
ARCHITECTURE DECISION IDS:

FILES CHANGED:
SYMBOLS CHANGED:
REPRESENTATION CHANGED: yes/no
PRODUCERS AFFECTED:
CONSUMERS AFFECTED:

STATIC VALIDATION:
GF 3.12 TARGETED COMPILE:
WORDBENCH FULL CENSUS:
SCENARIOS:
NEW/UPDATED TESTS:
GOLD IMPACT:

DICT IMPACT:
MORPHODICT IMPACT:
PLACEHOLDERS ADDED: 0 expected
PLACEHOLDERS REMOVED:

RISKS:
LINGUISTICALLY CERTIFIED:
STILL UNCERTIFIED:
OPEN QUESTIONS:
EVIDENCE IDS:
TEST VECTOR IDS:
MIGRATION STAGE:
CONSUMER AUDIT COMPLETE: yes/no
BASELINE MANIFEST REGENERATED: yes/no/N-A

MERGE ORDER / DEPENDENCIES:
ROLLBACK POINT:
```

## Fichiers à réconcilier selon le type de patch

### Changement `ResSqi/CatSqi`

Obligatoire : architecture, decisions, traceability, tests, consumer audit, full Wordbench.

### Changement `MorphoSqi/ParadigmsSqi`

Obligatoire : morphology evidence, constructor tests, representative full tables, Dict/MorphoDict impact audit.

### Changement `NounSqi/AdjectiveSqi`

Obligatoire : syntax interaction tests + gold impact.

### Changement `NumeralSqi`

Obligatoire : boundary suite + noun/agreement interactions si applicables.

### Changement `NamesSqi`

Obligatoire : case/agreement examples + evidence of name behavior.

## Critère d’acceptation documentaire

Une livraison qui ne peut pas remplir honnêtement `LINGUISTICALLY CERTIFIED` et `STILL UNCERTIFIED` doit être renvoyée en revue : le but du template est de rendre l’incertitude visible, pas de l’éliminer par formulation.
