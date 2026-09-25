---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 17 — Definition of Done vérifiable

La certification C5 exige **tous** les gates applicables ci-dessous.

| Gate | Vérification |
|---|---|
| C5-DOD-001 | aucune question `BLOCKING` ouverte |
| C5-DOD-002 | GF 3.12 Global Scan = 58/58 sur baseline/profile attendu |
| C5-DOD-003 | les 52 scénarios historiques passent |
| C5-DOD-004 | 100% des scénarios C5 requis par les matrices actives passent |
| C5-DOD-005 | aucun `cl/subjcl` n'est source de vérité grammaticale; shims éventuels supprimés |
| C5-DOD-006 | aucune reconstruction de rôle clitique depuis `Str` |
| C5-DOD-007 | 18/18 doubles clitiques source-attestés testés et revus |
| C5-DOD-008 | tables distal/proximal/cili/forts prévues testées cellule par cellule |
| C5-DOD-009 | les 14 prépositions source-attestées ont test de gouvernement |
| C5-DOD-010 | toutes les `Structural.*_Prep` pertinentes sont classifiées et aucune reste `UNASSESSED` |
| C5-DOD-011 | chaque constructeur de `14_RGL_API_PARITY_MATRIX.md` a preuve/test final |
| C5-DOD-012 | `u` Refl/Dat3pl/non-actif ne partage pas une seule représentation ambiguë |
| C5-DOD-013 | `po` n'est pas stocké dans le cluster pronominal |
| C5-DOD-014 | Gen/Dat distinction syntaxique et mapping morphologique documentés/testés |
| C5-DOD-015 | aucun nouveau placeholder linguistique introduit pour faire passer un gate |
| C5-DOD-016 | chaque gold C5 possède source/reviewer/status |
| C5-DOD-017 | documentation, décision ledger et traceability matrix correspondent au code livré |

## Static checks attendus après P9

Les commandes exactes seront adaptées au dépôt, mais les assertions sont :

```text
NO authoritative field pattern: cl : Str
NO authoritative field pattern: subjcl : Str
NO parser/helper converting surface clitic Str -> grammatical role
NO C5 shim marked temporary remains
NO OPEN/BLOCKING item without owner
```

Une occurrence historique/commentaire n'est pas un échec si elle est explicitement exclue du check; une occurrence dans la représentation active l'est.

## Certification report final

Le rapport final doit contenir : source hash, GF version, Wordbench version, census, scenario count, C5-DOD table, gold-review summary, open nonblocking limitations, et diff contre `albanian-s02-green-20260925`.
