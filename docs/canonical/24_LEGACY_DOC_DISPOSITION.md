# Disposition des anciennes documentations

## Principe

Les anciennes docs ne sont pas supprimées. Elles sont reclassées.

### HISTORICAL EVIDENCE
- `docs/status/*` ;
- `docs/consolidation/WORDBENCH_RUN_*` ;
- `DOCUMENTATION_SYNC_*` ;
- `CURRENT_REPAIR_STATE.md` pour ses runs exacts ;
- anciennes correction/bug reports.

Elles prouvent un état daté, pas la priorité actuelle.

### BACKGROUND / ENGINEERING REFERENCE
- `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` ;
- `ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md` ;
- `ALBANIAN_MODEL_LANGUAGE_COMPARISON.md` ;
- `ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md` ;
- `ALBANIAN_EXTENDSQI_*` ;
- lockfield/boundary analyses.

Elles restent utiles si elles ne contredisent pas la constitution canonique.

### HISTORICAL DECISIONS / QUESTIONS
- `ALBANIAN_DECISION_LOG.md` ;
- `ALBANIAN_OPEN_QUESTIONS.md`.

Les IDs et raisons sont conservés ; l'état actuel est repris dans `19_GLOBAL_DECISION_REGISTER.md` et `20_GLOBAL_OPEN_QUESTIONS.md`.

### SNAPSHOT DATA AUTHORITY
- `docs/dictionary/*` ;
- `docs/morphodict/*`.

Ces fichiers gardent leur autorité pour provenance/coverage du snapshot exact qu'ils décrivent.

## Routing rule

Pour savoir « que faire maintenant », lire `canonical/`. Pour savoir « pourquoi ou quand cela a changé », lire `workstreams/` puis `legacy_project_docs/`.
