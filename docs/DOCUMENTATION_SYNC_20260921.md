# Albanian documentation synchronization — 2026-09-21

This note records the documentation synchronization performed across the post-FIX22C recovery campaign, including GF 3.12 Global Scan evidence through run `20260921_212128` and the ALB-DEC-048 cleanup.

## Why the documentation changed

The bundle had accumulated several different states: historical pre-FIX22C repair chronology, the FIX22C compiler-stable milestone, the post-FIX22C mega-update, the syntax-integrity recovery, and successive PMCFG experiments. The documentation is now organized so that historical successes are not mistaken for current compiler facts and provisional backend workarounds are not mistaken for stable architecture.

## Normative operational order

The active order remains:

```text
syntax-integrity recovery
  -> exhaustive 52-file compile census
  -> DIRECT vs DOWNSTREAM classification
  -> smallest-boundary root-cause compiler repair
  -> restore/exceed FIX22C + public-facade compiler gates
  -> linguistic scenarios / reviewed goldens
  -> capability completion
  -> release validation
```

`ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md` owns that order. `CURRENT_REPAIR_STATE.md` owns the live blocker. `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` owns the final-state destination.

## Syntax invariant

```gf
\x -> expr       -- ordinary function abstraction
\\x => expr      -- table abstraction
"" => expr       -- empty Str pattern
_ => []          -- empty surface result
```

Static findings must be checked against the local type; no blind replacement is authorized. This gate is currently clean and remains a regression gate.

## PMCFG / Verb→VP representation synchronization

Run `20260921_201720` established a new root cause after the earlier clitic repair: GF 3.12 no longer crashed on `CProj "cl"`, but repeatedly descended through `CProj "Indicative" (CProj "v" ...)` while syntax reconstructed the Albanian subjunctive by inspecting present-indicative strings.

ALB-DEC-047 therefore makes the following rule normative for candidate (12):

- `ResSqi.Verb` carries an explicit `Subjunctive : Number => Person => Str` table;
- existing paradigm logic populates that table at verb construction time;
- `VP`/`VPSlash` copy the complete currently represented verbal form inventory needed downstream;
- syntax selects structured forms and must not infer grammatical mood by `case` analysis over realized strings;
- the nested `VP.v.Indicative` path is removed from PMCFG-facing syntax without flattening the verbal paradigm to one `Str`.

The supplied model languages corroborate this engineering direction: Romanian represents subjunctive/conjunctive explicitly, Bulgarian and German centralize VP realization through structured helpers, and Greek encodes mood in morphology even where a VP retains a verb record. These are representation precedents, not Albanian linguistic authority.

## Clitic synchronization

ALB-DEC-046 remains accepted for the clitic boundary: `cl : Str` and `subjcl : Str` are determined when the object is introduced rather than by later `case Str` inspection. The now-unused `teWithClitic` helper has been removed so the source no longer advertises the rejected late-string-analysis pattern.

## Independent same-run repair

The candidate after run `20260921_201720` attempted the typed two-argument `mkPrep` overload for `LexiconSqi.distance_N3`. Run `20260921_212128` proved that this was insufficient: GF 3.12 still could not resolve `ParadigmsSqi.mkPrep` for `Str` + aliased `R.Case`. ALB-DEC-048 therefore constructs `Prep` directly through a local typed helper while preserving `nga` + Ablative and `deri në` + Accusative government.

## VPS/VPI ownership

The old inheritance-only rule remains historical evidence but is not an unconditional current prescription. Local companion ownership remains provisional until the full compiler/PMCFG gate and Albanian behavioral scenarios are green. `ExtendSqi.gf` must remain a thin coordinator.

## Validation status

Candidate (12) has passed static preflight only:

- 52 `.gf` files in the full current census;
- Wordbench static scan: 0 findings / 0 exceptions;
- `gf_morphosqi_lint.py`: 0 findings;
- `MorphoSqi.gf`: 135 `lin V` blocks, all carrying `Indicative`, `Subjunctive`, and `Imperative`;
- whole-file delimiter balance: clean.

During this preflight, 51 accidental extra record openings from the bulk `Subjunctive` insertion were detected and repaired. `gf_morphosqi_lint.py` was strengthened so this structural class is now a permanent local guard rather than relying on the lexical scanner.

It is **not** compiler-validated until an exact-source GF 3.12 Global Scan plus the five supplemental targets reports the result.


## Run 20260921_212128 — ALB-DEC-047 confirmed

The GF 3.12 Global Scan improved to **40 PASS / 7 FAIL** over 47 automatically discovered targets. Crucially, no `GeneratePMCFG` crash remains; the explicit `Verb.Subjunctive` and structured Verb→VP boundary are therefore compiler-confirmed for the scanned source.

The seven FAILs reduce to three local source defects: missing `Prelude` visibility in `ExtendSqiRNP`, missing `Prelude` visibility in `ExtendSqiVPBridge`, and `LexiconSqi.distance_N3` overload resolution. ALB-DEC-048 fixes these without reopening the verbal architecture.

Documentation synchronized in this pass: `CURRENT_REPAIR_STATE.md`, `ALBANIAN_DECISION_LOG.md`, `ALBANIAN_OPEN_QUESTIONS.md`, `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`, and `status/ALBANIAN_IMPLEMENTATION_STATUS.md`.

## Run 20260921_213424 — ALB-DEC-048 direct fixes confirmed

The GF 3.12 Global Scan now reports **45 PASS / 2 FAIL** over the same 47 automatically discovered targets.

Confirmed by this run:

- `ExtendSqiRNP`: PASS;
- `ExtendSqiVPBridge`: PASS;
- `LexiconSqi`: PASS;
- `ExtendSqi`: PASS;
- `ExtraSqi`: PASS;
- no `GeneratePMCFG` failure.

The remaining `LangSqi` and `AllSqi` failures share a single module-composition diagnostic: `ConstructionSqi.addPost` collides with an already-exported `addPost` from the grammar/verb layer. A namespace audit also finds `baseVP` duplicated across the same boundary. ALB-DEC-049 therefore renames both Construction-only helpers (`constructionAddPost`, `constructionBaseVP`) and changes no linguistic representation.

The next compiler gate is 47/47 automatic targets, followed by the five omitted targets required for the complete 52-file census.

