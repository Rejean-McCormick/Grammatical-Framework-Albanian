# ExtendSqi + ExtraSqi completion plan

## 1. Ownership principle

`ExtendSqi` is the advanced common-RGL surface. `ExtraSqi` is backward-compatible/common-extra support. Neither may be used to hide a defect that belongs in `ResSqi`, `CatSqi`, core syntax, morphology or paradigms.

The current `ExtendSqi` architecture is deliberately thin: it subtracts locally owned families from `ExtendFunctor` and delegates them to companion modules. Preserve this architecture unless a demonstrated contract problem requires migration.

## 2. Locally owned Extend families to finish/certify

### `ExtendSqiScaffolding`

Genitive/possessive constructions, slash question/relative strategies, pro-drop, complements, utterance case conversions, direct-speech fronts, apposition, compound nouns, gerund-like constructions, negation/tense helpers and other scaffolding.

### `ExtendSqiVPS`

`VPS/VPI/VPS2/VPI2` construction, coordination and saturation. This family must be tested against Albanian finite/subjunctive/complement behavior; an English “infinitive” interpretation cannot be assumed.

### `ExtendSqiExistential`

Existential declaratives/questions, CN/mass/plural variants, mathematical existence. Test agreement, definiteness and existential strategy.

### `ExtendSqiAPCN`

`ICompAP`, bare CN complements, interrogative quantifier complements, AP→CN/NP, predicative AP+VP and cardinal CN behavior. Test nyje/article and agreement.

### `ExtendSqiFocusPrep`

Object/adverb/AdV/AP focus and bare-CN prepositional phrases. Test actual Albanian focus/word-order constraints before gold certification.

### `ExtendSqiVPBridge`

Participles, passive/agent passive, nominalization, progressive slash, A2/N2 slash, purpose/without/by/in-order-to VP and compound AP. Must stay synchronized with voice/TAM/clitic workstreams.

### `ExtendSqiRNP`

Reflexive pronoun/possessive structures and RNP coordination. Test person/agreement and possession behavior.

### `ExtendSqiLexicon`

Gender/politeness/reflexive possession and DAP-related lexical tail. Ensure these are true advanced lexical distinctions, not compensation for missing core pronoun structure.

## 3. Inherited ExtendFunctor functions

Every function currently supplied by `ExtendFunctor` remains `partial` until reviewed. For each inherited function choose exactly one outcome:

- promote to `equivalent` with evidence and tests;
- subtract and implement locally;
- use `neutralized_equivalent` only if Albanian evidence shows the common distinction is not separately grammaticalized while the abstract contract is still fully satisfied.

## 4. ExtraSqi policy

`ExtraSqiAbs` currently inherits common `Extra`. Keep English-only `ExtraEngAbs` functions out of Albanian by default. Add a function only if:

1. it expresses an Albanian-relevant capability;
2. it has a stable owner;
3. it is not already covered by current `Extend` or core API;
4. tests justify the addition.

## 5. Forbidden shortcuts

- no empty-string implementation to satisfy an abstract signature;
- no flattening rich NP/VP records into strings to imitate English output;
- no English preposition stranding, infinitive, passive or focus rule copied without Albanian evidence;
- no duplicate implementation in both Extra and Extend unless compatibility requires a documented bridge;
- no whole DRAFT-MAX overlay.


## Traceability additions (v2)

- `C9-EXT-*` and `C9-XTR-*` are the stable row IDs.
- Every retained functor default requires an explicit `equivalent` or `neutralized_equivalent` promotion record.
- Advanced families map to `T-C9-EXT-*` test IDs in `18_TEST_COVERAGE_REGISTER.md`.
- Voice, clitic, TAM and complement dependencies must be linked through `21_INTER_CONVERSATION_DEPENDENCIES.md`; C9 must not silently own another workstream's representation contract.
