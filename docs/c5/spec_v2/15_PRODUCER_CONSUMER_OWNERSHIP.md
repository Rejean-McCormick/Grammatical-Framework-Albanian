---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 15 — Producer / consumer / ownership

| Information | Producteur baseline | Transporteurs | Consommateur baseline | Propriétaire cible |
|---|---|---|---|---|
| gouvernement `Compl.c` | `mkCompl/mkPrep`, Structural/Paradigms | V2/V3/N2/A2/VPSlash | Verb saturation, PrepIP, RelSlash, PrepNP | `Compl` typé |
| forme forte pronominale | `mkPron`, Structural | `UsePron -> NP` | saturation/full NP contexts | Pron/NP |
| faible Acc | `mkPron.acc_clit` | NP | `saturateSlash` | WeakCapability -> CliticCluster.acc |
| faible Dat | `mkPron.dat_clit` | NP | `saturateSlash` | WeakCapability -> CliticCluster.dat |
| doubling datif NP overt | `saturateSlash` calcule depuis Agr | VP | clause | saturation policy C5 |
| réflexif | `ReflVP` chaîne `u` | VP.cl | clause | CliticCluster.refl |
| cluster surface | `addClitic/appendClitic` | VP/VPSlash | ClauseSqiRes | **remplacé** par cluster typé |
| version subjonctive parallèle | `subjcl` | VP/VPSlash | ClauseSqiRes, Extend | **supprimée comme autorité** |
| `të` contraction | helpers `subj*CliticAgr` | subjcl | clause | service central après flattening |
| `po` | Idiom/Extend préfixe chaînes | VP.cl/subjcl | clause/non-fini | PreverbContext |
| négation | Res/Clause | clause | final surface | Clause realization |
| futur/conditionnel `do` | ClauseSqiRes | clause | final surface | TAM owner + clause composition |
| non-actif `u` | workstream voice / verb forms | interface | clause | **hors CliticCluster argumental** |
| cas du gap | `VPSlash.c2` | ClSlash/Q/Relative | saturation/wh/relative | Compl + slash |
| génitif/linker | `NounSqi.genitiveLink` + `np.s!Dat` | CN | PossNP | nominal+C5 interface |

## Invariant de chaîne de custody

Pour chaque nouveau champ, la PR doit répondre : **qui le produit, qui le transporte, qui le lit, qui le supprime ?** Un champ sans consommateur final identifié est rejeté; un consommateur qui reconstitue l'information depuis une chaîne est également rejeté.
