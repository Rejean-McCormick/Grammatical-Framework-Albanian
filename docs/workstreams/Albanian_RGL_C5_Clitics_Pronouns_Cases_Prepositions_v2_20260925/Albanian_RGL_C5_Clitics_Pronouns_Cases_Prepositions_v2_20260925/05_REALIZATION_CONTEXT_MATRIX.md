---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 05 — Matrice de réalisation des contextes

Cette matrice définit **qui doit posséder l'ordre**, pas nécessairement la chaîne finale avant revue linguistique.

| Contexte | Schéma attesté/actuel | Cible d'ownership | Statut |
|---|---|---|---|
| Indicatif simple positif | clitique immédiatement préverbal | cluster -> verbe | SOURCE_FACT |
| Indicatif simple négatif | `nuk/s'` + cluster + verbe | polarity + cluster + verb | SOURCE_FACT |
| Temps composé indicatif | cluster avant auxiliaire | cluster + aux + participle | SOURCE_FACT |
| Subjonctif positif | `të` + cluster + verbe, contractions | subj marker + flatten/contract + verb | SOURCE_FACT |
| Subjonctif négatif | `të mos` + cluster + verbe | subj + neg + cluster + verb | SOURCE_FACT |
| Futur | `do` + `të`/contraction + cluster + verbe | future + subj-domain + cluster | SOURCE_FACT |
| Futur parfait | `do të` + cluster + `kam` subj + participe | idem + aux | SOURCE_FACT pour paradigme; cluster complexe à tester |
| Conditionnel | `do të` + imperfect-domain | future/cond + subj-domain + cluster | SOURCE_FACT pour structure |
| Impératif négatif | `mos` + cluster + impératif | imperative-neg service | SOURCE_FACT |
| Impératif positif proclitique | cluster + impératif | candidate canonique | PROVISIONAL |
| Impératif positif enclitique | verbe+clitique; avant `-ni` au pl | segmentation morphologique dédiée | SOURCE_FACT, implémentation OPEN |
| Progressif `po` | `po` + domaine verbal | `preverb.po` séparé du cluster | SOURCE_FACT partielle / ordre complexe OPEN |
| Gérondif `duke` | code courant `duke + cl + participle` | nonfinite service + cluster | BASELINE_FACT; revue requise |
| `për të` purpose | code courant dépend de `subjcl` | purpose + subj-domain + cluster | BASELINE_FACT; migration requise |
| `pa` + non-fini | code courant `pa + cl + participle` | without-domain + cluster | BASELINE_FACT; revue requise |
| Non-actif aoristique | `u` préverbal attesté | interface VoiceMarker distincte | SOURCE_FACT; ownership hors C5 |
| Non-actif composé | auxiliaire `jam` attesté | TAM/voice workstream + C5 cluster interface | SOURCE_FACT; ownership partagé |
| Optatif/admiratif | code possède paradigmes; `u` non-actif attesté pour certains domaines | interface contextuelle | OPEN pour matrices C5 complètes |

## Invariant de centralisation

`SentenceSqi`, `QuestionSqi`, `RelativeSqi`, `IdiomSqi`, `ExtendSqi*` et `VerbSqi` ne doivent pas développer des versions concurrentes de `flattenClitics` ou de `të + cluster`.

## Test combinatoire

Les contextes critiques — indicatif, composé, subjonctif, futur, impératif négatif — doivent être testés avec : zéro clitique, Acc, Dat, Dat+Acc, Refl. Les contextes OPEN peuvent commencer par tests ciblés avant extension à la matrice complète.
