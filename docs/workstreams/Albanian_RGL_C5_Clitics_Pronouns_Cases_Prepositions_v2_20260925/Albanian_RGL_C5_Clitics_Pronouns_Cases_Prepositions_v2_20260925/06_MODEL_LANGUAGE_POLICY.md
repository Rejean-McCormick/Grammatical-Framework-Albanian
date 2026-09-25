---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 06 — Politique des langues modèles

## Règle

Une langue modèle peut justifier **une forme d'architecture**, jamais une forme albanaise.

## Evidence de code fournie et usage borné

| Modèle | Ce que le source fourni montre utilement | Usage C5 permis |
|---|---|---|
| Romanian | types de clitiques, slots Acc/Dat, besoins de clitique dans `VPSlash` | discipline de rôles et flattening |
| Greek | `VP` avec plusieurs slots clitiques et placement dans domaine subjonctif | séparation slots / réalisation |
| Italian | prépositions/cas contractés et pronoms romans | comparaison ciblée de surface seulement après preuve albanaise |
| Macedonian/Bulgarian | morphosyntaxe balkanique, médiopassif/clitiques selon modules | architecture de particules/voix, jamais copie directe |
| German | types de cas et prépositions gouvernées | discipline `Prep -> Case` |
| Finnish | séparation riche des fonctions casuelles et formes NP | discipline fonction syntaxique vs réalisation morphologique |
| English | couverture abstract/API et niveau de tests | matrice de parité, pas morphosyntaxe |

## Anti-patterns

- « Romanian fait X, donc Albanian doit faire X » — interdit.
- copier une table de clitiques étrangère — interdit.
- ajouter un champ uniquement parce qu'une langue modèle l'a — interdit sans consommateur Albanian identifié.
- ignorer une divergence albanaise pour conserver la symétrie avec English — interdit.

## Critère de réutilisation

Toute réutilisation d'un pattern modèle doit enregistrer : module modèle, problème Albanian concret, propriété abstraite réutilisée, différences Albanian, test qui prouve la compatibilité.
