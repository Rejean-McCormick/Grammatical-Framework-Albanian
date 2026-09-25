# Producer / Consumer Impact Matrix — types nominaux centraux
> **Document version**: 2.0  
> **Document status**: GENERATED SOURCE-SCAN + REVIEW RULES  
> **Important**: les listes d’occurrences sont un **lower bound lexical**, pas une preuve sémantique. Chaque module listé doit être inspecté avant migration.  
## 1. Contrats courants à ne pas imaginer de mémoire

```text
CURRENT (snapshot verrouillé):
Case = Nom | Acc | Dat | Ablat
Gender = Masc | Fem
GenNum = GSg Gender | GPl
Agr = {gn : GenNum ; p : Person}
Noun = {s : Species => Case => Number => Str ; g : Gender}
Adj = {s : Case => Gender => Number => Str ; clit : Bool}
NP/Pron = {s : Case => Str ; acc_clit, dat_clit : Str ; a : Agr ; isPron : Bool}
Quant = {s : Case => Gender => Number => Str ; spec : Species ; placement : DetPlacement}
Det = {s : Case => Gender => Str ; n : Number ; spec : Species ; placement : DetPlacement}
```
Le code possède déjà `link_clitic : Species => Case => Gender => Number => Str`. La migration N4 ne doit donc pas créer un second service: elle doit **étendre/certifier** la source de vérité existante et l’utiliser pour le futur contexte `Gen`.
## 2. Scan lexical des producteurs/consommateurs

| Symbole | Modules contenant le symbole (occurrences) |
|---|---|
| `Case` | `CatSqi.gf` (16), `ConjunctionSqi.gf` (4), `DocumentationSqi.gf` (2), `ExtendSqi.gf` (2), `ExtendSqiHelpers.gf` (1), `ExtendSqiRNP.gf` (2), `ExtendSqiVPS.gf` (1), `ExtraSqi.gf` (2), `LexiconSqi.gf` (1), `NamesSqi.gf` (1), `NounSqi.gf` (4), `ParadigmsSqi.gf` (9), `ResSqi.gf` (13), `SymbolSqi.gf` (3), `VerbSqi.gf` (2) |
| `Gender` | `CatSqi.gf` (9), `ConjunctionSqi.gf` (3), `ConstructionSqi.gf` (3), `DocumentationSqi.gf` (1), `ExtendSqiHelpers.gf` (4), `ExtendSqiLexicon.gf` (1), `NounSqi.gf` (3), `ParadigmsSqi.gf` (11), `ResSqi.gf` (12), `SymbolSqi.gf` (2) |
| `GenNum` | `CatSqi.gf` (1), `ParadigmsSqi.gf` (1), `ResSqi.gf` (4), `StructuralSqiRes.gf` (1) |
| `Agr` | `CatSqi.gf` (8), `ClauseSqiRes.gf` (10), `ConjunctionSqi.gf` (2), `ConstructionSqi.gf` (3), `ExtendSqi.gf` (15), `ExtendSqiHelpers.gf` (1), `ExtendSqiRNP.gf` (2), `ExtendSqiScaffolding.gf` (1), `ExtendSqiVPS.gf` (9), `ExtraSqi.gf` (6), `IdiomSqi.gf` (4), `NamesSqi.gf` (1), `NounSqi.gf` (1), `ResSqi.gf` (13), `SymbolSqi.gf` (1), `VerbSqi.gf` (6) |
| `GSg` | `ClauseSqiRes.gf` (2), `ConstructionSqi.gf` (1), `IdiomSqi.gf` (1), `NounSqi.gf` (4), `ResSqi.gf` (4), `StructuralSqiNominal.gf` (7), `StructuralSqiRes.gf` (1), `SymbolSqi.gf` (1) |
| `GPl` | `ClauseSqiRes.gf` (1), `ConjunctionSqi.gf` (2), `IdiomSqi.gf` (1), `NounSqi.gf` (3), `ResSqi.gf` (4), `StructuralSqiNominal.gf` (6), `SymbolSqi.gf` (1) |
| `genNum` | `ResSqi.gf` (2) |
| `agrGender` | `ConstructionSqi.gf` (1), `ExtendSqiFocusPrep.gf` (1), `ExtraSqi.gf` (1), `NamesSqi.gf` (1), `ResSqi.gf` (1), `VerbSqi.gf` (3) |
| `agrNumber` | `ClauseSqiRes.gf` (10), `ExtendSqiFocusPrep.gf` (1), `ExtendSqiRNP.gf` (3), `ExtraSqi.gf` (1), `IdiomSqi.gf` (1), `NamesSqi.gf` (1), `ResSqi.gf` (6), `VerbSqi.gf` (6) |
| `agrgP3` | `ConstructionSqi.gf` (3), `ExtendSqiHelpers.gf` (4), `ExtendSqiLexicon.gf` (1), `ExtendSqiRNP.gf` (3), `ExtendSqiScaffolding.gf` (5), `ExtendSqiVPBridge.gf` (2), `NamesSqi.gf` (5), `NounSqi.gf` (6), `ParadigmsSqi.gf` (8), `QuestionSqi.gf` (2), `ResSqi.gf` (1) |
| `Species` | `CatSqi.gf` (3), `ConjunctionSqi.gf` (2), `ExtendSqiHelpers.gf` (1), `ResSqi.gf` (6) |
| `Noun` | `CatSqi.gf` (4), `ConstructionSqi.gf` (1), `NounSqi.gf` (1), `ResSqi.gf` (2) |
| `Adj` | `AdverbSqi.gf` (1), `CatSqi.gf` (2), `NounSqi.gf` (1), `ResSqi.gf` (2) |
| `NP` | `AdjectiveSqi.gf` (2), `CatSqi.gf` (2), `ConjunctionSqi.gf` (1), `ConstructionSqi.gf` (3), `ExtendSqi.gf` (29), `ExtendSqiAPCN.gf` (1), `ExtendSqiExistential.gf` (6), `ExtendSqiFocusPrep.gf` (4), `ExtendSqiHelpers.gf` (5), `ExtendSqiLexicon.gf` (5), `ExtendSqiRNP.gf` (6), `ExtendSqiScaffolding.gf` (21), `ExtendSqiVPBridge.gf` (8), `ExtendSqiVPS.gf` (4), `ExtraSqi.gf` (8), `NamesSqi.gf` (2), `StructuralSqiRes.gf` (3), `SymbolSqi.gf` (3) |
| `PN` | `CatSqi.gf` (1), `ConstructionSqi.gf` (2), `DictSqi.gf` (2), `DictSqiAbs.gf` (2), `ParadigmsSqi.gf` (8) |
| `Det` | `CatSqi.gf` (1), `ExtendSqi.gf` (2), `ExtendSqiScaffolding.gf` (2), `ParadigmsSqi.gf` (2), `ResSqi.gf` (2), `StructuralSqiRes.gf` (2), `SymbolSqi.gf` (3) |
| `Quant` | `CatSqi.gf` (1), `ExtendSqiLexicon.gf` (2), `ExtendSqiScaffolding.gf` (2), `NounSqi.gf` (1), `ParadigmsSqi.gf` (2), `ResSqi.gf` (2), `StructuralSqiRes.gf` (2) |
| `Num` | `CatSqi.gf` (1), `ExtendSqi.gf` (5), `ExtendSqiRNP.gf` (2), `ExtendSqiScaffolding.gf` (3), `ExtraSqi.gf` (2) |
| `Ord` | `CatSqi.gf` (1), `DictSqi.gf` (2), `DictSqiAbs.gf` (2), `LexiconSqi.gf` (2), `ParadigmsSqi.gf` (2), `SymbolSqi.gf` (1) |
| `link_clitic` | `AdjectiveSqi.gf` (2), `AdverbSqi.gf` (1), `DocumentationSqi.gf` (1), `ExtendSqiHelpers.gf` (1), `ExtendSqiRNP.gf` (1), `ExtendSqiScaffolding.gf` (4), `NounSqi.gf` (1), `ResSqi.gf` (1) |

## 3. Scans critiques de migration

- **`cn.g`**: `ConstructionSqi.gf` (1), `ExtendSqiHelpers.gf` (1), `ExtendSqiRNP.gf` (2), `ExtendSqiScaffolding.gf` (6), `NounSqi.gf` (9), `QuestionSqi.gf` (2), `SymbolSqi.gf` (8)
- **`GSg`**: `ClauseSqiRes.gf` (2), `ConstructionSqi.gf` (1), `IdiomSqi.gf` (1), `NounSqi.gf` (4), `ResSqi.gf` (4), `StructuralSqiNominal.gf` (7), `StructuralSqiRes.gf` (1), `SymbolSqi.gf` (1)
- **`GPl`**: `ClauseSqiRes.gf` (1), `ConjunctionSqi.gf` (2), `IdiomSqi.gf` (1), `NounSqi.gf` (3), `ResSqi.gf` (4), `StructuralSqiNominal.gf` (6), `SymbolSqi.gf` (1)
- **`Dat`**: `DictSqi.gf` (3), `DocumentationSqi.gf` (17), `ExtendSqiHelpers.gf` (1), `ExtendSqiRNP.gf` (1), `ExtendSqiScaffolding.gf` (4), `ExtendSqiVPS.gf` (5), `MorphoSqi.gf` (1174), `NounSqi.gf` (3), `ParadigmsSqi.gf` (10), `ResSqi.gf` (9), `StructuralSqiClause.gf` (1), `StructuralSqiNominal.gf` (6), `StructuralSqiRes.gf` (3), `SymbolSqi.gf` (7), `VerbSqi.gf` (2)
- **`Ablat`**: `ConstructionSqi.gf` (1), `DictSqi.gf` (3), `DocumentationSqi.gf` (17), `ExtendSqiHelpers.gf` (1), `ExtendSqiRNP.gf` (2), `ExtendSqiScaffolding.gf` (3), `ExtendSqiVPBridge.gf` (2), `LexiconSqi.gf` (1), `MorphoSqi.gf` (1166), `NounSqi.gf` (4), `ParadigmsSqi.gf` (10), `ResSqi.gf` (8), `StructuralSqiClause.gf` (12), `StructuralSqiNominal.gf` (6), `StructuralSqiRes.gf` (3), `SymbolSqi.gf` (7)
- **`link_clitic`**: `AdjectiveSqi.gf` (2), `AdverbSqi.gf` (1), `DocumentationSqi.gf` (1), `ExtendSqiHelpers.gf` (1), `ExtendSqiRNP.gf` (1), `ExtendSqiScaffolding.gf` (4), `NounSqi.gf` (1), `ResSqi.gf` (1)
- **`agrGender`**: `ConstructionSqi.gf` (1), `ExtendSqiFocusPrep.gf` (1), `ExtraSqi.gf` (1), `NamesSqi.gf` (1), `ResSqi.gf` (1), `VerbSqi.gf` (3)
- **`agrNumber`**: `ClauseSqiRes.gf` (10), `ExtendSqiFocusPrep.gf` (1), `ExtendSqiRNP.gf` (3), `ExtraSqi.gf` (1), `IdiomSqi.gf` (1), `NamesSqi.gf` (1), `ResSqi.gf` (6), `VerbSqi.gf` (6)
- **`agrgP3`**: `ConstructionSqi.gf` (3), `ExtendSqiHelpers.gf` (4), `ExtendSqiLexicon.gf` (1), `ExtendSqiRNP.gf` (3), `ExtendSqiScaffolding.gf` (5), `ExtendSqiVPBridge.gf` (2), `NamesSqi.gf` (5), `NounSqi.gf` (6), `ParadigmsSqi.gf` (8), `QuestionSqi.gf` (2), `ResSqi.gf` (1)

## 4. Migration impact rules

### N1 — `Gen`

Audit obligatoire de **toutes** les tables exhaustives de `Case`, des `Prep/Compl`, pronoms/NP/names, de `PossNP`, `link_clitic`, `ParadigmsSqi`, `StructuralSqi*`, `SymbolSqi`, `DocumentationSqi`, et de chaque module où `Dat`/`Ablat` apparaît. `MorphoSqi` contient plus d’un millier de sélections `Dat/Ablat`; l’ajout de `Gen` ne doit pas conduire à éditer aveuglément ces tables: la stratégie de génération/alias doit être décidée d’abord.

### N2 — `Noun.g : Number => Gender` et `GPl Gender`

Audit obligatoire de chaque `cn.g`, `GSg`, `GPl`, `agrGender`, `agrNumber`, `agrgP3`. Les consommateurs hors `NounSqi` sont bloquants: `ClauseSqiRes`, `ConjunctionSqi`, `ConstructionSqi`, `ExtendSqi*`, `ExtraSqi`, `IdiomSqi`, `QuestionSqi`, `SymbolSqi`, `VerbSqi`, `NamesSqi`, `StructuralSqi*`.

### N4/N5 — *nyje* et adjectifs

`link_clitic` est déjà consommé dans `AdjectiveSqi`, `AdverbSqi`, `ExtendSqiHelpers`, `ExtendSqiRNP`, `ExtendSqiScaffolding`, `NounSqi`. Toute correction de sa matrice doit être testée contre ces consommateurs, pas seulement `AdjCN`.

## 5. Exit condition d’un changement de type

Un changement `ResSqi/CatSqi` n’est mergeable que si:

1. tous les modules de cette matrice ont été classés `changed / inspected-no-change / not-applicable`;
2. aucun match nouveau n’apparaît dans un rescan sans entrée de revue;
3. les tests ciblés couvrent producteurs **et** dernier consommateur;
4. le full gate de `19_BASELINE_EVIDENCE_LOCK.md` est vert.
