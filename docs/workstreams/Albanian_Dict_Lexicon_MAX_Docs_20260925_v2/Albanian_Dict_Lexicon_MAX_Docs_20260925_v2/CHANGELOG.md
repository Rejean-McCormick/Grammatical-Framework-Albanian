---
doc_id: DICTMAX-CHANGELOG
title: "Changelog — DictSqi + LexiconSqi MAX spec package"
status: normative-history
date: 2026-09-25
spec_version: "2.0.0"
---

# 2.0.0 — 2026-09-25

Optimisation du corpus initial après audit de complétude.

Ajouts normatifs :

- identité lexicale / polysémie / homonymie ;
- ingestion / déduplication multi-sources ;
- orthographe / Unicode / IDs ;
- couverture complète des 35 catégories observées dans le benchmark `DictEngAbs` fourni ;
- priorisation de couverture ;
- QA de revue / sampling / adjudication ;
- compatibilité / schema versioning / scalabilité.

Durcissements :

- générateur courant explicitement marqué non conforme GEN-01 à cause des chemins absolus `/mnt/data` ;
- final release gate étendu A–M ;
- metrics étendues à identité, QA, compatibilité et performance ;
- source-lock clarifié face aux manifests internes stale ;
- expansion massive bloquée avant fermeture du gate P0.

# 1.0.0 — 2026-09-25

Corpus directeur initial : final target, source lock, Lexicon policy, Dict target, provenance Q0–Q7, valence, générateur, références, tests, métriques, work packages, drift control, release checklist et templates de base.
