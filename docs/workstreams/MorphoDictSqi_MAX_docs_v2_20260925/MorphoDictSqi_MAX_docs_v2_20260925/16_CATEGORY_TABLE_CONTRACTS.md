# Contrats de tables par catégorie

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Source de vérité

Ces contrats décrivent **le snapshot Albanian verrouillé**. Ils doivent être revalidés si `CatSqi.gf`, `ResSqi.gf` ou les abstractions RGL changent.

## 2. Catégories flexionnelles ouvertes

### `N`

`Noun = {s : Species => Case => Number => Str ; g : Gender}`.

Ordre canonique : `Species [Indef,Def] × Case [Nom,Acc,Dat,Ablat] × Number [Sg,Pl]` = 16 cellules, puis `g ∈ {Masc,Fem}`.

Pour un N ordinaire C6, les 16 cellules doivent être explicitement réalisables par la table, sauf défautivité documentée par décision.

### `A`

`Adj = {s : Case => Gender => Number => Str ; clit : Bool}`.

Ordre : `Case [Nom,Acc,Dat,Ablat] × Gender [Masc,Fem] × Number [Sg,Pl]` = 16 cellules + `clit`.

### `V`

`Verb` contient :

- Indicative : `Tense [Pres,Past,Imperfect,Aorist] × Number [Sg,Pl] × Person [P1,P2,P3]` = 24 ;
- Subjunctive : 2×3 = 6 ;
- Imperative : 2 ;
- participle : 1 ;
- pres_optative : 6 ;
- perf_optative : 6 ;
- pres_admirative : 6 ;
- imperf_admirative : 6.

Signature réalisée : **57 surfaces**. Le constructeur `mkVerb` courant prend 51 chaînes car le Subjunctive est dérivé du présent ; la signature de table doit néanmoins inclure les 57 sorties réalisées.

## 3. Catégories à cas/accord

### `PN`

4 surfaces `Case [Nom,Acc,Dat,Ablat]` + `Agr` (`GenNum`, `Person`). Les overloads invariants sont compatibles structurellement mais ne certifient pas une déclinaison réelle si une source montre des cas distincts.

### `IP`

4 surfaces de cas + `Agr`.

### `Pron`

4 surfaces de cas + `acc_clit`, `dat_clit`, `Agr`, `isPron`. Les clitiques vides peuvent être légitimes ; ne pas appliquer V10 comme « aucune chaîne vide ».

### `NP`

Même shape que `Pron` dans le snapshot courant. Les entrées MorphoDict NP sont des unités fermées/exactes ; elles ne doivent pas devenir une catégorie d'expansion lexicale libre sans décision.

## 4. Déterminants / quantification

### `Quant`

16 surfaces `Case×Gender×Number` + `spec : Species` + `placement : DetPlacement`.

### `IQuant`

16 surfaces `Case×Gender×Number`.

### `Det`

8 surfaces `Case×Gender` + `spec`, `n : Number`, `placement`.

### `IDet`

8 surfaces `Case×Gender` + `n`.

### `Predet`

Surface invariant `s : Str` dans `CatSqi` courant.

## 5. Gouvernement

### `Prep`

`Compl = {s : Str ; c : Case}`. La signature inclut la chaîne et le cas gouverné. Deux prépositions homographes avec gouvernement distinct peuvent être des lemgrammes morphologiquement distincts selon ce contrat.

## 6. Catégories invariantes / fermées

- `Subj = {s : Str}`
- `Conj = {s : Str}`
- `IAdv` via `mkIAdv : Str -> IAdv`
- `Adv` via `mkAdv : Str -> Adv`
- `Interj` via `mkInterj : Str -> Interj`

Pour `Adv/Interj`, la shape exacte est héritée de la couche commune ; le constructeur public courant prouve l'invariant `s`. Revalider ce contrat si l'abstraction/lincat upstream change.

## 7. Complétude et zéro

V10 fonctionne par catégorie :

- cellules morphologiques ordinaires N/A/V : non vides par défaut pour C6 ;
- champs structuraux tels que clitiques peuvent être vides si le type l'autorise ;
- toute défautivité lexicale doit être explicite dans le record et soutenue par preuve/décision ;
- un `[]` utilisé comme placeholder n'est jamais « forme absente certifiée ».
