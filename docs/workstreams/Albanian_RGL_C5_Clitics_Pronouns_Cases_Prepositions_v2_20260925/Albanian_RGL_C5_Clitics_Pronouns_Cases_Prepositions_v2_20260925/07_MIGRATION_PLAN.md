---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 07 — Plan de migration additive et réversible

Aucune phase suivante ne commence si la phase courante n'a pas son gate minimal. DRAFT-MAX reste un réservoir d'idées, jamais un overlay global.

| Phase | Fichiers principaux | Changement | Gate | Rollback |
|---|---|---|---|---|
| P0 | docs uniquement | geler v2, IDs, inventaires | validation docset | revert docs |
| P1 | `ResSqi.gf`, `ClauseSqiRes.gf` | introduire types/helpers C5 **non autoritatifs** | compile ciblée + tests helpers | retirer types inutilisés |
| P2 | `StructuralSqiNominal.gf`, `NounSqi.gf`, `CatSqi.gf` si requis | transporter capacités faibles + tables pronoms | pronoun table tests | conserver anciens champs via shim |
| P3 | `VerbSqi.gf` | remplacer saturation par accumulation de rôles; `ComplSlash/ReflVP/V3` | clitic object tests + 52/52 | shim `cl/subjcl` généré depuis cluster |
| P4 | `ClauseSqiRes.gf` | centraliser flattening/contraction/contexte | matrice contextes critiques | réactiver shim surface |
| P5 | `ResSqi/CatSqi/NounSqi/ParadigmsSqi` selon choix | migration cas/génitif A ou B | cas + possession + compile globale | rollback atomic de la phase |
| P6 | `StructuralSqiClause.gf`, `ParadigmsSqi.gf`, usages Prep | registre complet de gouvernement | tests Prep, anti-`nga asaj` | rétablir mapping précédent |
| P7 | `QuestionSqi.gf`, `RelativeSqi.gf`, `StructuralSqiNominal.gf` | interrogatifs/relatifs/cili | Q/RP tests | rollback module-scoped |
| P8 | `IdiomSqi`, `ExtendSqi*`, interfaces voice/TAM | `po`, non-finis, impératif, voice interface | context-specific tests | feature-gated revert |
| P9 | tous consommateurs | supprimer `cl/subjcl` comme autorités et shims morts | static no-legacy + 58/58 | interdit après certification sans migration documentée |
| P10 | validation/docs | gold review + certification | tous C5-DOD | n/a |

## Règles de shim

Un shim temporaire doit avoir :

- propriétaire;
- phase d'introduction;
- source de vérité unique;
- consommateurs restants;
- condition mécanique de suppression;
- test empêchant son retour après P9.

Le shim recommandé pendant P2-P4 est **à sens unique** : nouveau cluster -> ancienne surface pour consommateurs non migrés. L'inverse (reconstruire le cluster depuis `cl : Str`) est interdit.

## Migration du cas

Le changement de représentation `Case` est une phase atomique distincte car il touche de nombreux tableaux. Aucune correction de surface ponctuelle ne doit forcer cette migration au milieu d'un patch de clitiques.
