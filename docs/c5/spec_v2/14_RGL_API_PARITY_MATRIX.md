---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 14 — Matrice de parité API RGL pertinente à C5

La parité visée est la **couverture fonctionnelle de l'interface**, pas l'identité de réalisation avec English.

| Module abstract | Constructeur / catégorie | Baseline Albanian | Cible C5 | Test obligatoire |
|---|---|---|---|---|
| Cat | `Pron`, `NP`, `Prep`, `VP`, `VPSlash`, `RP`, `IP`, `IQuant` | présents | contrats C5 transportés sans perte | contract compile |
| Verb | `ComplSlash` | présent | saturation forte/faible typée | Acc/Dat/IO doubling |
| Verb | `ReflVP` | présent | Refl typé, distinct voice-u | reflexive matrix |
| Verb | `Slash2V3` | présent | objet fourni ne détruit pas slot restant | V3 both orders |
| Verb | `Slash3V3` | présent | idem | V3 both orders |
| Verb | `SlashVV` | présent | cluster/gap survit à embedding | control/slash tests |
| Verb | `VPSlashPrep` | présent | gouvernement Prep conservé | governed gap |
| Noun | `UsePron` | présent | fort+faible transportés | pron saturation |
| Noun | `PossPron` | présent | paradigme possessif cohérent | possessive cells |
| Noun | `PossNP` | présent | génitif/linker correct | genitive tests |
| Noun | `PartNP` | présent | partitif/`prej` correctement gouverné | partitive tests |
| Adverb | `PrepNP` | présent dans RGL Albanian | `prep.case` appliqué | 14 prep core |
| Question | `QuestSlash` | présent | gap case conservé | wh object cases |
| Question | `PrepIP` | présent | interrogatif prend cas gouverné | `me kë`, etc. |
| Question | `ComplSlashIP` | présent | saturation IP sans perte cluster | wh complement |
| Relative | `RelSlash` | présent | RP décliné selon gap | cili cases |
| Relative | `IdRP` | présent `që` | stratégie canonique documentée | relative register |
| Relative | `FunRP` | présent | Prep/NP/RP cases composent | pied-piping tests |
| Sentence | `PredVP` | présent | clause utilise service central | context matrix |
| Sentence | `ImpVP` | présent | impératif C5 | pos/neg imperative |
| Structural | pronoms personnels | présents | tables certifiées | cell matrix |
| Structural | `*_Prep` | présents | tous classés/revus | prep registry |

## Gate de parité

Aucun constructeur ci-dessus ne peut rester `UNASSESSED` à la certification C5. `NOT_APPLICABLE` est permis uniquement si l'abstract permet réellement cette interprétation et si la décision est documentée.
