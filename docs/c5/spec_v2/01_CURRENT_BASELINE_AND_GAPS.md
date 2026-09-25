---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 01 — Baseline actuelle et écarts prouvés

## Baseline observée

**BASELINE_FACT** — le snapshot courant utilise notamment :

- `ResSqi.Case = Nom | Acc | Dat | Ablat`;
- `Compl = {s : Str ; c : Case}` et `Prep = Compl`;
- `Pron = {s : Case => Str ; acc_clit, dat_clit : Str ; a : Agr ; isPron : Bool}`;
- `VP.cl : Str` et `VP.subjcl : Str`;
- `VPSlash = VP ** {c2 : Compl}`;
- `VerbSqi.saturateSlash` choisit la forme pleine ou faible selon `isPron` et `c2.c`;
- une NP dative non pronominale reçoit actuellement un clitique datif de doubling;
- `ClauseSqiRes` centralise déjà une part importante de la réalisation;
- `QuestionSqi.PrepIP` et `RelativeSqi.RelSlash` appliquent le cas de la préposition/du slash.

## Gaps structuraux

### G1 — pas de distinction syntaxique Gen/Dat

Les références décrivent cinq fonctions casuelles, avec Gen/Dat morphologiquement syncrétiques. Le type courant n'exprime pas `Gen`.

### G2 — `cl/subjcl` sont deux autorités parallèles fragiles

`addClitic` et `appendClitic` concatènent `cl`, mais **remplacent** `subjcl` par la dernière valeur calculée. Cette architecture ne conserve ni l'historique des rôles ni le cluster complet. Elle ne peut pas constituer le modèle final.

### G3 — l'ordre Dat/Acc est implicite

L'ordre dépend aujourd'hui de l'ordre des opérations de saturation. La cible exige un cluster commutatif au niveau de la construction et ordonné seulement au flattening.

### G4 — `po` est mélangé à la chaîne clitique

`ProgrVP` et `vp_ProgrVPSlash` préfixent `po` à `cl/subjcl`. `po` est une particule préverbale et doit avoir un propriétaire distinct du cluster pronominal.

### G5 — `u` a plusieurs fonctions linguistiques

Le code `ReflVP` insère `u`; les références documentent aussi un `u` de non-actif dans certains domaines. L'identité orthographique n'autorise pas une identité de rôle interne.

### G6 — gouvernement de `nga`

La référence fournie classe `nga`/`tek` avec objet nominatif. Le source courant encode `from_Prep` et `by8agent_Prep` comme `nga + Ablat`; `ExtendSqiVPBridge` construit aussi un agent avec `nga Ablat`. Ces sites doivent être revus ensemble, mais la lexicalisation exacte de chaque fonction RGL reste une décision sémantique séparée.

### G7 — pseudo-génitif `possess_Prep`

`possess_Prep = mkCompl "i" Dat` ne peut pas être le modèle général du génitif albanais. `NounSqi.PossNP` possède déjà une logique de linker + forme Dat; elle doit être rapprochée de la future distinction syntaxique sans dupliquer deux systèmes concurrents.

### G8 — divergence proximale attestée

La table de référence de `ky/kjo` donne Acc Pl `këta/këto`; toute cellule courante différente doit être corrigée avec test ciblé.

### G9 — `cili` existe partiellement mais l'API relative reste incomplète

`which_IQuant` encode un paradigme de `cili`, tandis que `IdRP` reste invariant `që`. La cible doit définir constructeur par constructeur quand l'invariant et le relatif décliné sont utilisés.

## Non-bugs à ne pas « réparer » sans preuve

- une seule variante Standard correcte peut être une sortie canonique même si d'autres variantes grammaticales existent;
- syncrétisme morphologique Gen/Dat est permis, fusion syntaxique Gen=Dat ne l'est pas;
- `që` peut rester correct dans des relatives appropriées;
- DRAFT-MAX n'est pas une source d'autorité par son existence.
