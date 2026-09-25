# Albanian linguistic evidence map

**Purpose:** route linguistic questions to the supplied Albanian corpus without treating any single source as a complete formal specification.

The evidence records themselves live in `17_LINGUISTIC_EVIDENCE_LEDGER.md`.

## 1. Corpus received

- `Albanian_ref/Albanian.pdf`
- `Albanian_ref/Albanian_Complete_Grammar.html`
- `Albanian_ref/Lesson_10.html` — Lesson 1, Tosk
- `Albanian_ref/Lesson_20.html` — Lesson 2, Tosk
- `Albanian_ref/Lesson_30.html` — Lesson 3, Tosk
- `Albanian_ref/Lesson_40.html` — Lesson 4, Geg
- `Albanian_ref/Lesson_50.html` — Lesson 5, Geg
- `Albanian_ref/Tosk_Dictionary_Master.html`
- `Albanian_ref/Tosk_Glossary_Master.html`
- `Albanian_ref/Geg_Glossary_Master.html`

## 2. Evidence roles

### Complete Grammar

First routing source for broad grammatical distinctions. It explicitly supports investigation of:

- five named cases with dative/genitive morphological identity;
- definiteness and postposed definite article;
- attributive article/nyje behavior and its role in distinguishing genitive constructions;
- weak pronouns and multifunctional small words such as `të`;
- analytic/synthetic tense-mood formations;
- Tosk future using a future marker plus present subjunctive;
- Tosk loss of the inherited infinitive vs Geg infinitive retention;
- optative/admirative distinctions;
- Tosk/Geg differences.

These statements identify modeling questions. They do not by themselves prove the correct RGL representation for every constructor.

### Tosk lessons/dictionary/glossary

Use for contextual standard/Tosk-oriented forms, distribution and lexical confirmation. Dictionary/glossary POS labels do not establish RGL valency.

### Geg lessons/glossary

Use contrastively. Geg-only behavior cannot silently enter the standard/Tosk-oriented core.

### Albanian.pdf

Registered but not globally mined in this governance pass. Any decision relying on it must record inspected page/section in `17_LINGUISTIC_EVIDENCE_LEDGER.md`.

## 3. Phenomenon routing

| Evidence ID | Phenomenon | First sources | Likely owners |
|---|---|---|---|
| `E-C9-ALG-001` | case; genitive vs dative; government | Complete Grammar + Tosk context | Res/Cat/Noun, Structural Prep, Extend Gen* |
| `E-C9-ALG-002` | definiteness, articles, nyje, AP/CN | Complete Grammar + Tosk lessons | Res/Noun/Adjective, Structural Det, Extend APCN |
| `E-C9-ALG-003` | `të`, subjunctive, VV/VPI complements, Tosk infinitive gap | Complete Grammar + Tosk lessons | Verb/Clause, Structural modals, Extend VPS/VPI |
| `E-C9-ALG-004` | TAM, optative, admirative, future | Complete Grammar + lessons | core TAM, Documentation, advanced VP |
| `E-C9-ALG-005` | active/non-active/passive/participles | Complete Grammar + contextual verbs | core voice, Extend VPBridge |
| `E-C9-ALG-006` | weak pronouns, clitics, pro-drop/reflexives | Complete Grammar + lessons | Cat/Verb/Clause, Structural Pron, Extend RNP |
| `E-C9-ALG-007` | Tosk/Geg scope and infinitive contrast | Complete Grammar + Lessons 4/5 | dialect policy, VV/VPI/Extra |
| `E-C9-ALG-008` | relatives, questions, focus, word order | lessons + grammar | Relative/Question/Clause, Extend Slash/Focus |
| `E-C9-ALG-009` | closed-class vocabulary | Tosk dictionary/glossary + contexts | StructuralSqi* |
| `E-C9-ALG-010` | documentation terminology / observable forms | grammar + accepted paradigms | Documentation/Symbol/Markup |

## 4. Evidence discipline

- Every nontrivial decision records source, locator/context, dialect label and what the evidence **does and does not** prove.
- A generated sentence is not gold merely because each word is attested.
- A glossary label is not valency evidence.
- Conflicting sources create a decision/evidence issue; they are not silently reconciled.
- If evidence is insufficient, keep the affected row `needs_review`/`evidence_blocked`.
