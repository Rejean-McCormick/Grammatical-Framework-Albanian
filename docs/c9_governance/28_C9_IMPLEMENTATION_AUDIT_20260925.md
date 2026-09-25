# C9 structural + advanced surface audit — 2026-09-25

## Audit scope

Conversation 9 only: `StructuralSqi*`, `ExtendSqi*`, `ExtraSqi`, public API facades, `DocumentationSqi`, `SymbolSqi`/`SymbolicSqi`, `MarkupSqi`, and their additive C9 validation assets.

The audit uses the supplied Albanian snapshot, supplied `gf-rgl-master.zip`, consolidated canonical documentation, and supplied Albanian references. It deliberately does **not** re-own core morphology, clitic architecture, TAM/voice, genitive/nyje migration or lexical valency decisions belonging to other workstreams.

## Source-level closure achieved in the candidate

### Structural

- common Structural surface statically accounted for: 102 functions;
- `nga` government corrected to `Nom` for `from_Prep` and `by8agent_Prep` from the supplied Lesson 20 preposition table;
- the supplied Acc-government set (`në`, `me`, `pa`, `për`, `mbi`, `nën`) and several Ablative entries are statically guarded;
- proximal `this_Quant` accusative plural corrected to `këta` / `këto` from the supplied Lesson 30 paradigm;
- `someSg_Det` uses Standard `ndonjë`; plural remains `disa`;
- common non-gendered `it_Pron` / `they_Pron` are neutralized to the supplied unspecified-gender feminine defaults `ajo` / `ato`; no productive neuter is invented.

### Extend / Extra compatibility

- all common Extend rows have a concrete coverage verdict in the C9 matrix;
- `SlashBareV2S` is locally owned instead of remaining an unreviewed functor default;
- English-shaped stranding functions are neutralized to Albanian preposition-first realizations;
- relative realization follows the canonical split: ordinary invariant `që` when no overt adposition must be preserved, declined `cili` after an overt adposition when case/preposition visibility is required;
- Extra compatibility routes through the same shared Albanian helpers, preventing divergent duplicate semantics.

### Public API

- `CombinatorsSqi.appCN/appCNc` now route through the language owner `NounSqi.PossNP` rather than generic `possess_Prep` composition;
- `TrySqi` exposes safe `mkAdv`, `mkAdN`, `mkOrd` string conveniences while retaining Albanian-specific exclusions that would collide with Constructors or erase rich case/agreement structure;
- a facade-only smoke grammar exercises Syntax, Constructors, Combinators, Try and Symbolic without importing `ResSqi`/`CatSqi`/internal helpers.

### Documentation / Symbol / Markup

- `DocumentationSqi.InflectionCl` is implemented against the supplied RGL `Documentation` abstract;
- release-surface smoke grammar composes `LangSqi + SymbolSqi` and provides ready-to-run Documentation N/A/V/Prep/Cl, Markup NP/CN/AP/S, and Symbol NP/S probes;
- no Symbol/Markup category-flattening patch was introduced because the current implementations already preserve rich tables/records statically.

## Static validation result

`validation/c9/static_validate_c9.py`: **144/144 PASS** at the time of this audit.

Static abstract-name coverage against the supplied RGL snapshot:

| Surface | Explicit abstract functions | Missing by static name audit |
|---|---:|---:|
| Structural | 102 | 0 |
| Extend | 128 | 0 |
| Markup | 8 | 0 |
| Symbol | 11 | 0 |
| Documentation | 31 | 0 |

The C9 parity matrix contains 350 tracked rows because it additionally accounts for generated list constructors / compatibility surface rows beyond this explicit `fun` count.

Existing MorphoSqi, DictSqi and MorphoDict static validators also pass; their source files are byte-identical to the supplied baseline.

## Exact-current certification state

**No GF executable is present in this environment.** The candidate source-lock differs from the protected baseline. Therefore all 350 C9 rows are reset to `not_run` on the execution-certification axis. This is intentional: a historical 58/58 result cannot certify modified source.

Coverage state is separate:

- 342 `implemented`;
- 8 `neutralized_equivalent`;
- 0 `partial`;
- 0 `missing` in the tracked common surface.

## Remaining non-C9 or execution blockers

- external GF 3.12 compile / Wordbench census and scenario execution;
- plural-gender loss in current `Agr.GenNum`, which limits fully correct feminine-plural explicit relative synthesis;
- nominal-core Gen/nyje migration;
- final cross-product certification for clitics, voice, TAM, focus, existentials and RNP where C9 depends on other owners;
- larger gold review after the new probes have executed.

These limitations are not repaired with placeholders in this candidate.
