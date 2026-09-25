# Public RGL `Verb` coverage

**Status:** canonical coverage ledger.  
**Contract source:** supplied `gf-rgl-master/src/abstract/Verb.gf`.  
**Current concrete:** supplied `VerbSqi.gf`.

The abstract contains **29 operations**, and the current Albanian concrete defines all 29. Presence is therefore not the finalization problem; preserving the final structured verbal state through every operation is.

| Operation | Current shape | Final obligation | Status |
|---|---|---|---|
| `UseV` | wrap lexical verb | preserve complete morphology/voice state | STRUCTURAL_BASELINE |
| `ComplVV` | current `të` + subjunctive VP | governor-selected embedded strategy; no universal infinitive assumption | REDESIGN_REQUIRED |
| `ComplVS` | `që + S` | verify governor/complementizer classes; preserve context | REVIEW_REQUIRED |
| `ComplVQ` | append QS | preserve head/clitic state | REVIEW_REQUIRED |
| `ComplVA` | append AP | preserve agreement and TAM/voice state | REVIEW_REQUIRED |
| `SlashV2a` | create slash VP | preserve valence/clitic state | STRUCTURAL_BASELINE |
| `Slash2V3` | saturate one V3 complement | preserve complement ownership/order | REVIEW_REQUIRED |
| `Slash3V3` | saturate other V3 complement | preserve complement ownership/order | REVIEW_REQUIRED |
| `SlashV2V` | embed VP via current subjunctive helper | governor-selected embedded mood + clitic contract | REDESIGN_REQUIRED |
| `SlashV2S` | complement + `që` | verify governor/complementizer | REVIEW_REQUIRED |
| `SlashV2Q` | append QS | preserve valence/ordering | REVIEW_REQUIRED |
| `SlashV2A` | append AP | preserve agreement/ordering | REVIEW_REQUIRED |
| `ComplSlash` | NP saturation with clitic-aware path | one authoritative clitic interface | DEPENDENCY |
| `SlashVV` | slashed VV + subjunctive realization | same embedded strategy service as `ComplVV` | REDESIGN_REQUIRED |
| `SlashV2VNP` | NP + slashed VP embedding | shared valence/clitic/embedded strategy | REDESIGN_REQUIRED |
| `ReflVP` | inserts `u` / `t'u` strings | structured reflexive use distinct from non-active marker | REDESIGN_REQUIRED |
| `UseComp` | copula + complement | central realizer; correct person/TAM behavior | REVIEW_REQUIRED |
| `PassV2` | fixed `jam + participle` postmaterial | TAM-sensitive Albanian passive/non-active strategy | REDESIGN_REQUIRED |
| `AdvVP` | postmaterial | preserve strategy and placement | REVIEW_REQUIRED |
| `ExtAdvVP` | extraposed adverb | preserve single finite realizer | REVIEW_REQUIRED |
| `AdVVP` | preverbal modifier slot | reconcile with particle/clitic slot contract | DEPENDENCY |
| `AdvVPSlash` | postmaterial on slash VP | preserve valence/voice state | REVIEW_REQUIRED |
| `AdVVPSlash` | preverbal modifier on slash VP | reconcile with particle/clitic slot contract | DEPENDENCY |
| `VPSlashPrep` | prepositional slash | preserve complement contract through TAM/voice | REVIEW_REQUIRED |
| `CompAP` | agreement-sensitive AP complement | copular regression coverage | REVIEW_REQUIRED |
| `CompNP` | NP complement | copular regression coverage | REVIEW_REQUIRED |
| `CompAdv` | adverb complement | copular regression coverage | REVIEW_REQUIRED |
| `CompCN` | CN complement | copular agreement/number regression | REVIEW_REQUIRED |
| `UseCopula` | lexical `jam` VP | central realizer and irregular morphology regression | REVIEW_REQUIRED |

## Completion gate

Every row must end as either:

- **CERTIFIED** — behavior preserved and tested under the final verbal architecture; or
- **EXPLICITLY_DEFERRED** — public operation remains valid but a specifically documented Albanian extension behavior is outside this release.

No row may disappear from the ledger during refactoring.
