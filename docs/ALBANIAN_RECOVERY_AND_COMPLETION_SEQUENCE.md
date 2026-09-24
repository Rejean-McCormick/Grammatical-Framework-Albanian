# Albanian RGL — Recovery and Completion Sequence

**Status:** normative operational sequence  
**Last synchronized:** 2026-09-23  
**Historical compiler baseline:** `albanian-rgl-core-v0.1.0` / FIX22C  
**Current working-state authority:** `CURRENT_REPAIR_STATE.md`  
**Final-state authority:** `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`

---

## 0. 2026-09-23 gate transition

Diagnostic run `20260923_183542` advances the project beyond the compiler and
lock-closure gates described later in this historical sequence: 54/54 GF files
compile and structural lock warnings are zero. The active gate is now behavioral
scenario closure.

The current scenario frontier is exactly one case group:
`alb-complement-control` (C0371-C0380). Its observed root is GeneratePMCFG
`Predef.error "Cannot find an inflection rule"`, traced to C0371-C0375 using
`P.mkVV "dua"` instead of canonical irregular `St.want_VV`. The candidate fix
has been applied; the next mandatory step is a GF 3.12 rerun and output review,
not additional morphology expansion.

## 1. Purpose

This document defines **what to do first, next, and last** when advancing the current Albanian RGL.

It fills a deliberate gap between two other documents:

- `CURRENT_REPAIR_STATE.md` says what is true in the latest reproducible run;
- `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` says what must be true in the completed language, but intentionally does not prescribe patch order.

The sequence here follows the GF Compendium rule that a non-compiling snapshot is repaired as a compilation problem before linguistic-output work resumes. Broad inventories are allowed and encouraged, but repairs are ordered by root cause and by the smallest responsible boundary.

---

## 2. Current phase

Wordbench Global Scan `20260922_123316` (GF 3.12) reported:

```text
files included: 49
PASS:          22
FAIL:          27
ERROR:          0
TIMEOUT:        0
scenarios:      0
```

All 49 current language-folder `.gf` files were discovered, including `ExtendSqiVPS.gf` and the new `MarkupSqi.gf`. The five parent-directory API facades were not discovered.

The 27 reported failures are not accepted as 27 independent source defects. Raw stderr converges on the current first root cause:

```text
ParadigmsSqi.gf:
  circular definitions: mkA2
```

Wordbench's current `OTHER: Voc` / `OTHER: Int` / similar labels are diagnostic-extraction artifacts, not the GF root errors. Repair order therefore remains root-cause based.

The current source census is **54 GF files**: 49 language-folder modules plus five public facades (`CombinatorsSqi`, `ConstructorsSqi`, `SymbolicSqi`, `SyntaxSqi`, `TrySqi`).

The active frontier is **G3 root-cause compiler repair at the public paradigms boundary**, immediately followed by structural lock closure and a complete 54-file compile gate. Detailed scope is normative in `ALBANIAN_NEXT_UPGRADE_20260922.md`.

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

The current 2026-09-22 source remains static-clean under the project scanners, and the complete current source census is **54 `.gf` files**:

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

The former `ResSqi` parse blocker and mass notation-corruption family remain repaired. G1 is a **regression gate**, not the active repair frontier. The 2026-09-22 run reaches semantic/module checking and exposes the `mkA2` circular definition rather than a malformed-notation blocker. Historical PMCFG recovery remains a regression boundary.

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

The campaign must include all Albanian sources in the current layout:

- all **49** `.gf` files currently in `GF/lib/src/albanian`, including `ExtendSqiVPS.gf` and `MarkupSqi.gf`;
- `GF/lib/src/CombinatorsSqi.gf`;
- `GF/lib/src/ConstructorsSqi.gf`;
- `GF/lib/src/SymbolicSqi.gf`;
- `GF/lib/src/SyntaxSqi.gf`;
- `GF/lib/src/TrySqi.gf`.

The latest compiler-evidence run (`20260922_123316`) included all 49 language-folder files but **zero** parent-directory API facades. Until Wordbench discovers those five automatically, compile them explicitly and record the automatic/supplemental split.

### Failure classification

For each failed target, distinguish:

- **DIRECT** — diagnostic points to the target's own source or an independently failing declaration it owns;
- **DOWNSTREAM/BLOCKED** — target fails because an already known dependency fails first;
- **AMBIGUOUS** — evidence is insufficient to assign causality;
- **ERROR/TIMEOUT** — harness/process failure rather than a GF validation result.

A large number of downstream failures must never be counted as the same number of independent Albanian defects.

**G2 PASS:** all 54 GF sources have a recorded result and independent root causes are separated from dependency fallout.

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
CombinatorsSqi.gf
ConstructorsSqi.gf
SymbolicSqi.gf
SyntaxSqi.gf
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

---

## 2026-09-23 G5 surface-hygiene checkpoint

G4 is now evidenced by run `20260923_194006` at 54/54, and scenario execution reaches 50/50. Before G5 can be treated as linguistically reviewed, ALB-DEC-055 requires a surface-hygiene rerun: all CASE blocks must realize non-empty output, no literal `&+` may leak into Albanian surface text, and the audited irregular perfects for `blej`, `them`, and `bëhem` must realize their explicit forms. This checkpoint precedes creation/approval of broad goldens; normalization may not hide these defects.

---

## 2026-09-23 targeted recovery after run `20260923_201645`

Before repeating the full G4/G5 campaign, validate the ALB-DEC-056 dependency
ladder in this order:

```text
IrregSqi.gf
  -> LexiconSqi.gf
  -> GrammarSqi / LangSqi / AllSqi
  -> 5 public API facades
  -> complete 54-target census
  -> 50 scenario campaign
  -> surface-hygiene audit / reviewed goldens
```

This ordering follows the Compendium rule that the smallest changed module and
its dependency chain must compile before aggregate validation is used as
acceptance evidence.

---

## 2026-09-24 G5 linguistic root-repair acceptance sequence

Run `20260923_214430` establishes the structural/execution baseline at 54/54 + 50/50.
For ALB-DEC-057, validate in dependency order rather than using the aggregate run as
the first compiler probe:

```text
ResSqi / CatSqi
  -> ParadigmsSqi
  -> IrregSqi + IrregSqiAbs
  -> NounSqi + VerbSqi
  -> LexiconSqi + Structural modules
  -> GrammarSqi / LangSqi / AllSqi
  -> 5 public API facades
  -> complete 54-target compile census
  -> targeted scenarios (verbs, nouns, adjectives, V3, possessives)
  -> all 50 scenarios
  -> reviewed 500-CASE linguistic comparison
  -> approved goldens / T9 evidence
```

Do not regenerate expected goldens from the candidate output.  A compiler-green and
scenario-green rerun proves structural and execution stability only; linguistic
acceptance requires independently reviewed expected forms or accepted variants.
