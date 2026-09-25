---
doc_id: DICTMAX-005
title: "Provenance, schéma lexical et états de revue"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# But

Chaque entrée doit pouvoir répondre à quatre questions indépendantes :

1. **D’où vient le lexème ?**
2. **Pourquoi cette catégorie GF ?**
3. **Pourquoi cette morphologie/valence ?**
4. **Quel niveau de validation a réellement été atteint ?**

## Schéma existant à préserver

Le registre actuel contient notamment :

`gf_id`, `category`, `lemma`, `governed_case`, `representative_synsets`, `sources`, `source_details`, `validation_status`, `exact_lexicon_function`, `alternate_lexicon_functions`, `flags`.

Ces colonnes ne doivent pas être supprimées sans migration.

## Schéma cible additif

Colonnes recommandées en plus :

| Champ | Rôle |
|---|---|
| `gf_category` | catégorie GF réelle, distincte du label historique de l’ID |
| `legacy_category_label` | suffixe/label historique s’il diffère |
| `sense_key` | identifiant de sens source ou interne |
| `dialect` | standard / Tosk / Geg / historical / unknown |
| `register` | neutre, littéraire, technique, etc. si attesté |
| `morphology_strategy` | alias, public paradigm, irregular, explicit forms, unresolved |
| `paradigm_symbol` | constructeur GF utilisé |
| `principal_parts_evidence` | référence de formes nécessaires au paradigme |
| `valency_frame` | frame normalisé |
| `governed_prep` | préposition lexicalement sélectionnée |
| `governed_case` | cas sélectionné |
| `complement_type` | NP/AP/S/Q/VP/etc. |
| `control_type` | si applicable |
| `review_state` | état défini ci-dessous |
| `review_evidence` | source/ligne/case décisionnel |
| `test_ids` | tests liés |
| `gold_ids` | golds liés |
| `decision_id` | décision structurante éventuelle |
| `last_reviewed_snapshot` | source lock de dernière revue |

## États de promotion

Les états sont monotones seulement si les preuves restent valides. Une nouvelle preuve peut provoquer un rollback.

### Q0 — `imported_raw`

Lemme/POS importés ; aucune analyse GF fiable.

### Q1 — `attested`

Le lexème et au moins une fonction/sens sont attestés dans une source identifiable.

### Q2 — `morphology_analyzed`

La réalisation morphologique est construite par un paradigme/irrégulier justifié, ou les formes explicites nécessaires sont sourcées.

### Q3 — `category_analyzed`

La catégorie GF est justifiée (`N2`, `V2S`, etc.), pas seulement dérivée d’un POS générique.

### Q4 — `valency_government_verified`

Les compléments, cas et prépositions lexicalement sélectionnés sont établis pour les catégories qui en ont besoin.

### Q5 — `gf_verified`

L’entrée ou son lot compile dans GF 3.12 et n’introduit pas de warning bloquant.

### Q6 — `scenario_verified`

Au moins un usage constructionnel pertinent est validé par scénario.

### Q7 — `gold_certified`

Les outputs pertinents ont été revus linguistiquement et promus en gold.

## Point crucial

`Q5 gf_verified` **n’implique pas** Q2-Q4. Un placeholder peut compiler ; il reste donc inférieur à Q2/Q3 selon ce qui est réellement connu.

## Mapping de l’état actuel

- `baseline_lexicon_exact` : au minimum héritage de l’état de l’entrée canonique correspondante ; ne pas l’auto-promouvoir à Q7.
- `imported_unreviewed` : Q0/Q1 selon la provenance ; placeholder de compilation non compté comme Q2.
- `reference_attested_unreviewed` : généralement Q1 ; catégorie/morphologie à vérifier séparément.

## Correction de type sans perte d’identité

Quand la catégorie change :

- garder `gf_id` existant ;
- écrire l’ancienne et la nouvelle catégorie ;
- conserver tous les synsets/source IDs ;
- créer une décision/revue ;
- adapter `DictSqiAbs` et `DictSqi` atomiquement ;
- ajouter un test si la nouvelle catégorie introduit une valence réelle.

## Quarantaine

Une entrée est conservée hors dictionnaire actif si :

- la source est ambiguë ou corrompue ;
- le lemme ne correspond pas à une unité lexicale exploitable ;
- le multiword est manifestement compositionnel ;
- la catégorie ne peut pas encore être décidée ;
- un paradigme manquant bloque une réalisation correcte.

La quarantaine n’est jamais une suppression silencieuse : raison + provenance sont conservées.

## Schéma cible v2 minimal

En plus des colonnes historiques existantes (`gf_id`, `category`, `lemma`, `governed_case`, `representative_synsets`, `sources`, `source_details`, `validation_status`, aliases, `flags`), le schéma canonique v2 doit pouvoir représenter :

```text
schema_version
source_record_ids[]
lemma_original
lemma_normalized
lexeme_key
homonym_key
sense_key
analysis_key
gf_id
category
valency_frame
governed_case
governed_prep
morphology_constructor
principal_parts/evidence
review_state
review_dimensions
reviewer/adjudication_ref
evidence_refs[]
dialect/register/period
compatibility_status
supersedes/split_from/replacement_ids
quarantine_reason
```

Tous les champs n'ont pas à être non vides pour Q0/Q1. En revanche, chaque transition Qn→Qn+1 doit définir les champs désormais obligatoires.

Voir `14`, `16`, `19` et `20` pour la sémantique détaillée.
