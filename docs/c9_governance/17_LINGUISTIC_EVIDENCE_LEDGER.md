# Linguistic evidence ledger

This ledger is intentionally conservative: it records what the supplied corpus supports and leaves unsupported RGL-specific conclusions open.

## Evidence maturity

`registered → located → reviewed → accepted_for_decision → gold_backed`  
A record may also be `contested` or `superseded`.

## Source register

| Source ID | File | Dialect/scope | Status | Permitted use |
|---|---|---|---|---|
| `SRC-ALG-001` | `Albanian_Complete_Grammar.html` | cross-dialect overview | reviewed for routing | grammatical distinctions; not full constructor specification |
| `SRC-ALG-002` | `Lesson_10.html` | Tosk | registered | contextual forms/constructions |
| `SRC-ALG-003` | `Lesson_20.html` | Tosk | reviewed | contextual forms/constructions |
| `SRC-ALG-004` | `Lesson_30.html` | Tosk | reviewed | contextual forms/constructions |
| `SRC-ALG-005` | `Lesson_40.html` | Geg | registered | contrastive dialect evidence |
| `SRC-ALG-006` | `Lesson_50.html` | Geg | registered | contrastive dialect evidence |
| `SRC-ALG-007` | `Tosk_Dictionary_Master.html` | Tosk lexical | registered | lexical/form lookup, not valency by itself |
| `SRC-ALG-008` | `Tosk_Glossary_Master.html` | Tosk lexical/contextual | registered | lexical/contextual support |
| `SRC-ALG-009` | `Geg_Glossary_Master.html` | Geg lexical/contextual | registered | contrastive support |
| `SRC-ALG-010` | `Albanian.pdf` | to be determined per section | registered_unreviewed | only after page/section inspection |

## Phenomenon evidence records

| Evidence ID | Claim supported by supplied source | Primary source | Scope | Maturity | What it does **not** decide |
|---|---|---|---|---|---|
| `E-C9-ALG-001` | Albanian distinguishes nominative, accusative, dative, genitive, ablative; dative/genitive are morphologically identical in the overview, and attributive-article behavior participates in genitive distinction | SRC-ALG-001 | broad/standard-relevant routing | located | whether `ResSqi.Case` must gain a separate Gen constructor |
| `E-C9-ALG-002` | definiteness and postposed definite article are central; attributive article/nyje appears with most adjectives and genitives | SRC-ALG-001 | broad | located | exact AP/CN record design and all article allomorphy |
| `E-C9-ALG-003` | Tosk future is analytic with a future marker plus present subjunctive; Tosk lacks the inherited infinitive while Geg retains an infinitive strategy | SRC-ALG-001 + Tosk/Geg lessons | dialect-sensitive | located | exact VV/VPI implementation for every verb class |
| `E-C9-ALG-004` | optative and admirative are part of the Albanian verbal inventory described by the source | SRC-ALG-001 | broad | located | whether/how these belong in common RGL Tense vs Albanian-specific API |
| `E-C9-ALG-005` | the source discusses analytic/synthetic verbal forms including passive-related material | SRC-ALG-001 | broad | located | exact active/non-active/passive record ownership |
| `E-C9-ALG-006` | weak pronouns/clitics are part of the “small word” system; identical surface forms can have different grammatical functions | SRC-ALG-001 | broad | located | complete clitic cluster ordering across all moods/polarities |
| `E-C9-ALG-007` | Tosk and Geg are distinct dialect groups with significant grammatical differences, including infinitive strategy | SRC-ALG-001 + lessons | dialect policy | located | final project policy on Geg API support |
| `E-C9-ALG-008` | corpus lessons provide contextual material for questions/relatives/focus/word order | lessons | contextual | registered | general license for English-like stranding/fronting |
| `E-C9-ALG-009` | Tosk lexical resources can support structural-word form review | SRC-ALG-007/008 + lessons | Tosk/standard-oriented | registered | government/valency without context |
| `E-C9-ALG-010` | observable paradigms/terminology can be cross-checked against grammar descriptions and accepted forms | SRC-ALG-001 + accepted morphology | release surfaces | registered | automatic correctness of Documentation output |

## C9 finalization exact evidence records

| Evidence ID | Exact locator | Supported conclusion | Scope / limitation | Maturity |
|---|---|---|---|---|
| `E-C9-ALG-011` | `Lesson_20.html`, §7 “Prepositions”, source HTML around lines 2980–3045 | `nga` is listed among the prepositions taking a nominative object; supports `from_Prep` and `by8agent_Prep` government = `Nom` | supports government; does not decide every semantic use of `nga` | accepted_for_decision |
| `E-C9-ALG-012` | `Lesson_30.html`, §14.3 “Relative Clauses”, source HTML around lines 2662–2746 | Standard Albanian relative `cili` is declined; it appears first in the relative clause; case follows clause role and gender/number follow the head | current core loses plural gender in `Agr.GenNum`, so feminine-plural synthesis remains a core limitation | accepted_for_decision |
| `E-C9-ALG-013` | `Albanian_Complete_Grammar.html` around lines 559–560 and Lesson 20 subjunctive discussion | Standard/Tosk lacks the inherited infinitive strategy and uses finite/subjunctive `të` constructions; supports retaining Albanian complement realization instead of English infinitival copying | does not certify every modal/control lexical item | accepted_for_decision |
| `E-C9-ALG-014` | `Lesson_30.html`, proximal demonstrative paradigm around source HTML lines 2920–3000 | proximal demonstrative plural accusative is `këta` (masc.) / `këto` (fem.); supports correcting `this_Quant` Acc plural cells | supports the displayed demonstrative paradigm; does not settle all discourse uses of proximal demonstratives | accepted_for_decision |
| `E-C9-ALG-015` | `Lesson_40.html`, glossary note around source HTML lines 2388–2422 | Geg `ndo’i` is glossed “some, any” and explicitly identified as a shortened form of `ndonji`, Standard Albanian `ndonjë`; supports `someSg_Det = ndonjë` while retaining plural `disa` | lexical/determiner evidence; does not by itself certify every polarity/free-choice use of `ndonjë` | accepted_for_decision |
| `E-C9-ALG-016` | `Lesson_30.html`, discussion immediately before §15.1, source HTML around lines 2820–2840 | when a referent/object is not specified for gender, the lesson states the default pronoun form is feminine; third-person pronouns are supplied by distal demonstratives | supports neutralizing common non-gendered `it_Pron`/`they_Pron` to feminine defaults (`ajo`/`ato`); does not replace explicitly gendered he/she or richer referent agreement | accepted_for_decision |

## Decision-use rule

A decision record must cite a **specific source locator/context**, not only an evidence-family ID, before moving to `closed`. The family IDs above route work; they are not substitutes for detailed citation during implementation.

## Gold rule

A candidate output becomes gold only when:

- the relevant construction is evidenced or judged acceptable from the supplied sources;
- dialect/scope is recorded;
- the generated output tests the intended grammatical contrast;
- no placeholder is responsible for the asserted morphology/valency.
