# CURRENT_REPAIR_STATE

Status: **live repair state — update after every evidence-changing Wordbench run**  
Last evidence update: **2026-09-21**  
Current phase: **post-mega-update syntax-integrity recovery**  
Operational sequence: `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`

This file records only the latest reproducible working-state facts. Historical FIX22C evidence remains valid for its exact earlier snapshot, but it must not be mistaken for the compiler state of the current post-update source.

## 1. Source / tool lock

- GF: `3.12`
- GF executable in latest Wordbench artifact: `C:/mycode/Grammatical_Framework/gf-3.12-windows/gf.exe`
- RGL root in latest Wordbench artifact: `C:/mycode/Grammatical_Framework/gf-rgl`
- historical last-known compiler-stable Albanian baseline: **FIX22C / `albanian-rgl-core-v0.1.0`**
- current source state: **mega-update after FIX22C; not compiler-stable in the latest Global Scan**
- latest Wordbench evidence: run `20260921_151446`, mode `diagnostic`, Global Scan

If the source snapshot, GF version, RGL revision, or search paths change, current compiler claims must be rerun.

## 2. Latest Wordbench Global Scan

Run: `20260921_151446`  
Mode: `diagnostic` / Global Scan  
GF: `3.12`  
Scenarios: `0`

```text
Files included: 47
Files OK:        5
Files failed:   42
Files errored:   0
Files skipped:   0
Timeouts:        0
```

The five passing files are:

```text
AllSqiAbs.gf
ExtraSqiAbs.gf
IrregSqiAbs.gf
TenseSqi.gf
TestAbs.gf
```

The scan currently covers the `.gf` files in `GF/lib/src/albanian`. The four parent-directory API facades are not in this 47-file census and remain a required supplemental compile set:

```text
SyntaxSqi.gf
ConstructorsSqi.gf
SymbolicSqi.gf
TrySqi.gf
```

## 3. First independent compiler blocker

All 42 failed target compilations currently converge on the same first compiler diagnostic:

```text
ResSqi.gf:347:7:
Syntax error:
  Unexpected token ']'.
  Expected: String
```

Relevant source:

```gf
teWithClitic : Str -> Str = \cl -> case cl of {
  []  => "të" ;
  "e" => "ta" ;
  "i" => "t'i" ;
  "u" => "t'u" ;
  _   => "të" ++ cl
} ;
```

Because `cl : Str`, the empty branch must use a `Str` pattern such as `""`, not `[]`.

**Current causal interpretation:** one confirmed direct parse blocker in `ResSqi` is producing widespread downstream failure. Wordbench 9 reports the 42 as `ambiguous`; that classification is conservative, but the raw logs show the common dependency error explicitly.

## 4. Syntax-integrity findings to resolve before architectural work

The Global Scan static layer reports:

| Finding | Count | Interpretation |
|---|---:|---|
| `single_slash_eq` | 139 across 17 files | strong candidate for table-abstraction corruption; verify expected type before changing |
| `untyped_case_str_pat` | 9 | inspect `case` scrutinee type; `[] =>` is invalid when the scrutinee is `Str` |
| `trailing_spaces` | 26 | hygiene only; not a compiler root |

Canonical notation for current repair:

```gf
-- ordinary function
\x -> expr

-- table value, e.g. Agr => Str
\\x => expr

-- empty string pattern in case on Str
"" => expr

-- empty surface result
_ => []
```

The supplied model-language sources corroborate this distinction: they use ordinary `->` lambdas and double-backslash `=>` table abstractions; the supplied corpus contains no single-backslash `\x =>` form and no `[] =>` pattern. This evidence is structural corroboration only; the exact Albanian local type remains decisive.

## 5. Known same-family sites after `ResSqi`

`VerbSqi.gf` already contains two visible empty-pattern sites that must be checked once `ResSqi` no longer masks them:

```gf
case sl.c2.s of {
  [] => ...
}

case cli of {
  [] => ...
}
```

Both scrutinees are `Str` in the current source, so they belong to the same syntax-repair family. They do not justify editing unrelated modules before the first blocker is advanced.

## 6. Current work order

Do not resume the old fix17/fix18 or PMCFG-first repair sequence. That sequence was superseded by FIX22C and then by the later mega-update.

Current order:

1. repair confirmed parse/syntax corruption, starting with `ResSqi`;
2. verify and repair `single_slash_eq` sites by expected type, never by blind replacement;
3. rerun direct modules and Global Scan to reveal the next independent compiler layer;
4. classify direct versus downstream failures;
5. restore the FIX22C compiler gate plus `SyntaxSqi`, `ConstructorsSqi`, `SymbolicSqi`, `TrySqi`;
6. only then run behavioral/linguistic scenarios and resume capability completion.

## 7. Current status of earlier repair topics

| Earlier topic | Current meaning |
|---|---|
| fix17 / `SlashBareV2S` | historical repair evidence; not current first blocker |
| fix18 / Comp+Imp list family | historical pre-FIX22C repair hypothesis; not current first blocker |
| former `GeneratePMCFG` crash | resolved at FIX22C baseline; keep as regression gate |
| VPS/VPI/VPS2/VPI2 | **ownership reopened by mega-update**: current coordinator-local implementation is provisional; after compiler recovery choose coherent inheritance or a dedicated local companion |
| FIX22C | last known compiler-stable historical baseline, not proof that the current mega-update compiles |

### VPS-family source-policy contradiction

The current `ExtendSqi.gf` is internally inconsistent: its header comments still describe VPS/VPI/VPS2/VPI2 as inherited, while its subtraction list, lincats, and `lin` section locally own that family. Treat this as a **provisional source state**, not an accepted architecture decision. Do not resolve it before the syntax-integrity/compiler gate; once that gate is green, decide the family as a whole according to `ALBANIAN_EXTENDSQI_FINAL_TARGET.md` and `ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md`.

## 8. Documentation synchronization rule

After each evidence-changing run update, at minimum:

- this file;
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md` when symbol/compiler state changes;
- `ALBANIAN_DECISION_LOG.md` when reasoning is accepted/rejected/superseded;
- `ALBANIAN_OPEN_QUESTIONS.md` when priorities change;
- `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md` only if the operational method itself changes.

Stable architectural documents should not be rewritten merely because a transient compiler blocker moved.
