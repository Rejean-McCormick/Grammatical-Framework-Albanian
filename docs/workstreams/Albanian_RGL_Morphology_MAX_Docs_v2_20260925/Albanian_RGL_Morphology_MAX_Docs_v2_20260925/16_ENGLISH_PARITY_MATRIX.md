# English RGL parity matrix — morphology/API

## 1. Rule

English est le benchmark de **maturité et ergonomie**, jamais la source de formes albanaises. `N/A-REVIEW` signifie qu'une fonction anglaise peut être intrinsèquement anglaise et ne doit pas être clonée par réflexe.

## 2. Matrix

| Domaine | English surface | Albanian state | Action |
|---|---|---|---|
| Parameters | `Gender` | **PRESENT** | same maturity surface; semantics Albanian |
| Parameters | `Number` | **PRESENT-COMMON** | uses common `Number`; no local alias required |
| Parameters | `Case` | **PRESENT** | Albanian has Nom/Acc/Dat/Ablat CURRENT |
| Parameters | `npNumber` | **GAP-REVIEW** | API convenience; not necessarily morphology blocker |
| Nouns | `mkN` | **PARTIAL** | 2 public overloads vs richer English ladder; Albanian needs principal-parts ladder |
| Nouns | `mkN2` | **PRESENT** | government wrappers present |
| Nouns | `mkN3` | **PRESENT** | present |
| Nouns | `verbalN` | **N/A-REVIEW** | English derivation-specific; add only if Albanian RGL semantics need it |
| Names | `mkPN` | **PRESENT** | multiple Albanian overloads |
| Names | `mkLN` | **PRESENT** | Albanian-specific case/gender/number overloads |
| Names | `defLN/onLN/atLN` | **GAP-OR-N/A** | English location-name conveniences; assess against Albanian architecture |
| Names | `mkGN` | **PRESENT** | present |
| Names | `mkSN` | **PRESENT** | present |
| Nominal | `mkQuant` | **PRESENT** | present later in Sqi file |
| Nominal | `mkOrd` | **PRESENT** | present |
| Adjectives | `mkA` | **PARTIAL** | 2 overloads; principal-parts analysis still open |
| Adjectives | `mkA2` | **PRESENT** | government wrappers present |
| Adjectives | `compoundA/simpleA/irregAdv` | **N/A-REVIEW** | English comparison/adverb morphology; do not clone |
| Adjectives | `invarA` | **POLICY-CONFLICT** | generic invariant helper is not target strategy for inflecting Albanian adjectives |
| Adverbs | `mkAdv/mkAdV/mkAdA/mkAdN/mkCAdv` | **PRESENT** | present |
| Government | `mkPrep/noPrep` | **PRESENT** | case-carrying Albanian Prep is richer than English string prep |
| Government | `mkPost` | **GAP-REVIEW** | only if Albanian postposition behavior requires public constructor |
| Conjunctions | `mkConj` | **PARTIAL-CROSS-WORKSTREAM** | basic constructor present; agreement/correlative overloads belong syntax/structural review |
| Verbs | `mkV` | **PARTIAL** | 2 overloads vs English principal-parts ladder; Albanian requires its own PP design |
| Verbs | `mkV2/mkV3` | **PRESENT** | rich government wrappers present |
| Verbs | `mkVS/mkVV/mkVA/mkVQ` | **PRESENT** | present |
| Verbs | `mkV2S/mkV2V/mkV2A/mkV2Q` | **PRESENT** | present |
| Verbs | `partV/reflV/auxVV/ingVV/ingV2V` | **N/A-OR-CROSS** | English-specific realization helpers; evaluate with Albanian syntax/TAM/voice |
| Verbs | `mkV0` | **GAP-REVIEW** | only if shared category/API requires it |
| Adj complements | `mkAS/mkA2S/mkAV/mkA2V` | **GAP-CROSS-WORKSTREAM** | API/category parity question outside pure inflection |
| Other | `mkSubj/mkInterj/mkVoc/mkMU` | **PRESENT** | present in Albanian |

## 3. Definition of parity for Conversation 1

Le workstream est à parité morphologique quand :

- N/A/V ont chacun un ladder simple → principal parts → famille spécialisée → full forms ;
- les wrappers de gouvernement n'altèrent pas la morphologie ;
- les irréguliers ont une voie explicite ;
- l'utilisateur n'a pas besoin des IDs numériques ;
- les fonctions English absentes ont chacune un statut `N/A`, `CROSS-WORKSTREAM`, ou un ticket explicite — aucune absence silencieuse.

## 4. Raw comparison

`generated/ENGLISH_API_COMPARISON.tsv` conserve les lignes trouvées dans `ParadigmsEng` et `ParadigmsSqi`. La matrice ci-dessus est la classification humaine ; le TSV est la donnée de détection de drift.
