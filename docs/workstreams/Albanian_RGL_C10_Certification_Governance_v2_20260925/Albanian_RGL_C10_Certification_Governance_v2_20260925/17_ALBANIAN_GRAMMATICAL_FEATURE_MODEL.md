---
document_role: grammatical_feature_model
status: source_grounded_working_model
version: 1.0
date: 2026-09-25
source_lock_scope: Albanian snapshot 20260925
---

# Modèle grammatical Albanian — source GF vs cible linguistique

## 1. Principe

Ce document sépare trois choses :

1. **représentation GF courante**;
2. **faits linguistiques attestés dans les références fournies**;
3. **obligation de certification**.

Une différence entre 1 et 2 est une question d'architecture/équivalence, pas automatiquement un bug.

## 2. Paramètres nominaux

| Dimension | Source GF courante | Référence linguistique fournie | Conséquence certification |
|---|---|---|---|
| `Species` | `Indef / Def` | noms fléchissent en définitude; article défini postposé | certifier toutes les cellules pertinentes |
| `Case` | `Nom / Acc / Dat / Ablat` | 5 cas : nominatif, accusatif, datif, génitif, ablatif; datif/génitif morphologiquement identiques | certifier la stratégie constructionnelle du génitif |
| `Gender` | `Masc / Fem` | masculin, féminin; statut du neutre signalé comme disputé | ne pas inventer un neutre GF; décision explicite requise |
| `Number` | `Sg / Pl` via ParamX | singulier/pluriel | certifier les deux |
| `Person` | `P1 / P2 / P3` via ParamX | personnes verbales/pronominales | certifier selon catégorie |

### Génitif

Le code courant n'a pas de constructeur `Gen` dans `ResSqi.Case`.

`NounSqi.PossNP` construit actuellement le possessif avec :
- le nom possédé;
- un `genitiveLink` (`i/e`);
- la forme `np.s ! Dat`.

La référence générale décrit datif et génitif comme morphologiquement identiques et indique que le `nyje` distingue notamment le génitif.

**Statut : architecture plausible et source-grounded, mais équivalence linguistique à certifier par CASEs dédiés.**

## 3. Accord

Source :
- `GenNum = GSg Gender | GPl`;
- `Agr = {gn : GenNum ; p : Person}`.

Conséquence :
- le genre est représenté au singulier dans `Agr`;
- `GPl` ne porte pas de genre;
- les constructions qui nécessitent du genre pluriel doivent être inspectées au niveau de leurs propres tables, pas supposées via `Agr`.

## 4. Noms

`Noun = {s : Species => Case => Number => Str ; g : Gender}`.

Univers observable par nom courant :
- 2 species × 4 cases × 2 numbers = **16 cellules de surface**;
- plus un genre lexical.

`mkNFull` expose précisément ces 16 cellules.

Obligation :
- table complète pour les paradigmes de référence;
- tests de syncrétisme;
- test du genre lexical;
- tests constructionnels séparés pour génitif/possessif.

## 5. Adjectifs et AP

`Adj = {s : Case => Gender => Number => Str ; clit : Bool}`.

Univers lexical :
- 4 cases × 2 genders × 2 numbers = **16 cellules**;
- + `clit` (article de liaison requis ou non).

`AP = {s : Species => Case => Gender => Number => Str}`.

Univers de réalisation AP :
- 2 species × 4 cases × 2 genders × 2 numbers = **32 combinaisons**.

`ResSqi.link_clitic` possède une table Species × Case × Gender × Number.

Obligation :
- certifier forme adjective et article de liaison séparément;
- certifier leur composition;
- ne pas confondre `të/e/i/së` avec les autres fonctions homographes.

## 6. Pronoms et clitiques

`Pron` courant :
- `s : Case => Str` = 4 formes casuelles;
- `acc_clit : Str`;
- `dat_clit : Str`;
- `a : Agr`;
- `isPron : Bool`.

`mkPron` requiert explicitement :
- nom;
- acc;
- dat;
- ablatif;
- clitique accusatif;
- clitique datif;
- accord.

Obligation :
- certifier formes libres et faibles séparément;
- certifier placement/cluster dans la syntaxe.

## 7. Quantifieurs et déterminants

`Quant` :
- Case × Gender × Number = **16 cellules**;
- `spec`;
- `placement`.

`Det` :
- Case × Gender = **8 cellules**;
- nombre;
- species;
- placement.

Conséquence :
la certification doit inclure le placement (`PreNominal` / `PostNominal`) et pas uniquement les chaînes.

## 8. Verbe lexical

`Verb` courant expose :

- `Indicative : Tense => Number => Person => Str`
- `Subjunctive : Number => Person => Str`
- `Imperative : Number => Str`
- `participle : Str`
- `pres_optative : Number => Person => Str`
- `perf_optative : Number => Person => Str`
- `pres_admirative : Number => Person => Str`
- `imperf_admirative : Number => Person => Str`

`Tense` interne :
- `Pres`
- `Past`
- `Imperfect`
- `Aorist`

### Nombre de cellules observables

- Indicative : 4 × 2 × 3 = 24
- Subjunctive : 2 × 3 = 6
- Imperative : 2
- Participle : 1
- Pres optative : 6
- Perf optative : 6
- Pres admirative : 6
- Imperf admirative : 6

Total : **57 cellules observables**.

`mkVerb` reçoit **51 formes explicites**, car les 6 cellules de subjonctif sont dérivées par `subjunctiveFromPresent`.

Conséquence critique :
les cellules dérivées doivent être certifiées indépendamment; elles ne sont pas validées par la seule correction du présent.

## 9. Tense RGL public vs tense morphologique Albanian

`ResSqi.sqiTense` mappe actuellement :

- `ParamX.Pres -> Pres`
- `ParamX.Past -> Aorist`
- `ParamX.Fut -> Pres`
- `ParamX.Cond -> Imperfect`

`futureParticle` ajoute `do të` pour Fut et Cond.

La référence générale décrit le futur Tosk par `do` + subjonctif et Standard Albanian comme majoritairement basé sur Tosk.

**Obligation :** tester la réalisation complète de Fut/Cond au niveau clause, pas conclure à partir du mapping interne seul.

## 10. Négation

Source courante :
`Neg -> "nuk"` dans `ResSqi.negation`.

Obligation :
- position;
- clitiques;
- auxiliaires;
- impératif/marked moods;
- variantes éventuelles.

## 11. Voix / non-actif

Les sources morphologiques contiennent des familles et commentaires non-actifs; le `Verb` record courant n'encode cependant pas une dimension `Voice`.

**Non-claim :** ce document ne conclut ni « voix complète » ni « voix manquante ». L'architecture doit être auditée à travers `MorphoSqi`, `IrregSqi`, clause assembly et constructions avant verdict.

## 12. Questions structurantes encore ouvertes

Voir `28_OPEN_QUESTIONS_REGISTER.md`, notamment :
- statut du neutre;
- exhaustivité du génitif constructionnel;
- couverture voix/non-actif;
- validité des dérivations smart;
- statut standard vs dialectal de formes sensibles.

## 13. Source anchors

Faits GF de ce document à revalider si le source-lock change :

- `AlbanianSQI/GF/lib/src/albanian/ResSqi.gf`
  - `Species`, `Case`, `Gender`, `GenNum`, `Agr`;
  - `Tense`, `Verb`, `subjunctiveFromPresent`, `mkVerb`;
  - `sqiTense`, `negation`, `futureParticle`, `link_clitic`.
- `AlbanianSQI/GF/lib/src/albanian/CatSqi.gf`
  - lincats N/N2/N3, A/A2, V*, AP, CN, NP, Pron, Quant, Det.
- `AlbanianSQI/GF/lib/src/albanian/NounSqi.gf`
  - `genitiveLink`, `PossNP`, détermination/possessifs.
- `AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf`
  - aliases publics, `mkNFull`, `mkN*`, `mkA*`, `mkV*`, `mkPron`, `mkQuant`, `mkDet`.
- `Albanian_ref/Albanian_Complete_Grammar.html`
  - description générale des cas, définitude, article postposé, `nyje`, dialectes, futur Tosk/Geg et Standard Albanian.

Ces anchors identifient les endroits à relire; les claims détaillés doivent être convertis en evidence records atomiques dans les campagnes.
