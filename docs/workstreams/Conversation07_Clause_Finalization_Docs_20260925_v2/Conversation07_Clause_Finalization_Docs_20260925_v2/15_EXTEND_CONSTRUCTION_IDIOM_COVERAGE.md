# Extend / Construction / Idiom Clause Coverage — Conversation 7 v2

The shared 41-function matrix is not enough for English-level clause maturity. This file inventories clause-producing/embedding behavior outside `SentenceSqi`, `QuestionSqi`, `RelativeSqi`.

## 1. `ExtendSqiVPS` / VPS–VPI families

| Function/helper | Current behavior | Risk | Final disposition |
|---|---|---|---|
| `vps_PredVPS` | `NP + finalized VPS` | parallel declarative assembler | delegate to common subject/order helper or documented specialist |
| `vps_SQuestVPS` | `a + NP + VPS` | repeats direct polar policy | share direct polar policy |
| `vps_QuestVPS` | `IP + VPS` | repeats wh-subject policy | share wh policy |
| `vps_RelVPS` | `RP + VPS` | repeats relative strategy | share relative policy |
| `vps_MkVPS` | freezes Temp/Pol into Agr→Str | expected Extend abstraction | retain if tests prove no needed later distinction |
| `vps_MkVPI` | subjunctive Agr→Str | control/agreement dependency | coordinate with OD-008 |
| VPS2/VPI2 object paths | preserve plain/pron + `c2` | important clitic/valency interface | retain structure; regression test |

## 2. `ExtendSqiScaffolding`

| Helper family | Current state | Certification requirement |
|---|---|---|
| pied-piping question/relative | structured prep + governed IP/RP | targeted Albanian prepositional Q/relative tests |
| strand question/relative | postposed preposition | OD-C07-015 must close before linguistic certification |
| empty relative slash | invariant `që` + clause + prep | OD-C07-004/005; ensure government not spuriously surfaced |
| `sc_CompS` | hardcoded `që` | same `se/që` policy as core |
| `sc_CompQS` | finalized QS identity | direct/embedded Q policy |
| `sc_CompVP` / `sc_ComplGenVV` | subjunctive realization | WS09 control + negative/anterior tests |
| direct speech helpers | colon + Utt | specialist; punctuation tests |
| `sc_PredIAdvVP` | custom wh QCl with defaultAgr | question policy + agreement review |
| `sc_ProDrop` | zeroes overt pronoun string | OD-C07-007; not certified by existence |

## 3. `ExtraSqi`

### Focus/fronting

`FocObj`, `FocAdv`, `FocAdV`, `FocVP`, `FocVV`, `FrontExtPredVP`, `InvFrontExtPredVP` must not be used as proof of an Albanian focus system.

Finalization requires either:

- evidence-backed distinct realizations and contrastive tests; or
- explicit `needs_review`/deferred status in the parity matrix.

`FrontExtPredVP` and `InvFrontExtPredVP` currently linearize identically through `PredVP`; this is structural API coverage, not semantic parity.

## 4. `ConstructionSqi`

Priority clause constructs:

- `have_name_Cl`;
- `what_name_QCl`;
- `how_old_QCl`;
- `how_far_QCl`;
- `weather_adjCl`;
- any other constructor returning `Cl/QCl/S` or directly composing a finite VP.

These may be lexicalized idiomatic constructions, so forcing them through a generic assembler is not automatically correct. Each must have:

1. a specialist/canonical classification;
2. Albanian idiomatic evidence;
3. TAM/polarity scope tests if parameters are exposed;
4. no duplicated low-level clitic/TAM morphology.

## 5. `IdiomSqi`

Priority constructs:

- `ImpersCl`, `GenericCl`;
- `CleftNP`, `CleftAdv`;
- `ExistNP`, `ExistIP`, `ExistNPAdv`, `ExistIPAdv`;
- `ImpPl1`, `ImpP3`.

Existentials currently use a dedicated `existWord` tense path; this can be a legitimate specialist but must be kept synchronized with supported TAM/polarity semantics and tested separately.

Cleft/focus behavior requires dedicated Albanian evidence; hardcoded `që` is part of the complementizer/relative strategy audit.

## 6. `VerbSqi` complement constructors

Clause syntax must coordinate with:

- `ComplVS`, `SlashV2S` — indicative sentential complements currently using `që`;
- `ComplVQ`, `SlashV2Q` — finalized question complements;
- `ComplVV`, `SlashV2V`, `SlashVV`, `SlashV2VNP` — finite subjunctive/control paths.

Final owner split:

- WS09 chooses lexical complement/valency type;
- WS05/08 supplies verbal/mood forms;
- C07 supplies embedding realization policy;
- WS06 supplies clitic behavior.

## 7. `PhraseSqi` fragments

`UttVP` currently realizes a positive subjunctive VP with `defaultAgr`. This is a fragment/utterance specialist, not ordinary clause predication. It needs its own semantic rationale/test and must not constrain the finite clause architecture.

## 8. Completion gate

Conversation 7 cannot declare clause parity until each item above is marked one of:

- `canonical_delegation`;
- `certified_specialist`;
- `linguistically_not_applicable`;
- `deferred_open`.

`implemented` alone is not a final status.
