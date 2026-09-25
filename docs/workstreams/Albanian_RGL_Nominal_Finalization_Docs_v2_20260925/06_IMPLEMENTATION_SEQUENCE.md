# Séquence de construction et migrations

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

## Principe

Une seule frontière de représentation fondamentale est migrée à la fois. Chaque étape retourne à une baseline verte avant l’étape suivante. Une étape qui ne peut pas être rendue verte est revert/isolée ; elle n’est pas contournée par un placeholder.

## N0 — verrouillage et tests de caractérisation

**Code changé** : aucun core.  
**Livrables** : tests qui capturent les sorties actuelles utiles + cas linguistiques minimaux attestés.

- figer 58/58 + 52/52 ;
- ajouter des tests de caractérisation pour noms masculins/féminins/ambigénériques, *nyje*, possessifs, démonstratifs et ordinaux ;
- distinguer `current-output` et `expected-linguistic` lorsqu’ils divergent.

## N1 — cas `Gen` explicite

**Fichiers principaux** : `ResSqi`, `CatSqi`, `NounSqi`, `ParadigmsSqi`, `StructuralSqiNominal`, pronoms/names et consommateurs de `Case`.

1. ajouter `Gen` ;
2. pour la morphologie nominale, initialement aliaser Gen aux formes Dat là où la référence établit le syncrétisme ;
3. propager les tables exhaustivement ;
4. faire utiliser `Gen` à `PossNP` et aux consommateurs génitifs ;
5. vérifier que la *nyje* dépend du contexte tête/modificateur correct.

**Gate** : 58/58 + 52/52 + tests Gen/Dat distincts au niveau syntaxique.

## N2 — genre dépendant du nombre

**Fichiers principaux** : `ResSqi`, `CatSqi`, `MorphoSqi`, `ParadigmsSqi`, `NounSqi`, `NamesSqi`, relatives/coordination consommateurs d’`Agr`.

1. migrer `Noun.g` vers `Number => Gender` ;
2. migrer `GenNum` vers une forme qui conserve le genre au pluriel ;
3. centraliser `agrGender`/`agrNumber` ;
4. remplacer chaque accès `cn.g` par `cn.g ! n` au bon point ;
5. ajouter au moins un nom ambigénérique validé et des contrastes d’accord sg/pl.

**Gate** : aucune régression d’accord des noms ordinaires + tests ambigénériques verts.

## N3 — paradigmes nominaux MAX

**Fichiers** : `MorphoSqi`, `ParadigmsSqi`, `IrregSqi` si approprié, tests morpho.

- inventorier les classes nominales réellement utilisées ;
- documenter principal parts et limites de chaque smart constructor ;
- couvrir féminins, masculins, pluriels à suffixe, alternances, invariants, ambigénériques ;
- introduire constructeurs explicites avant d’ajouter une exception dans un dispatcher générique ;
- tests complets des 20 cellules nominales conceptuelles (2 species × 5 case × 2 number), y compris cellules syncrétiques.

## N4 — service *nyje* + génitif/possession

**Fichiers** : `ResSqi`, `NounSqi`, `AdjectiveSqi`, `StructuralSqiNominal`.

- une source de vérité pour `i/e/të/së` ;
- `PossNP` via `Gen` ;
- tests du genre/nombre/cas/définitude de la tête ;
- valider les possessifs post-nominaux ;
- traiter les possessifs pré-nominaux de parenté dans une étape séparée si la classe lexicale est établie.

## N5 — architecture adjectivale

**Fichiers** : `ResSqi`, `MorphoSqi`, `ParadigmsSqi`, `AdjectiveSqi`, `NounSqi`.

- inventorier formes lexicales par genre/nombre ;
- distinguer articulé/non articulé explicitement ;
- empêcher le cas de créer une fausse variation du radical ;
- certifier `AdjCN`, AP prédicatif, A2, comparatif/superlatif/ordinal ;
- tests de *nyje* séparés des tests de radical.

## N6 — Det / Quant / Pron / possession structurale

**Fichiers** : `NounSqi`, `StructuralSqiNominal`, `ResSqi`, éventuellement `ParadigmsSqi`.

- démonstratifs complets ;
- articles et `Species` ;
- interrogatifs `cili` ;
- pronoms personnels/weak forms sans mélange de responsabilités ;
- possessifs complets ;
- éliminer les defaults de genre non justifiés dans `DetNP`, `CountNP`, etc. ou les documenter comme abstractions intrinsèques si l’abstract ne fournit pas l’information.

## N7 — numéraux + accord/gouvernement

**Fichiers** : `NumeralSqi`, `NounSqi`, `CatSqi/ResSqi` seulement si une nouvelle métadonnée est prouvée.

- valider cardinaux et boundaries ;
- remplacer les ordinaux approximatifs par formes attestées ;
- établir par preuve si des classes de gouvernement distinctes sont nécessaires ;
- si oui, ajouter un type `NumeralGov` central et le propager ; sinon, ne pas complexifier.

## N8 — noms propres

**Fichiers** : `NamesSqi`, `ParadigmsSqi`, tests.

- établir règles standard de cas pour noms/surnoms/toponymes ;
- conserver constructeurs invariants seulement lorsque corrects ou explicitement fallback ;
- tester `GivenName`, `FullName`, `InLN`, adjectival modification, cas obliques.

## N9 — intégration nominale et parité

- audit function-by-function des abstractions Noun/Adjective/Numeral/Names ;
- audit des consommateurs indirects : relatives, conjunction, question, clause agreement, Extend/Extra ;
- rerun complet 58/58 + 52/52 (ou census augmenté) ;
- promotion de golds uniquement après revue ;
- mise à jour du status/parity roadmap.

## Règle de merge

`N1` à `N8` doivent produire des commits/overlays indépendants. Aucun patch ne doit mélanger « ajout de Gen », « refonte du genre », « refonte adjectivale » et « numéraux » dans une seule migration irréversible.

## Contrats v2

Chaque étape est soumise aux entry/exit/rollback gates de `17_MIGRATION_CONTRACTS.md`. N1/N2 exigent un rescan et une classification complète de `14_PRODUCER_CONSUMER_IMPACT_MATRIX.md`.
