---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 02 — Architecture typée cible

## Principe

**C5-REQ-013 — NORMATIVE_TARGET** — chaque fait grammatical a un propriétaire typé unique. La syntaxe GF exacte reste `PROVISIONAL_DESIGN` jusqu'au spike GF 3.12 correspondant.

## 2.1 Cas : distinguer fonction syntaxique et cellule morphologique

La cible sémantique a cinq fonctions :

```text
SyntaxCase = Nom | Acc | Gen | Dat | Ablat
```

Une optimisation importante est de **ne pas supposer** que chaque table morphologique doit immédiatement gagner une cinquième cellule si Gen et Dat sont syncrétiques. Deux implémentations sont admissibles au spike :

- **Option A** : étendre `Case` à cinq valeurs et remplir explicitement toutes les tables;
- **Option B** : séparer `SyntaxCase` de `MorphCase`, avec un mapping propriétaire `Gen -> DatCell` là où le syncrétisme est réel.

**OPEN/BLOCKING** — le choix A/B doit être pris avant la migration du type de cas. Interdit : créer deux enums sans mapping propriétaire ou utiliser `Dat` comme alias silencieux du génitif.

## 2.2 Compléments / prépositions

Contrat minimal :

```text
Compl = {
  surface : Str ;
  governedCase : SyntaxCase ;
  realizationMode : optional typed metadata
}
```

`realizationMode` n'est admis que pour une différence démontrée (adposition libre, linker génitif, complément non prépositionnel, etc.).

## 2.3 Pron / NP

Contrat sémantique :

```text
Pron = {
  full    : SyntaxCase => Str ;
  weakAcc : WeakCapability ;
  weakDat : WeakCapability ;
  agr     : Agr ;
  person  : Person
}

NP = {
  full    : SyntaxCase => Str ;
  weakAcc : WeakCapability ;
  weakDat : WeakCapability ;
  agr     : Agr ;
  nominalKind : metadata
}
```

Une NP non pronominale peut déclencher un doubling datif sans devenir artificiellement un pronom.

## 2.4 CliticCluster

Le cluster appartient aux **arguments faibles**, pas aux particules TAM/voix.

```text
CliticCluster = {
  dat  : Optional WeakArgument ;
  acc  : Optional WeakArgument ;
  refl : Optional ReflexiveArgument
}
```

Invariants :

1. Dat, Acc, Refl sont des rôles, jamais déduits de l'orthographe.
2. La fusion est pure et centralisée.
3. L'ordre de construction n'affecte pas la sortie.
4. La contraction avec `të` intervient après flattening.
5. `u` de voix/non-actif n'est **pas** stocké dans `refl`; il arrive via une interface distincte du workstream voix/TAM.

## 2.5 Domaine préverbal

La clause doit pouvoir composer au moins :

```text
PreverbalContext = {
  polarity/negator ;
  futureConditionalMarker ;
  subjunctiveMarker ;
  progressiveMarker ;
  voiceMarker ;
  cliticCluster
}
```

Cette structure est sémantique : les champs GF exacts peuvent être plus compacts, mais ils ne doivent pas recréer une liste libre de `Str` sans ownership.

## 2.6 VP / VPSlash

`VP` conserve les paradigmes verbaux, `CliticCluster`, le contexte préverbal structuré nécessaire et les compléments postverbaux différés. `VPSlash` porte le même état plus le `Compl` non saturé.

`ComplSlash`, `ReflVP`, `Slash2V3`, `Slash3V3`, `SlashVV`, `VPSlashPrep`, questions et relatives doivent transporter l'information sans flattening prématuré.

## 2.7 Frontière de réalisation

Une famille limitée de helpers dans/près de `ClauseSqiRes` est l'autorité pour :

1. sélectionner la forme verbale/auxiliaire demandée par le contexte;
2. sélectionner négation et marqueurs;
3. flattening Dat+Acc/Refl;
4. contraction `të` + cluster;
5. position de `po`;
6. interface au marqueur de voix/non-actif;
7. assemblage final avec `post`.

Les modules `Sentence/Question/Relative/Extend` peuvent choisir leur construction RGL, mais ne doivent pas posséder leur propre algorithme concurrent de cluster.
