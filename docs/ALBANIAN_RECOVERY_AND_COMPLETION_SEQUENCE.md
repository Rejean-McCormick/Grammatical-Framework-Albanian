# Albanian RGL — Recovery and Completion Sequence

**Status:** normative operational sequence  
**Last synchronized:** 2026-09-21  
**Historical compiler baseline:** `albanian-rgl-core-v0.1.0` / FIX22C  
**Current working-state authority:** `CURRENT_REPAIR_STATE.md`  
**Final-state authority:** `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`

---

## 1. Purpose

This document defines **what to do first, next, and last** when advancing the current Albanian RGL.

It fills a deliberate gap between two other documents:

- `CURRENT_REPAIR_STATE.md` says what is true in the latest reproducible run;
- `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` says what must be true in the completed language, but intentionally does not prescribe patch order.

The sequence here follows the GF Compendium rule that a non-compiling snapshot is repaired as a compilation problem before linguistic-output work resumes. Broad inventories are allowed and encouraged, but repairs are ordered by root cause and by the smallest responsible boundary.

---

## 2. Current phase

The FIX22C baseline is historical evidence that the core **did compile** before the later mega-update. The current post-update working snapshot is **not yet compiler-stable**, but the textual syntax-integrity layer is clean and the PMCFG repair has now reached the verbal-representation boundary.

Wordbench Global Scan run `20260921_201720` (GF 3.12), validating candidate (11), reported:

```text
files included: 47
PASS:          27
FAIL:          20
ERROR:          0
TIMEOUT:        0
scenarios:      0
```

The run confirms that the clitic-specific repair from ALB-DEC-046 worked: the former `CProj "cl"` backend family disappeared. The dominant remaining PMCFG signature is instead a nested projection through `VP.v.Indicative ! Pres ! Sg ! P1`, reached through the old `subjunctiveFinite` implementation.

Candidate (12) therefore changes the boundary rather than adding another surface-string workaround:

1. `ResSqi.Verb` owns an explicit `Subjunctive : Number => Person => Str` table;
2. generated/paradigm verb constructors populate that table when morphology is built;
3. `VP`/`VPSlash` copy all currently represented verbal tables/forms at the lexical boundary;
4. PMCFG-facing syntax no longer carries or projects through `VP.v`;
5. syntax selects `vp.subjunctive`, but never infers mood from `vp.indicative` strings.

The same candidate fixes the independent `LexiconSqi.distance_N3` overload failure by making preposition government explicit.

The current phase remains **G3 root-cause compiler/PMCFG recovery**. Syntax integrity is a regression gate, not the active first blocker.

---

## 3. Gate G0 — Evidence and source lock

Before changing code:

1. record the exact Albanian source snapshot;
2. record GF version and executable;
3. record RGL root/revision when available;
4. preserve the Global Scan artifacts;
5. keep FIX22C as the last known compiler-stable historical baseline;
6. do not rewrite FIX22C history to match the later broken snapshot.

A later successful run is appended as new evidence; it does not erase the failed run.

---

## 4. Gate G1 — GF syntax integrity

No architectural interpretation is allowed while the compiler is still rejecting malformed GF syntax at a lower boundary.

### 4.1 Canonical GF notation used by Albanian

| Intent | Canonical form | Notes |
|---|---|---|
| ordinary function abstraction | `\x -> expr` | e.g. `Str -> Str`, `VP -> VP` |
| table abstraction | `\\x => expr` | use when constructing a value of type such as `Case => Str`, `Agr => Str`, etc. |
| empty `Str` pattern in `case` | `"" => ...` | a string pattern is required when the scrutinee is `Str` |
| empty token/string result | `... => []` | `[]` is valid as empty surface material/result; it is not the empty-string pattern for `case Str` |

These forms are syntax facts, not Albanian linguistic decisions.

### 4.2 Current syntax evidence

Candidate (12) has been scanned with the Wordbench static-scanning service over the complete current source census of **52 `.gf` files**:

- static findings: `0`;
- scan exceptions: `0`;
- single-backslash table-abstraction corruption (`\x => ...`): `0`;
- `[] => ...` used as a `Str` case pattern: `0`;
- `gf_morphosqi_lint.py` findings: `0`.

The model-language bundle corroborates the notation distinction: it contains extensive `\\x => ...` table abstractions and `\x -> ...` function abstractions, while no `\x => ...` or `[] => ...` pattern occurs in the supplied model sources. This is corroboration only; the current Albanian expected type and compiler remain authoritative.

Heuristic morphology-inference candidates are evidence for review, not failures. They must not be rewritten merely to silence a detector without GF/compiler or linguistic evidence.

### 4.3 Repair rule

Do **not** perform an untyped global replacement.

For every `\x => ...` scan hit:

1. identify the expected type at that exact expression;
2. if the expression constructs a table `A => B`, repair it to `\\x => ...`;
3. if the intended value is an ordinary function, use `\x -> ...`;
4. if neither is justified by the local type, stop and classify the case separately.

For every `[] => ...` finding:

1. identify the scrutinee type;
2. if it is `Str`, use a string pattern such as `"" => ...` when the intended case is the empty string;
3. do not convert `=> []` result expressions, which are a different construct.

### 4.4 Current G1 state

The former `ResSqi` parse blocker and the mass notation-corruption family remain repaired through candidate (12). G1 is therefore a **regression gate**, not the active repair frontier.

The next local GF 3.12 validation must confirm that no parse/notation failure reappears while testing the Verb→VP PMCFG repair derived from run `20260921_201720`.

**G1 PASS:** the current Albanian source contains no known malformed-notation blocker and the local GF run reaches the next independent compiler layer.

---

## 5. Gate G2 — Global compile census

After each coherent syntax-repair batch, run Wordbench:

```text
Mode: Diagnostic
Target: <empty>  -> Global Scan
Scenarios: off
Continue after failure: on (Global Scan behavior)
```

The inventory is exhaustive even though repair remains root-cause ordered.

### Required coverage

The campaign must include all Albanian language sources:

- all **48** `.gf` files currently in `GF/lib/src/albanian`, including `ExtendSqiVPS.gf`;
- `GF/lib/src/SyntaxSqi.gf`;
- `GF/lib/src/ConstructorsSqi.gf`;
- `GF/lib/src/SymbolicSqi.gf`;
- `GF/lib/src/TrySqi.gf`.

The latest compiler-evidence run (candidate 11, `20260921_201720`) still included only 47 files. It therefore missed **five** current targets: `ExtendSqiVPS.gf` plus the four parent-directory facades. Until Wordbench discovers all five automatically, compile them explicitly and record the automatic/supplemental split.

### Failure classification

For each failed target, distinguish:

- **DIRECT** — diagnostic points to the target's own source or an independently failing declaration it owns;
- **DOWNSTREAM/BLOCKED** — target fails because an already known dependency fails first;
- **AMBIGUOUS** — evidence is insufficient to assign causality;
- **ERROR/TIMEOUT** — harness/process failure rather than a GF validation result.

A large number of downstream failures must never be counted as the same number of independent Albanian defects.

**G2 PASS:** all 52 GF sources have a recorded result and independent root causes are separated from dependency fallout.

---

## 6. Gate G3 — Root-cause compiler repair

Once G2 exposes independent failures, repair them in this order:

1. textual/parse syntax;
2. environment/import/version errors;
3. unknown symbols/API ownership;
4. type and category-contract errors;
5. lock/retyping/inheritance errors;
6. missing linearizations;
7. PMCFG/backend or representation-complexity failures.

For each patch:

- change the smallest responsible boundary;
- preserve typed information required downstream;
- patch coherent families together when they share one contract;
- compile the changed module;
- compile its nearest importer/facade;
- periodically rerun the full Global Scan to update the census.

Do not use empty strings, broad `variants {}`, record flattening, copied lock fields, or model-language surface behavior merely to make the compiler advance.

For verbal PMCFG failures, apply the following additional boundary rule:

- if syntax needs a grammatical distinction such as subjunctive mood, encode/select it as a typed morphology dimension before final clause realization;
- do not recover that distinction by `case` analysis over a realized `Str`;
- do not force PMCFG to descend through nested lexical records when the same required information can be copied as structured tables at the lexical-to-VP boundary;
- preserve all downstream-used dimensions when changing that boundary. Moving `Verb` information into `VP` is acceptable only when the required tables/forms remain represented, not when they are collapsed to one surface string.

Candidate (12) is the current application of this rule: explicit `Verb.Subjunctive`, structured VP form tables, no `VP.v` projection.

---

## 7. Gate G4 — Restore and exceed the FIX22C compiler baseline

Before semantic completion resumes, the current source must re-pass at least the historical FIX22C gate:

```text
StructuralSqi.gf
GrammarSqi.gf
LexiconSqi.gf
ConstructionSqi.gf
ExtendSqi.gf
LangSqi.gf
AllSqi.gf
TestSqi.gf
```

It must also compile the public API facades:

```text
SyntaxSqi.gf
ConstructorsSqi.gf
SymbolicSqi.gf
TrySqi.gf
```

Requirements:

- final `.gfo` artifacts produced;
- no unexplained syntax/type/lock error;
- no recurrence of the former `GeneratePMCFG` crash;
- warnings classified rather than silently ignored.

Passing G4 restores compiler/structural confidence. It still does not prove Albanian output correctness.

---

## 8. Gate G5 — Linguistic and behavioral validation

Only after G4 is green should Wordbench scenarios become the primary gate.

Validate, with reviewed Albanian goldens:

- morphology paradigms and dispatcher boundaries;
- nominal case/number/gender/definiteness;
- adjective agreement/linking article behavior;
- finite and embedded verbs;
- tense × anteriority × polarity × agreement;
- clitic selection, contraction and ordering;
- questions, relatives, imperatives and subordination;
- coordination and correlative conjunctions;
- VPS/VPI/VPS2/VPI2 families;
- Construction/Structural/Lexicon integration;
- parse/generate round trips where stable enough to be meaningful.

A generated string never becomes a golden merely because the current grammar generated it.

---

## 9. Gate G6 — Capability completion

After the working tree is structurally stable and behavioral evidence exists, continue toward the final target in `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`.

Prioritize missing capability by producer/consumer need and linguistic evidence, not by source-file order. In particular:

- VPS/VPI work is resumed only after its core VP/clause prerequisites are stable;
- `ExtendSqi` stays a thin coordinator and companion modules own language-specific families;
- model languages provide engineering patterns only after Albanian contracts are fixed;
- foundational representations may be reopened when a concrete higher-level test proves information loss, even though FIX22C is the historical baseline.

---

## 10. Definition of the optimal current path

The current optimal path is:

```text
freeze evidence
  -> restore GF syntax integrity
  -> global compile census
  -> classify DIRECT vs DOWNSTREAM
  -> repair independent compiler roots
  -> re-pass FIX22C + public facades
  -> run reviewed linguistic scenarios
  -> resume capability completion
  -> final release gates
```

This sequence supersedes any older note that names fix17, fix18, the Comp/Imp warning family, or the former PMCFG crash as the **current first blocker**. Those records remain historical evidence only.
