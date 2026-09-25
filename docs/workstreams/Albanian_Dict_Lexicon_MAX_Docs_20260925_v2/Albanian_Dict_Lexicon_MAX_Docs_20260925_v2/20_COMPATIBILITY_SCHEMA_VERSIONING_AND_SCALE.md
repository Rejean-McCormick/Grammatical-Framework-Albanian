---
doc_id: DICTMAX-020
title: "Compatibilité, versioning du schéma et scalabilité"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Objectif

Garantir qu'un Dict qui passe de 6 720 à plusieurs dizaines de milliers d'entrées reste reproductible, migrable et utilisable sans casser silencieusement les grammaires clientes.

## Versioning des données

Toutes les tables canoniques portent `schema_version`.

Évolution :

- **PATCH** : champs optionnels/metadata sans changement d'interprétation ;
- **MINOR** : nouveau champ ou état avec migration rétrocompatible ;
- **MAJOR** : changement de sens d'un champ, d'identité, de normalisation ou de génération nécessitant migration.

Le générateur déclare les versions de schéma qu'il accepte et refuse les versions inconnues.

## Migrations

Une migration de données doit être :

- versionnée ;
- déterministe ;
- testée sur fixture ;
- idempotente ou explicitement one-shot ;
- accompagnée d'un rapport avant/après ;
- sans perte de provenance.

## Compatibilité des IDs GF

### Corrections sans rename

Préférées : corriger type/lin sans changer l'ID historique.

### Dépréciation

Si un ID ne peut plus représenter correctement l'analyse :

- le marquer deprecated dans metadata ;
- fournir replacement(s) ;
- maintenir un alias lorsque GF et la sémantique le permettent ;
- publier une note de migration.

### Breaking change

Autorisé seulement si :

- correction linguistique/contractuelle impossible autrement ;
- décision formelle ;
- inventaire des usages affectés ;
- version majeure du paquet lexical ;
- tests de migration.

## Manifest de release

Chaque release Dict/Lexicon doit lier par SHA-256 :

- source tables ;
- review/override tables ;
- générateur ;
- schéma ;
- `DictSqiAbs.gf` ;
- `DictSqi.gf` ;
- `LexiconSqi.gf` ;
- validateurs ;
- run Wordbench ;
- métriques ;
- golds concernés.

## Scalabilité

Le passage à l'échelle doit mesurer au minimum :

- temps de génération ;
- mémoire de génération ;
- taille de `DictSqiAbs/DictSqi` ;
- temps de validation statique ;
- temps de compilation GF ciblée ;
- temps du Global Scan Wordbench ;
- taille des artefacts générés ;
- temps de recherche/chargement des tables de revue.

Aucun budget fixe n'est imposé aujourd'hui faute de mesure de référence. La première milestone v2 doit établir les baselines de performance ; toute régression majeure ultérieure doit être expliquée.

## Sharding

Ne pas fragmenter le Dict prématurément. Un sharding par catégorie/source/famille est permis seulement si :

- la compilation ou la maintenance le justifie ;
- l'API publique reste stable ;
- l'ordre de génération et les imports sont déterministes ;
- les utilisateurs ne doivent pas connaître l'implémentation interne pour accéder au Dict complet.

## Caches

Un cache ne peut jamais devenir source de vérité. Il doit être invalidé par source lock + schema version + generator version.

## Gates de performance

À chaque milestone d'échelle :

1. mesurer baseline avant ;
2. générer après ;
3. comparer taille/temps/mémoire ;
4. exécuter compilation et Wordbench ;
5. refuser une optimisation qui modifie les surfaces linguistiques sans revue.

## Release version

Le paquet lexical final publie une version indépendante ou clairement associée au tag Albanian RGL. Une version doit permettre de reconstruire exactement les fichiers générés à partir des sources lockées.
