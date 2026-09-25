---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 12 — Matrice des preuves

## Références albanaises effectivement exploitées

| ID | Claim | Source fournie | Statut | Requirement/Test |
|---|---|---|---|---|
| E-C5-001 | cinq cas; Gen/Dat morphologiquement identiques | `Albanian_Complete_Grammar.html`, Structure | SOURCE_FACT | C5-REQ-006 |
| E-C5-002 | nyje distingue le génitif | Complete Grammar + leçons nominales | SOURCE_FACT | C5-REQ-006 |
| E-C5-003 | Acc preps `në me pa për mbi nën` | `Lesson_20.html`, §7 | SOURCE_FACT | C5-REQ-016 |
| E-C5-004 | Nom preps `nga tek` | `Lesson_20.html`, §7 | SOURCE_FACT | C5-REQ-016 |
| E-C5-005 | Abl preps `prej brenda gjatë para midis sipas` | `Lesson_20.html`, §7 | SOURCE_FACT | C5-REQ-016 |
| E-C5-006 | relatif `cili` décliné; Gen avec nyje additionnel | `Lesson_30.html`, §14.3 | SOURCE_FACT | C5-REQ-010 |
| E-C5-007 | distal `ai/ajo` table complète | `Lesson_30.html`, §15.1 | SOURCE_FACT | pronoun matrix |
| E-C5-008 | proximal `ky/kjo` table complète | `Lesson_30.html`, §15.2 | SOURCE_FACT | pronoun matrix |
| E-C5-009 | pronoms forts 1/2p | `Lesson_30.html`, §16 | SOURCE_FACT | pronoun matrix |
| E-C5-010 | faibles Acc/Dat + reflexive `u` | `Lesson_30.html`, §17.1 | SOURCE_FACT | weak inventory |
| E-C5-011 | position préverbale générale; impératif exceptionnel | `Lesson_30.html`, §17.2 | SOURCE_FACT | context matrix |
| E-C5-012 | DO doubling facultatif; IO obligatoire | `Lesson_30.html`, §17.3 | SOURCE_FACT | saturation tests |
| E-C5-013 | Dat avant Acc + matrice 18 fusions | `Lesson_30.html`, §17.4 | SOURCE_FACT | C5-REQ-015 |
| E-C5-014 | contraction `të` avec cluster | `Lesson_30.html`, §17.4 | SOURCE_FACT | contraction tests |
| E-C5-015 | futur `do të` + subj présent; futur parfait | `Lesson_30.html`, §19 | SOURCE_FACT | future contexts |
| E-C5-016 | conditionnel `do të` + imperfect-domain | `Lesson_30.html`, §20 | SOURCE_FACT | conditional contexts |
| E-C5-017 | non-actif aoristique `u`; composés avec `jam` | `Lesson_40.html`, §23.2-23.3 | SOURCE_FACT | C5/voice interface |
| E-C5-018 | impératif négatif avec `mos` | `Lesson_50.html`, §26 | SOURCE_FACT | imperative context |
| E-C5-019 | interrogatif case-sensitive `kush` / `me kë`; polar `a` | `Lesson_50.html`, §29 | SOURCE_FACT | question tests |
| E-C5-020 | progressif `po + verb` | Complete Grammar | SOURCE_FACT partielle | OQ-C5-PROG-001 |

## Références présentes mais rôle limité

- `Tosk_Dictionary_Master.html`, `Tosk_Glossary_Master.html` : corroboration lexicale/morphologique, pas contrat syntaxique général.
- `Geg_Glossary_Master.html` : matériau dialectal/comparatif; ne définit pas automatiquement Standard Albanian.
- `Albanian.pdf` : présent mais aucune règle nouvelle n'est promue depuis lui sans extraction/localisation précise.

## Contrats RGL

- `abstract/Verb.gf`: `ComplSlash`, `ReflVP`, `Slash2V3`, `Slash3V3`, `SlashVV`, `VPSlashPrep`.
- `abstract/Noun.gf`: `UsePron`, `PossPron`, `PossNP`, `PartNP`.
- `abstract/Question.gf`: `QuestSlash`, `PrepIP`, `ComplSlashIP`.
- `abstract/Relative.gf`: `RelSlash`, `IdRP`, `FunRP`.
- `abstract/Adverb.gf`: `PrepNP`.
- `abstract/Sentence.gf`: `PredVP`, `ImpVP`, `UseCl`.
- `abstract/Structural.gf`: pronoms et inventaire `*_Prep`.

## Compendium

Patterns applicables : EP007, EP008, EP019, EP020, EP028, EP047. Ils soutiennent l'architecture, pas les formes albanaises.

## Baseline source

- `ResSqi.gf`: Case 4-valeurs, Pron fort+faibles, VP `cl/subjcl`.
- `VerbSqi.gf`: saturation, dat doubling, ReflVP, V3/slash.
- `ClauseSqiRes.gf`: réalisation finie/subj/imp/non-fini.
- `StructuralSqiNominal.gf`: pronoms/démonstratifs/which.
- `StructuralSqiClause.gf`: preps Structural.
- `QuestionSqi.gf`, `RelativeSqi.gf`: consommation du gouvernement.
- `IdiomSqi.gf`, `ExtendSqiVPBridge.gf`: `po` actuellement encodé dans chaînes clitiques.
