---
document_role: paradigm_and_cell_registry
status: source_grounded_registry
version: 1.0
date: 2026-09-25
source: current ParadigmsSqi/ResSqi
---

# Registre des paradigmes et cellules morphologiques

## 1. But

Ce registre transforme `ParadigmsSqi` en surface testable. Une API publique n'est pas mature parce qu'elle compile; chaque surcharge doit être couverte selon T3 du Compendium, et chaque paradigme productif selon T2.

## 2. Paramètres publics exposés

`ParadigmsSqi` expose actuellement :

- `Gender`, `Case`;
- `masculine`, `feminine`;
- `singular`, `plural`;
- `nominative`, `accusative`, `dative`, `ablative`;
- `invariantCase`.

Le génitif n'est pas une valeur publique de `Case`; voir le feature model.

## 3. Paradigmes nominaux

| API | Surcharges / forme | Nature | Obligation |
|---|---:|---|---|
| `mkNFull` | 1 | 16 formes + genre | table complète goldable |
| `mkN` | 2 | smart depuis Nom Indef Sg; ou Sg+Pl | canonical + frontières + invalid input |
| `mkN2` | 5 | N/N string + gouvernement | valence + cas |
| `mkN3` | 1 | N + deux compléments | deux gouvernements |
| `mkPN` | 4 | invariant / genre / 4 cas / depuis N | formes casuelles et accord |
| `mkLN` | 3 | lieux, accord | cas + nombre |
| `mkGN` | 3 | noms géographiques, genre | cas |
| `mkSN` | 2 | noms de personnes/sexes selon API | catégories de réalisation |

## 4. Paradigmes adjectivaux

| API | Surcharges | Nature |
|---|---:|---|
| `mkA` | 2 | smart depuis Nom Masc Sg ou Sg+Pl |
| `unartA` | 1 | désactive article de liaison |
| `mkA2` | 5 | A + complément/gouvernement |

La table lexicale A possède 16 cellules. L'AP réalisé possède 32 combinaisons avec species.

## 5. Paradigmes verbaux

| API | Surcharges / forme | Nature |
|---|---:|---|
| `irregVFull` | 1 | tables explicites + impératif + participe |
| `irregV` | 1 | compact, réutilise certaines formes dans plusieurs tables | risque élevé, doit rester visible |
| `mkV` | 2 | smart depuis Pres P1Sg ou + participe |
| `mkV2` | 5 | V + gouvernement |
| `mkVV` | 2 | V / string |
| `mkVS` | 2 | V / string |
| `mkVQ` | 2 | V / string |
| `mkVA` | 2 | V / string |
| `mkV2V` | 4 | deux slots de compléments |
| `mkV2S` | 4 | deux slots |
| `mkV2Q` | 4 | deux slots |
| `mkV2A` | 4 | deux slots |
| `mkV3` | 6 | deux compléments avec variantes Prep/string |

### Univers lexical V

57 cellules observables; 51 formes explicites dans `mkVerb`; 6 subjonctives dérivées.

Tout constructeur compact qui remplit plusieurs cellules par réutilisation doit être marqué `inference_risk` tant que ces cellules ne sont pas revues.

## 6. Autres constructeurs publics

- `mkAdv`
- `mkAdV`
- `mkAdA`
- `mkAdN`
- `mkCAdv` (2)
- `mkOrd`
- `mkIAdv`
- `mkIP`
- `mkIQuant`
- `mkIDet`
- `mkInterj`
- `mkVoc`
- `mkMU`
- `mkSubj`
- `mkQuant` (16 formes)
- `mkDet` (8 formes + Number)
- `mkConj`
- `mkPConj`
- `mkPron`
- `mkCard`
- `mkACard`
- `mkPredet`
- `mkPrep` (2)
- `noPrep`

Ces constructeurs ne doivent pas disparaître des tests parce qu'ils semblent « simples ».

## 7. Contrat T2 des paradigmes productifs

Pour chaque paradigme productif pertinent, le Compendium demande au minimum :

1. lexème régulier canonique;
2. lexème frontière;
3. lexème avec alternance orthographique;
4. fallback irrégulier;
5. entrée invalide pour smart paradigm.

Les tables doivent être complètes, pas limitées à une forme représentative.

## 8. Contrat T3 de l'API publique

Chaque surcharge publique doit avoir :
- nombre/type d'arguments;
- catégorie retournée;
- formes observables attendues;
- hypothèses de régularité;
- metadata par défaut;
- comportement hors domaine.

## 9. États de maturité d'un paradigme

Ordre autorisé :

`source_seen`
→ `compile_tested`
→ `table_exercised`
→ `linguistically_reviewed`
→ `gold_protected`
→ `boundary_tested`
→ `certified_in_scope`

Un smart paradigm n'atteint pas `certified_in_scope` si ses limites d'entrée ne sont pas testées.

## 10. Registre futur

Le registre machine devra avoir une ligne par :
- symbole API;
- surcharge;
- classe morphologique;
- cellule;
- lexème témoin;
- CASE;
- preuve;
- verdict;
- gold;
- source-lock.

La matrice décrite ici est le schéma conceptuel; les données vivantes ne doivent pas être réécrites manuellement dans ce document.
