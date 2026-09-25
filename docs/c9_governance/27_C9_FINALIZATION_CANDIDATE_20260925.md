# C9 finalization candidate — 2026-09-25

This record reconciles the documentation with the source candidate produced from the locked Albanian snapshot and the supplied RGL archive.

## Implemented

- Structural `nga` government: `from_Prep` and `by8agent_Prep` -> `Nom` (E-C9-ALG-011).
- Extend `SlashBareV2S`: locally owned via existing Albanian helper.
- Slash compatibility: `StrandQuestSlash` / `StrandRelSlash` neutralized to preposition-first; `EmptyRelSlash` synthesizes declined `cili` (E-C9-ALG-012).
- `CombinatorsSqi.appCN/appCNc`: specialized through `NounSqi.PossNP`.
- `TrySqi`: safe `mkAdv`, `mkAdN`, `mkOrd` overload policy.
- `DocumentationSqi.InflectionCl`: implemented against supplied `Documentation` abstract.
- Additive focused test candidate under `validation/c9/`; protected 52 scenarios untouched.

## Static evidence

- C9 static validator: 144/144 PASS.
- Existing Morpho/Dict/MorphoDict static validators: PASS.
- Supplied common surfaces statically accounted for: Structural 102, Extend explicit functions 128, Markup 8, Symbol explicit functions 11, Documentation 31.

## Not executable-certified here

The environment contains no GF executable. Therefore exact-current compile, Wordbench 58/58, protected 52/52, new C9 smoke execution, lock warnings, and gold regression remain external release gates.

## Remaining cross-workstream limitation

Current `Agr.GenNum` collapses plural gender. `EmptyRelSlash` can select correct singular masculine/feminine forms but uses masculine plural `të cilët` as compatibility default until the core agreement migration preserves plural gender. This limitation is explicit and not gold-certified.

## Late nominal corrections

- `this_Quant` accusative plural now follows the supplied proximal demonstrative paradigm: masc. `këta`, fem. `këto` (`E-C9-ALG-014`).
- `someSg_Det` now uses Standard `ndonjë`; plural remains `disa` (`E-C9-ALG-015`).
- These rows are reset to `not_run` until the candidate is externally compiled and executed.

## Candidate-wide certification reset

Because the source-lock changed and no exact-current GF 3.12 run was possible here, all 350 C9 parity rows are `not_run` on the execution-certification axis. Coverage classifications remain intact; the prior green baseline is historical evidence only.

## Common pronoun neutralization

The common API does not parameterize `it_Pron`/`they_Pron` by Albanian grammatical gender. The supplied Lesson 30 states that unspecified-gender pronouns default to the feminine form. The candidate therefore uses `ajo` for `it_Pron` and `ato` for `they_Pron`; this is recorded as a neutralized common-RGL equivalence (`E-C9-ALG-016`), not as a claim that Albanian has an English-like neuter pronoun.
