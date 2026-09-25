# Functional Coverage Matrix — Sentence / Question / Relative v2

**Scope:** exact shared abstract surface from the supplied RGL snapshot.  
**Important:** “implemented” below means a concrete linearization exists. It is not a linguistic certification label.

## Status model

Every function ultimately receives all of these independent statuses:

- `presence`: implemented/missing/N/A;
- `architecture`: canonical/specialist/transitional/open;
- `behavior`: unreviewed/reviewed;
- `evidence`: sourced/open;
- `regression`: scenario/gold coverage.

## Sentence — 19 functions

| Function | Abstract type | Current implementation | Current owner | Existing evidence/tests | Target disposition |
| --- | --- | --- | --- | --- | --- |
| PredVP | NP → VP → Cl | canonical delegation | `mkClause` | C0251–C0280 + cross | retain |
| PredSCVP | SC → VP → Cl | delegates but uses `defaultAgr` | `mkClause` | no dedicated agreement contrast | review |
| SlashVP | NP → VPSlash → ClSlash | canonical delegation; preserves `c2` | `mkClause` + `vpFromSlash` | wh/relative object campaigns | retain |
| AdvSlash | ClSlash → Adv → ClSlash | appends string after realized clause | public constructor | indirect coverage only | migrate if ordering evidence |
| SlashPrep | Cl → Prep → ClSlash | structural; preserves `c2` | public constructor | wh oblique | retain |
| SlashVS | NP → VS → SSlash → ClSlash | hardcodes `që`; preserves slash | `mkClause` + VP post | no focused complementizer contrast | review |
| ImpVP | VP → Imp | delegates imperative realization | `realizeImpVP` | no full imperative-clitic matrix | retain + expand tests |
| AdvImp | Adv → Imp → Imp | prefixes adverb | public constructor | no targeted order evidence | review |
| EmbedS | S → SC | hardcodes `që` | public constructor | complement campaigns | review `se/që` policy |
| EmbedQS | QS → SC | identity | public constructor | embedded Q via VQ | open direct/embedded distinction |
| EmbedVP | VP → SC | subjunctive with `defaultAgr` | `realizeSubjVP` | control campaigns | review control/agreement |
| UseCl | Temp → Pol → Cl → S | thin selector | public constructor | broad | retain |
| UseQCl | Temp → Pol → QCl → QS | thin selector | public constructor | Q campaigns | retain; QCl shape may evolve |
| UseRCl | Temp → Pol → RCl → RS | thin selector | public constructor | relative + cross | retain |
| UseSlash | Temp → Pol → ClSlash → SSlash | thin selector; preserves `c2` | public constructor | slash composition | retain |
| AdvS | Adv → S → S | prefixes adverb | public constructor | subordination uses Adv elsewhere | review placement classes |
| ExtAdvS | Adv → S → S | prefix + comma | public constructor | no dedicated punctuation gold | review |
| SSubjS | S → Subj → S → S | flat `S Subj S` concatenation | public constructor | C0421–C0430, C0491–C0494 | retain only after subordinator/order review |
| RelS | S → RS → S | comma + RS with `defaultAgr` | public constructor | no dedicated sentential-relative agreement | review |

## Question — 17 functions

| Function | Abstract type | Current implementation | Current owner | Existing evidence/tests | Target disposition |
| --- | --- | --- | --- | --- | --- |
| QuestCl | Cl → QCl | prefixes direct polar marker `a` | QuestionSqi | C0381–C0390 | direct supported; embedding open |
| QuestVP | IP → VP → QCl | IP nominative + finite VP | QuestionSqi | C0391–C0393 + cross | review subject-wh order |
| QuestSlash | IP → ClSlash → QCl | pied-pipes governed prep + case | QuestionSqi | C0394–C0395,C0399 | retain subject to preposition evidence |
| QuestIAdv | IAdv → Cl → QCl | fronts interrogative adverb | QuestionSqi | C0396–C0398 + cross | retain pending indirect-Q policy |
| QuestIComp | IComp → NP → QCl | custom copular order | QuestionSqi | limited | review |
| IdetCN | IDet → CN → IP | case-sensitive nominal construction | QuestionSqi | C0400 indirectly | nominal workstream dependency |
| IdetIP | IDet → IP | case-sensitive nominal construction | QuestionSqi | limited | nominal dependency |
| AdvIP | IP → Adv → IP | postmodifier | QuestionSqi | limited | review nominal placement |
| IdetQuant | IQuant → Num → IDet | nominal | QuestionSqi | limited | nominal dependency |
| PrepIP | Prep → IP → IAdv | prep + governed IP case | QuestionSqi | C0399 | evidence-supported case behavior |
| AdvIAdv | IAdv → Adv → IAdv | concatenation | QuestionSqi | limited | review |
| CompIAdv | IAdv → IComp | identity | QuestionSqi | C0396–C0398 indirectly | retain |
| CompIP | IP → IComp | nominative form | QuestionSqi | limited | review copular contexts |
| ComplSlashIP | VPSlash → IP → QVP | saturates slash into VP post | QuestionSqi | multiple-wh not specifically tested | expand tests |
| AdvQVP | VP → IAdv → QVP | appends IAdv | QuestionSqi | multiple-wh not specifically tested | expand tests |
| AddAdvQVP | QVP → IAdv → QVP | appends IAdv | QuestionSqi | multiple-wh not specifically tested | expand tests |
| QuestQVP | IP → QVP → QCl | fronts subject IP + finite QVP | QuestionSqi | multiple-wh not specifically tested | expand tests |

## Relative — 5 functions

| Function | Abstract type | Current implementation | Current owner | Existing evidence/tests | Target disposition |
| --- | --- | --- | --- | --- | --- |
| RelCl | Cl → RCl | prefixes invariant `që` | RelativeSqi | indirect | strategy review |
| RelVP | RP → VP → RCl | RP nominative + finite VP | RelativeSqi | C0401–C0410 | agreement/strategy review |
| RelSlash | RP → ClSlash → RCl | prep + declined RP + clause | RelativeSqi | C0411–C0420 mostly object without prep | add prep-relative tests |
| IdRP | RP | invariant `që` | RelativeSqi | via `which_RP` API paths | spoken-common but generation policy open |
| FunRP | Prep → NP → RP → RP | concatenates prep + NP + RP | RelativeSqi | no focused test | review semantics/ownership |

## Coverage gate

The final workstream may not report “Sentence/Question/Relative complete” merely because the three concrete modules compile. Completion requires:

1. all 41 rows have a final disposition;
2. every `review`/`open` row has either a closed decision or an explicit deferred status;
3. every behavior-affecting row has a targeted test family;
4. all rows that rely on a model-language architecture cite Albanian evidence separately;
5. extension paths that duplicate these functions are reconciled in `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md`.

## Highest-priority current hotspots

1. direct vs embedded question representation (`QuestCl`, `EmbedQS`, `ComplVQ`);
2. hardcoded indicative complementizer `që` (`EmbedS`, `ComplVS`, `SlashV2S`, extension `CompS`);
3. relative strategy split between invariant `që` and declined relative pronoun;
4. `defaultAgr` in `PredSCVP`, `EmbedVP`, `RelS` and specialist helpers;
5. slash/preposition strategy including uncertified “stranding” helpers;
6. sentence/adverb/subordinator concatenation when placement or scope becomes nontrivial;
7. multiple-wh/QVP coverage, currently structurally implemented but not deeply tested.
