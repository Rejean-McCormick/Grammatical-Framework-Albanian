# Contrat d’échelle et de reproductibilité

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Objectif

Le pipeline doit rester fiable à 500, 5 000 ou 50 000+ lemgrammes. La taille ne doit pas changer les règles de preuve.

## 2. Layout cible logique

```text
resources/morphodict/
  SOURCES.yaml
  SOURCE_UNIVERSE.yaml
  CANDIDATES.jsonl
  EVIDENCE.jsonl

docs/morphodict/
  COVERAGE.json
  COVERAGE.csv
  PARADIGM_REGISTRY.yaml
  DEPENDENCIES.jsonl
  EXCLUDED.csv
  METRICS.json
  campaigns/<campaign_id>/...
validation/morphodict/
  GOLD_MORPHOLOGY.tsv
  review_queue.tsv
  missing_paradigms.tsv
  source_conflicts.tsv
tools/morphodict/
  build_morphodict_sqi.py
  validate_*.py
```

Le chemin exact peut être migré par décision ; les rôles d'artifacts sont normatifs.

## 3. Déterminisme

- tri canonique stable des fonctions ;
- IDs indépendants de l'ordre d'ingestion ;
- sérialisation machine-readable stable ;
- pas de timestamp dans les artifacts canoniques hashés, ou timestamp séparé ;
- même input lock = même output canonical hash.

## 4. Double rebuild gate

Dans un environnement propre, exécuter deux builds consécutifs depuis les mêmes inputs. Les hashes canoniques de `MorphoDictSqiAbs.gf`, `MorphoDictSqi.gf`, coverage, signatures et metrics doivent être identiques.

## 5. Performance

Mesurer temps et mémoire de : ingestion, génération, validation statique, `gf -make`, introspection, Wordbench. Une optimisation de performance ne peut pas désactiver une validation linguistique.

## 6. Partitionnement

Garder une surface MorphoDict canonique unique tant que GF/RGL la supporte. Un partitionnement interne/génération par chunks est permis si l'artifact final et l'API restent identiques. Toute modification de l'API/module layout est E2.

## 7. Reprise après échec

Les étapes lourdes peuvent utiliser caches dérivés, mais chaque cache doit être invalidable par fingerprint. Un cache ne devient jamais source d'autorité.
