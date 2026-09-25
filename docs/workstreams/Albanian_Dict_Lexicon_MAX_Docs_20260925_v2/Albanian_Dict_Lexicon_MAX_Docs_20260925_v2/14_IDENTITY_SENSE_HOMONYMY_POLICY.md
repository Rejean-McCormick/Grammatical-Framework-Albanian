---
doc_id: DICTMAX-014
title: "Identité lexicale, polysémie, homonymie et stabilité des IDs"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# But

Ce document définit **ce qu'est une entrée Dict**, quand un lemme doit produire une ou plusieurs fonctions GF, et comment préserver la compatibilité lorsque l'analyse change.

La règle centrale est :

> **Un lemme orthographique n'est pas une identité lexicale. Un sens WordNet n'est pas automatiquement une fonction GF. Une fonction GF représente une unité lexicale dont la distinction est utile pour le typage, la réalisation ou l'usage grammatical.**

## Niveaux d'identité

Le pipeline distingue au minimum :

1. `source_record_id` — identifiant stable de l'enregistrement dans la source importée ;
2. `lemma_original` — forme telle qu'attestée par la source ;
3. `lemma_normalized` — forme Unicode/espacement normalisée sans perte linguistique ;
4. `lexeme_key` — clé de regroupement d'un lexème ;
5. `sense_key` — distinction sémantique seulement lorsqu'elle est prouvée et utile ;
6. `analysis_key` — catégorie GF + frame/gouvernement + réalisation morphologique pertinente ;
7. `gf_id` — identifiant public émis dans `DictSqiAbs`.

Ces identifiants ne doivent pas être confondus.

## Quand splitter une entrée

Créer plusieurs fonctions GF pour un même lemme si au moins une différence est linguistiquement démontrée et **affecte l'utilisation GF**, par exemple :

- catégories différentes (`N` vs `V`, `A` vs `Adv`) ;
- valences incompatibles (`V` vs `V2`, `V2` vs `VS`) ;
- gouvernement lexical distinct ;
- constructions propositionnelles distinctes ;
- homonymes sans relation lexicale raisonnable et avec comportement grammatical distinct ;
- réalisations morphologiques incompatibles qui ne peuvent pas être portées par une même entrée.

Ne pas splitter uniquement parce qu'une source externe possède plusieurs synsets si le comportement GF est identique et qu'aucune distinction utile n'est requise dans le dictionnaire.

## Quand merger

Plusieurs enregistrements source peuvent être fusionnés dans une même unité Dict lorsque :

- ils correspondent au même lemme normalisé ;
- la catégorie GF est la même ;
- la morphologie pertinente est la même ;
- la valence/gouvernement est compatible ;
- la séparation sémantique n'apporte aucune distinction nécessaire à l'API GF.

La fusion conserve **tous** les `source_record_id`, citations et synsets représentatifs.

## Homonymie

Les homonymes véritables reçoivent des `homonym_key` distincts. La numérotation ou désambiguïsation doit être déterministe et stockée dans les données, jamais déduite de l'ordre d'import.

Exemple conceptuel :

```text
lemma_normalized = "X"
homonym_key = X#1
analysis_key = X#1:V2:frame-direct-object
```

## Polysémie

La polysémie purement sémantique ne doit pas gonfler artificiellement `DictSqi`. Une duplication est justifiée seulement si elle est nécessaire pour :

- une catégorie différente ;
- une valence différente ;
- un gouvernement différent ;
- une réalisation morphologique différente ;
- une distinction contractuelle explicitement utile à un utilisateur GF.

## Stabilité des `gf_id`

### Entrées existantes

Un `gf_id` publié ne change pas lors d'une correction de catégorie ou de morphologie. L'identité historique reste stable et la correction est portée par le type, la linearization et les metadata.

### Split d'un ID historique

Si une ancienne fonction mélangeait plusieurs analyses :

1. conserver l'ancien ID pendant une période de compatibilité si possible ;
2. désigner une analyse canonique ou un alias documenté ;
3. créer de nouveaux IDs déterministes pour les analyses supplémentaires ;
4. enregistrer `split_from` / `supersedes` ;
5. fournir un test de compatibilité et une note de migration.

### Merge

Ne pas supprimer silencieusement des IDs publics. Utiliser alias/dépréciation/migration selon [20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md](20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md).

## Collisions d'identifiants

Une collision de translittération ou de lemma slug doit :

- être détectée avant génération ;
- être résolue par un désambiguïsateur stable stocké dans les données ;
- ne jamais dépendre du nombre d'entrées déjà parcourues ;
- produire une erreur si aucune décision déterministe n'existe.

## Invariants

- un `gf_id` actif correspond à une analyse GF explicite ;
- aucune entrée certifiée n'a un `sense_key` inventé sans preuve ;
- aucune fusion ne perd de provenance ;
- aucun split ne perd l'identité historique ;
- la croissance du Dict n'est jamais mesurée comme « nombre de synsets importés ».

## Tests obligatoires

Le validateur doit couvrir :

- unicité de `gf_id` ;
- unicité de `analysis_key` active ;
- références `split_from` / `supersedes` valides ;
- absence de cycle d'alias ;
- stabilité des IDs sur deux rebuilds ;
- rapport explicite des merges/splits du lot.
