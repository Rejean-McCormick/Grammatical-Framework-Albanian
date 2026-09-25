# Architecture nominale cible

> **Document version**: 2.0  
> **Document status**: NORMATIVE  
> **Baseline evidence authority**: `19_BASELINE_EVIDENCE_LOCK.md`  
> **Source/provenance authority**: `02_SOURCE_LOCK_AND_AUTHORITY.md`  

> **Projet**: Albanian RGL — domaine nominal complet  
> **Date de verrouillage documentaire**: 2026-09-25  
> **Baseline d’intégration fournie par le mainteneur**: `albanian-s02-green-20260925`  
> **GF**: 3.12  
> **GF Wordbench**: 1.3.4  
> **Gate d’intégration**: voir `19_BASELINE_EVIDENCE_LOCK.md`  
> **Certification linguistique globale**: non établie  
> **Principe**: compilation verte ≠ certification linguistique.  

## 1. État actuel pertinent

Le code courant stocke notamment :

- `Case = Nom | Acc | Dat | Ablat` ;
- `Gender = Masc | Fem` ;
- `GenNum = GSg Gender | GPl` ;
- `Noun = {s : Species => Case => Number => Str ; g : Gender}` ;
- `Adj = {s : Case => Gender => Number => Str ; clit : Bool}` ;
- `AP = Species => Case => Gender => Number => Str` ;
- `NP = Case => Str + clitiques + Agr + isPron` ;
- `Quant` et `Det` portent formes, définitude (`spec`) et placement.

Cette structure compile, mais deux pertes d’information sont incompatibles avec la cible finale :

1. le génitif n’existe pas comme contexte grammatical distinct ;
2. le genre est perdu dans `GPl`, et `Noun.g` ne peut pas changer avec le nombre.

## 2. Architecture cible — décisions de base

### A. Cas grammatical explicite

**DECISION NOM-ARCH-001**

```gf
param Case = Nom | Acc | Gen | Dat | Ablat ;
```

Le génitif et le datif peuvent rester **morphologiquement syncrétiques** dans les tables nominales. Ils ne doivent pas être confondus au niveau syntaxique, car le génitif albanais est associé à une réalisation par *nyje* et à des constructions distinctes.

Principe : **syncrétisme de surface ≠ identité de contexte grammatical**.

### B. Genre dépendant du nombre

**DECISION NOM-ARCH-002**

```gf
Noun.g : Number => Gender
```

Un nom ordinaire peut avoir `{Sg => Masc ; Pl => Masc}` ou `{Sg => Fem ; Pl => Fem}`. Un nom ambigénérique peut avoir `{Sg => Masc ; Pl => Fem}` lorsque la preuve l’exige.

Tous les consommateurs doivent demander `n.g ! number`, jamais un genre global.

### C. Accord préservant le genre au pluriel

**DECISION NOM-ARCH-003**

Version minimale compatible avec le travail DRAFT-MAX inspecté :

```gf
param GenNum = GSg Gender | GPl Gender ;
```

Une autre représentation est possible seulement si elle préserve exactement les mêmes informations et simplifie réellement producteurs/consommateurs.

Aucune conversion vers un accord « générique pluriel » n’est autorisée avant le dernier consommateur qui a besoin du genre.

### D. Séparation morphologie adjectivale / article de liaison

**DECISION NOM-ARCH-004**

Les références fournies indiquent que l’adjectif albanais varie principalement en **genre et nombre**, tandis que le contexte cas/définitude gouverne notamment la *nyje*.

Cible conceptuelle :

```text
lexical A morphology: Gender × Number (+ classe/articulatedness)
AP realization context: Species × Case × Gender × Number
nyje selection: Species × Case × Gender × Number
```

Le type GF exact de `Adj` peut rester temporairement plus large pendant la migration, mais les tests doivent empêcher de créer de fausses « flexions de cas » du radical adjectival lorsque seule la *nyje* change.

### E. *Nyje* comme service central

**CURRENT + DECISION NOM-ARCH-005**

Le source courant possède déjà `ResSqi.link_clitic : Species => Case => Gender => Number => Str`. Ce service est la **source de vérité à conserver**, pas une fonctionnalité à recréer. N4 doit le certifier, ajouter le futur contexte `Gen` lors de N1 et éliminer/justifier les sélections locales concurrentes.

Une seule opération centrale doit déterminer la forme appropriée (`i/e/të/së`) selon les traits nécessaires. Aucun module consommateur ne doit reconstruire ces formes par conditions locales ou concaténation ad hoc.

Consommateurs :

- adjectifs articulés ;
- génitif nominal ;
- certains possessifs ;
- ordinaux/adjectifs lorsque la grammaire l’exige ;
- autres constructions prouvées ultérieurement.

### F. Noun/CN

La table de surface cible reste conceptuellement :

```text
Species × Case × Number -> Str
```

avec :

```text
gender: Number -> Gender
```

`CN` peut continuer à réutiliser `Noun` tant que toutes les informations nécessaires aux modificateurs et à l’accord sont conservées. On ne doit pas ajouter de champ à `CN` sans producteur + consommateur + test.

### G. NP/Pron

`NP.s : Case => Str` reste une bonne frontière si chaque contexte de cas possède une réalisation déterministe. `NP.a` doit conserver le genre et le nombre effectifs. Les formes clitiques Acc/Dat restent distinctes des formes pleines.

Le futur `Gen` doit être un vrai chemin de sélection dans NP/Pron même si certaines formes coïncident avec Dat.

### H. Determiners / Quantifiers / possession

`Det` et `Quant` doivent conserver :

- forme conditionnée par les traits réellement nécessaires ;
- nombre ;
- contribution de définitude ;
- placement lorsque la position pré/postnominale est grammaticalement pertinente.

La possession doit être construite par le système central : accord du possesseur + traits du possédé + placement + définitude. Les exceptions de parenté seront traitées comme classe explicite si elles sont suffisamment productives et attestées.

### I. Numéraux

Le `Number` simple est conservé tant qu’il suffit. Si les références montrent plusieurs classes productives de gouvernement, ajouter une **classe typée de gouvernement numéral** propagée compositionnellement ; ne jamais la déduire de `Str`.

### J. Noms propres

`PN/GN/LN/SN` doivent conserver les formes de cas et l’accord nécessaires. Les constructeurs à une chaîne peuvent rester des raccourcis de compatibilité, mais ils représentent une hypothèse « invariant par cas » et ne doivent pas servir de gold pour des noms qui se fléchissent.

## 3. Frontières de responsabilité

| Module | Responsabilité finale |
|---|---|
| `ResSqi.gf` | paramètres, records et services partagés (cas, accord, *nyje*) |
| `CatSqi.gf` | lincats conformes aux abstractions, sans logique linguistique cachée |
| `MorphoSqi.gf` | paradigmes flexionnels et classes productives |
| `ParadigmsSqi.gf` | API publique sûre vers la morphologie |
| `NounSqi.gf` | composition nominale (Det/CN/NP, génitif, possession, relatives…) |
| `AdjectiveSqi.gf` | formation/AP, degré, compléments ; pas de réparation de noms |
| `NumeralSqi.gf` | construction des nombres et métadonnées de gouvernement justifiées |
| `NamesSqi.gf` | composition des catégories Names avec cas/accord |
| `StructuralSqiNominal.gf` | lexèmes structuraux certifiés, pas de paradigmes cachés |

## 4. DRAFT-MAX

Trois idées de checkpoint 2 correspondent à des besoins indépendamment attestés et peuvent être réintroduites **une par une** :

- `Gen` explicite ;
- `GPl Gender` ;
- `Noun.g : Number => Gender`.

Le reste de l’overlay DRAFT-MAX n’est pas autorisé par cette documentation. Chaque migration doit être propagée à tous les producteurs/consommateurs et passer les gates avant la suivante.

## 5. Exact current impact

Avant toute modification de ces types, utiliser `14_PRODUCER_CONSUMER_IMPACT_MATRIX.md`. Les formes exactes de l’abstract sont dans `12_EXACT_RGL_CONTRACT_LOCK.md`; ce document ne doit pas les paraphraser comme nouvelle signature.
