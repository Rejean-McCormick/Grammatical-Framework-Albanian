# Conversation 9 — advanced RGL/API finalization candidate

Date: 2026-09-25

## Task header

- `task_id`: `C9-FINAL-20260925`
- `owner_workstream`: Conversation 9 — RGL advanced coverage + public API
- `primary_compendium_route`: `R07 Extend / Extra / Missing`
- `secondary_routes`: `R10 Repair linguistic output`, `R11 Tests`, `R14 Reconciliation`
- `workflow_state`: W00–W05 completed statically; W06–W08 require external GF 3.12 / Wordbench 1.3.4 execution
- `albanian_base_snapshot_sha256`: `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829`
- `target_rgl_archive_sha256`: `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d`
- `gf_version_target`: GF 3.12
- `wordbench_version_target`: 1.3.4

The target RGL contract for this patch is the exact supplied `gf-rgl-master.zip` archive above. This does **not** retroactively prove which Git commit was used by the older protected run.

## Source changes

### StructuralSqi

`StructuralSqiClause.gf`

- `from_Prep` (`nga`) now governs `Nom` rather than `Ablat`.
- `by8agent_Prep` (`nga`) now governs `Nom` rather than `Ablat`.

Evidence: supplied Standard/Tosk Lesson 20, section **7 Prepositions**, explicitly lists `nga` among the prepositions taking a nominative object. The other audited common prepositions remain unchanged.

### ExtendSqi

`SlashBareV2S` is now subtracted from the shared `ExtendFunctor` and locally wired to the already-existing Albanian helper `sc_SlashBareV2S`. This closes the one inherited/default Extend row identified by the C9 parity matrix.

`ExtendSqiScaffolding.gf` neutralizes English-style preposition stranding:

- `StrandQuestSlash` delegates to Albanian preposition-first pied-piping;
- `PiedPipingRelSlash` uses the supplied RP for non-prepositional relatives but switches to an overt declined `cili` after an overt preposition;
- `StrandRelSlash` delegates to that Albanian preposition-first strategy;
- `EmptyRelSlash` synthesizes an overt declined `cili` relative after the preposition.

Evidence: supplied Lesson 30, section **14.3 Relative Clauses**, gives the declined `cili` paradigm and states that the relative pronoun occurs first in the relative clause, with case determined by its role.

Known core limitation: current `Agr.GenNum` collapses plural gender to `GPl`. `EmptyRelSlash` therefore uses masculine plural `të cilët` as a compatibility default for plural antecedents. This is **not linguistically certified for feminine plural antecedents** and remains dependent on the accepted richer agreement migration owned by the core workstream.

### CombinatorsSqi

The generic `appCN/appCNc` fallback realizes possession through `possess_Prep`. Albanian now specializes these operations through `NounSqi.PossNP`, preserving the existing Albanian linking-article/genitive construction owner instead of bypassing it at API level.

### TrySqi

Adds the same safe convenience pattern used by mature English Try:

- `mkAdv : Str -> Adv`;
- `mkAdN : CAdv -> AdN` plus `mkAdN : Str -> AdN`;
- `mkOrd : Str -> Ord`.

The extra Albanian exclusions remain intentional:

- `mkCard : Str -> Card` is already exposed by Constructors with the same public purpose;
- `mkDet` / `mkQuant` are low-level morphology-rich constructors and are not made interactive shortcuts;
- `mkIP` / `mkIDet` one-string paradigms erase Albanian case/agreement distinctions and remain excluded;
- `mkIAdv`, `mkPConj`, `mkVoc` remain excluded rather than expanding Try beyond the mature English convenience policy without a demonstrated application need.

### DocumentationSqi

Adds `InflectionCl : Cl -> Inflection` to match the exact supplied `Documentation` abstract. The table exposes:

- Present / Past / Future / Conditional;
- simultaneous / anterior;
- positive / negative.

This alignment is contract-sensitive: the supplied RGL archive is the target for this candidate.

## Unchanged surfaces

No source change was required in:

- `SyntaxSqi.gf`;
- `ConstructorsSqi.gf`;
- `SymbolicSqi.gf`;
- `SymbolSqi.gf`;
- `MarkupSqi.gf`;
- `GrammarSqi.gf` / `LangSqi.gf` / `AllSqi.gf`.

Their existing composition remains the intended public surface. `BrowseSqi` is not added: canonical decision GLOB-022 keeps it outside the core C9 release unless the active common RGL contract requires it.

## Validation performed here

`validation/c9/static_validate_c9.py`:

- 144/144 static checks PASS;
- protected scenario directory remains exactly 52 `.gfs` files;
- Structural common `fun` surface: 102/102 found statically;
- Extend explicit `fun` surface in supplied abstract: 128/128 found statically (generated list constructors are tracked separately in the C9 matrix);
- Markup: 8/8;
- Symbol explicit `fun`: 11/11;
- Documentation: 31/31, including `InflectionCl`.

Existing project validators also pass:

- `gf_morphosqi_lint.py`: 0 findings;
- unified Dict/MorphoDict static validation: PASS;
- MorphoDict static validation: PASS;
- Dict static validation: PASS.

Focused GF smoke assets were added under `validation/c9/` but **were not executed**, because this environment does not contain a GF executable.

## External gate still mandatory

Before merge/release claims, run against the exact supplied RGL contract with GF 3.12 + Wordbench 1.3.4:

1. compile changed modules and public consumers;
2. run `validation/c9/inputs/AlbC9ResourceSmokeSqi.gf` and `validation/c9/scripts/c9-resource-smoke.gfs`;
3. rerun full 58-target census;
4. rerun protected 52 scenarios;
5. confirm zero structural lock warnings;
6. review changed output linguistically before promoting any new gold;
7. verify no existing gold regression.

Until that run exists, this delivery is a **source-complete C9 finalization candidate**, not an evidence-backed release certification.

## Late Structural nominal corrections

- `StructuralSqiNominal.this_Quant`: corrected accusative plural from dative `këtyre` to `këta` (Masc) / `këto` (Fem), following the supplied Lesson 30 proximal-demonstrative table.
- `StructuralSqiNominal.someSg_Det`: changed provisional singular `disa` to Standard `ndonjë`; `somePl_Det` remains `disa`. The supplied Lesson 40 glossary explicitly maps Geg `ndonji/ndo'i` to Standard `ndonjë` with “some, any”.
- Both changes have static + resource-smoke coverage but remain externally unrun.

## Additive execution probes

- `validation/c9/api/`: facade-only smoke for Syntax/Constructors/Combinators/Try/Symbolic, deliberately avoiding Res/Cat internals.
- `validation/c9/release/`: composed Lang+Symbol smoke for Documentation (including `InflectionCl`), Markup and Symbol.
- Both are **candidate-added, not run** until GF 3.12/Wordbench is available.

## Common pronoun neutralization

The common API does not parameterize `it_Pron`/`they_Pron` by Albanian grammatical gender. The supplied Lesson 30 states that unspecified-gender pronouns default to the feminine form. The candidate therefore uses `ajo` for `it_Pron` and `ato` for `they_Pron`; this is recorded as a neutralized common-RGL equivalence (`E-C9-ALG-016`), not as a claim that Albanian has an English-like neuter pronoun.
