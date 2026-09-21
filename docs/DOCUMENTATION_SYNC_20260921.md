# Albanian documentation synchronization — 2026-09-21

This note records the documentation synchronization performed across the post-FIX22C recovery campaign, including the GF 3.12 Global Scan evidence through run `20260921_201720` and candidate (12).

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

`LexiconSqi.distance_N3` now selects the typed two-argument `mkPrep` overload with explicit Albanian case government (`nga` + Ablative, `deri në` + Accusative), addressing the remaining independent overload failure from run `20260921_201720`.

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
