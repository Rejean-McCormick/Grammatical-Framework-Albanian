---
doc_id: DICTMAX-004
title: "DictSqi — modèle cible du grand dictionnaire"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Responsabilité

`DictSqi` encode **lexème + catégorie syntaxique/morphosyntaxique + réalisation**.
Il n’est pas un MorphoDict et ne doit pas être réduit à un inventaire de formes fléchies.

## État de départ

| Indicateur | Valeur |
|---|---:|
| Fonctions | 6 720 |
| `baseline_lexicon_exact` | 337 |
| `imported_unreviewed` | 6 339 |
| `reference_attested_unreviewed` | 44 |
| Multiwords signalés | 1 830 |
| placeholders N | 4 134 |
| placeholders A | 64 |
| placeholders V | 2 141 |

Le principal problème de maturité est donc qualitatif : presque tout l’import Albanet est actuellement un inventaire attesté mais non analysé, protégé par une réalisation compile-safe.

## Séparation Dict / MorphoDict

### `DictSqi`

Conserve les distinctions utiles à la syntaxe :

- `V` ≠ `V2` ≠ `V3` ≠ `VS` ≠ `VQ` ≠ `VV` ≠ `VA` ≠ `V2A` ≠ `V2S` ≠ `V2Q` ≠ `V2V` ;
- `N` ≠ `N2` ≠ `N3` ;
- `A` ≠ `A2` ;
- sens/subcatégorie peuvent justifier plusieurs fonctions lorsque le comportement syntaxique diffère.

### `MorphoDictSqi`

Un lemgramme par comportement flexionnel ; collapse les distinctions de valence ; pas de duplication de sens ; multiwords exclus sauf raison morphologique exceptionnelle.

Aucune règle de ce document ne doit brouiller cette frontière.

## Structure conceptuelle d’une entrée Dict

Une entrée finale a au minimum :

- `gf_id` stable ;
- `lemma` ;
- `gf_category` réelle ;
- `lexical_sense_key` ou lien source lorsqu’un sens est distingué ;
- `morphology_strategy` ;
- `valency_frame` si applicable ;
- `governed_prep/case` si applicable ;
- `source_evidence` ;
- `validation_status` ;
- liens vers tests/golds lorsque certifiée.

## Identifiants

### Identifiants historiques

Les identifiants existants sont conservés lors d’une correction de type.
Exemple de dette historique : un suffixe d’ID peut refléter un ancien label (`A2V`, `AS`, `AV`, `V0`) tandis que la déclaration GF réelle est normalisée.

Le nettoyage esthétique d’un ID ne justifie jamais un breaking change.

### Nouveaux identifiants

Pour une nouvelle entrée :

- normalisation Unicode stable ;
- nom GF déterministe ;
- suffixe cohérent avec la catégorie GF réelle ;
- collision résolue par une stratégie stable, jamais par ordre accidentel d’import ;
- sens multiple distingué seulement si nécessaire pour syntaxe/sémantique du dictionnaire.

## Politique des multiwords

Les 1 830 multiwords actuels sont une **queue de revue**, pas 1 830 entrées automatiquement finales.

Catégories de traitement :

1. **lexicalisé atomique** : peut rester une entrée si la construction GF appropriée existe ;
2. **composé avec tête fléchie** : exige une analyse qui préserve la flexion de la tête ;
3. **expression compositionnelle** : à exclure du Dict lexical s’il vaut mieux la construire syntaxiquement ;
4. **nom propre multiword** : stratégie PN explicite ;
5. **artefact d’alignement WordNet** : quarantaine/exclusion ;
6. **verbe/locution à valence** : ne pas utiliser `invariantV` comme solution finale.

## Fonctionnels et closed class

`DictSqi` peut contenir des entrées fonctionnelles pour la recherche lexicale, comme `DictEng`, mais :

- `StructuralSqi` reste l’implémentation canonique des fonctionnels RGL ;
- un doublon Dict doit être aligné avec l’analyse canonique ;
- les variantes dialectales/historiques ne doivent pas remplacer silencieusement les formes standard.

## Noms propres

Les PN sont permis lorsque la source et la stratégie sont claires. À grande échelle, une politique distincte peut être nécessaire pour éviter que la croissance des noms propres masque la qualité du lexique commun.

## Critère final

Le dictionnaire distribué comme « final » ne contient plus d’entrée active dont la seule justification grammaticale est « compile-safe ». Les entrées non résolues restent conservées dans une queue/source de travail avec leur provenance.

## Compléments normatifs v2

La structure finale d'une entrée doit être compatible avec les politiques :

- identité et splits/merges : `14_IDENTITY_SENSE_HOMONYMY_POLICY.md` ;
- ingestion multi-sources : `15_INGESTION_DEDUPLICATION_MERGE_POLICY.md` ;
- normalisation/IDs : `16_ORTHOGRAPHY_NORMALIZATION_ID_POLICY.md` ;
- catégories complètes : `17_FULL_CATEGORY_COVERAGE_POLICY.md`.

Le Dict final doit distinguer au minimum **staging brut**, **entrée active analysée** et **entrée certifiée**. Une entrée peut être conservée pour provenance sans être émise dans la distribution certifiée.
