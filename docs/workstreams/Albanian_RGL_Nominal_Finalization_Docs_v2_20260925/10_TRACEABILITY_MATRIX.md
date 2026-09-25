# Matrice de traçabilité nominale

> **Document version**: 2.0  
> **Document status**: TRACKING  
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

## Matrice

| Requirement | Preuve actuelle | Représentation cible | Producteurs | Consommateurs | Tests requis | Statut |
|---|---|---|---|---|---|---|
| 5 cas grammaticaux | Complete Grammar + Lesson 10 | `Case` avec `Gen` | morphology/paradigms/NP | possession, prep, names, pronouns | Gen vs Dat path | DECISION |
| Gen/Dat syncrétiques en forme | Lesson 10 | tables peuvent partager chaîne | `MorphoSqi` | réalisateurs | égalité surface + distinction contexte | FACT |
| définitude nominale | Lesson 10 | `Species` dans Noun | noun paradigms | DetCN/MassNP | Def/Indef grid | FACT |
| ambigeneric nouns | Lesson 10 | `Noun.g : Number => Gender` | noun lexeme/paradigm | AdjCN, RelCN, NP.a | sg masc vs pl fem | DECISION |
| genre pluriel préservé | conséquence de l’ambigénéricité | `GPl Gender` ou équivalent | `genNum/agrgP3` | verb/relative/adjective/coordination | plural agreement | DECISION |
| *nyje* 4 formes | Lesson 10 | service central | `ResSqi` | Adj/AP, Gen, possessives | full context matrix | DECISION |
| adjectif articulé/non articulé | Lesson 10 | trait explicite | paradigm A | PositA/AdjCN | paired adjective tests | DECISION |
| radical adjectival G×N | Lesson 10 | formes lexicales G×N | `MorphoSqi/Paradigms` | AP realization | 4-cell lexical grid | DESIGN |
| demonstratives | Lesson 30 | Quant/Pron/IQuant tables | Structural | DetCN/NP | ai/ajo, ky/kjo all cases | FACT |
| personal pronouns | Lesson 30 | NP/Pron case + clitics | Structural | VP/clitic consumers | full vs weak forms | PARTIAL |
| possessif postnominal ordinaire | Lesson 30 | `placement=PostNominal`, noun Def | PossPron/NounSqi | DetCN | gjuha jonë, miku im | DECISION |
| possessif prénominal parenté | Lesson 30 | future lexical class if needed | lexicon | DetCN | kinship contrasts | GAP |
| numeral word formation | Lesson 50 | NumeralSqi | numerals | Num/Card | boundary suite | CURRENT/PARTIAL |
| ordinal irregularity | Lesson 50 | ordinal paradigms, not prefix-only | Paradigms/Noun | Ord/AdjOrd | first/2-10 etc. | GAP/CURRENT DEFECT RISK |
| numeral government | insufficient evidence | optional typed `NumeralGov` | Numeral | CN/NP/agreement | range-boundary tests | GAP |
| proper name inflection | insufficient complete rule | case-aware PN/GN/LN | Paradigms/Names | UsePN/InLN | case grid | GAP |
| N2/N3 government | RGL abstract + typed Prep design | `Compl` typed Case | Paradigms | ComplN2/N3 | complement-case tests | CURRENT |
| no local hacks | Compendium patch protocol | central producers/consumers | all | all | regression + review | INVARIANT |
| green integration floor | project roadmap | merge gate | Wordbench | release process | 58/58 + 52/52 | CERTIFIED STRUCTURAL |

## Règle

Toute nouvelle fonctionnalité nominale doit obtenir une ligne avant implémentation. Toute ligne passée à `CERTIFIED` doit pointer vers au moins un test/gold concret dans une future révision de cette matrice.

## V2 linkage

Chaque ligne doit progressivement référencer un `E-NOM-*` de `15`, un `NOM-TV-*` de `16`, une décision `NOM-D*` de `08`, et un stage `N*` de `17`. Une ligne `CERTIFIED` sans ces liens est invalide.
