# Ownership global — Conversations 1 à 10

| Conversation | Domaine propriétaire | Modules / données principaux |
|---:|---|---|
| 1 | Morphologie fondamentale | `ResSqi`, `MorphoSqi`, `ParadigmsSqi`, `IrregSqi` |
| 2 | MorphoDict | `src/morphodict/MorphoDictSqi*`, source universe, tables, provenance morphologique |
| 3 | Dict + Lexicon | `DictSqi*`, `LexiconSqi`, catégories/valence lexicales, provenance lexicale |
| 4 | TAM + auxiliaires + voix | contrat `Verb/VP`, tense mapping, perfects, progressive, passive/non-active, realizer verbal |
| 5 | Clitiques + pronoms + cas + prépositions | `CliticCluster`, pronoms, `Compl/Prep`, gouvernement, placement |
| 6 | Domaine nominal | `NounSqi`, `AdjectiveSqi`, `NumeralSqi`, `NamesSqi`, `StructuralSqiNominal`, accord nominal |
| 7 | Clause | `ClauseSqiRes`, `SentenceSqi`, `QuestionSqi`, `RelativeSqi`, clause-level extensions |
| 8 | Valence / compléments / coordination / constructions | `VerbSqi` valence layer, `ConjunctionSqi`, `ConstructionSqi`, `IdiomSqi`, copule/prédication secondaire |
| 9 | Surface avancée + API publique | `StructuralSqi`, `ExtendSqi*`, `ExtraSqi*`, `DocumentationSqi`, `SymbolSqi`, `MarkupSqi`, façades `Syntax/Constructors/Combinators/Try/Symbolic` |
| 10 | Certification / Gold / Parité | campagnes CASE, golds, dashboard, matrices, release gates, vocabulaire normatif |

## Shared-contract rule

Les types centraux de `ResSqi` n'appartiennent jamais à un workstream isolé lorsqu'ils affectent plusieurs domaines. Le propriétaire de code reste C1, mais une migration de `Case`, `Agr`, `Noun`, `Adj`, `Verb`, `VP` exige sign-off des owners consommateurs concernés.

## Routage de bugs

- forme lexicale/paradigme -> C1 ;
- lemgramme/provenance morphologique -> C2 ;
- catégorie/valence lexicale -> C3 ;
- TAM/voice/aux -> C4 ;
- weak pronouns/case government -> C5 ;
- accord/NP/CN/AP/Det/Num -> C6 ;
- sentence/question/relative -> C7 ;
- complements/control/coordination/constructions -> C8 ;
- Structural/Extend/API/docs -> C9 ;
- expected output/gold/review taxonomy -> C10.
