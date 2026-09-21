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

The FIX22C baseline is historical evidence that the core **did compile** before the later mega-update. The current post-update working snapshot is **not compiler-stable**.

Wordbench Global Scan run `20260921_151446` (GF 3.12) scanned the 47 `.gf` files under `GF/lib/src/albanian`:

```text
files included: 47
PASS:           5
FAIL:          42
ERROR:          0
TIMEOUT:        0
scenarios:      0
```

All 42 compile failures currently converge on the same first compiler error:

```text
ResSqi.gf:347:7
Unexpected token ']'.
Expected: String
```

The current first repair phase is therefore **syntax-integrity recovery**, not VPS/VPI completion, PMCFG redesign, or linguistic tuning.

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

The current scan reports:

- `139` `single_slash_eq` findings across `17` files;
- `9` `untyped_case_str_pat` findings;
- `26` trailing-space findings.

The model-language bundle corroborates the notation distinction: it contains extensive `\\x => ...` table abstractions and `\x -> ...` function abstractions, while no `\x => ...` or `[] => ...` pattern occurs in the supplied model sources. This is corroboration only; the current Albanian expected type and compiler remain authoritative.

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

### 4.4 Immediate first blocker

Repair and compile `ResSqi.gf` first because all current downstream failures stop there. Then rerun the smallest importer chain before using the next Global Scan to reveal the next independent error.

Known same-family sites already visible in `VerbSqi.gf` must be checked after `ResSqi` is green; they are not evidence that every downstream module owns a separate bug.

**G1 PASS:** the current Albanian source parses/compiles far enough that no malformed-notation error masks the next independent compiler layer.

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

- all `.gf` files in `GF/lib/src/albanian`;
- `GF/lib/src/SyntaxSqi.gf`;
- `GF/lib/src/ConstructorsSqi.gf`;
- `GF/lib/src/SymbolicSqi.gf`;
- `GF/lib/src/TrySqi.gf`.

Until Wordbench includes those four parent-directory facades automatically, run them as an explicit supplemental batch and record that the Global Scan itself covered only 47/51 GF files.

### Failure classification

For each failed target, distinguish:

- **DIRECT** — diagnostic points to the target's own source or an independently failing declaration it owns;
- **DOWNSTREAM/BLOCKED** — target fails because an already known dependency fails first;
- **AMBIGUOUS** — evidence is insufficient to assign causality;
- **ERROR/TIMEOUT** — harness/process failure rather than a GF validation result.

A large number of downstream failures must never be counted as the same number of independent Albanian defects.

**G2 PASS:** all 51 GF sources have a recorded result and independent root causes are separated from dependency fallout.

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
