# Albanian RGL — Core v0.1.0

**Version:** `albanian-rgl-core-v0.1.0`  
**Date:** 2026-09-19  
**GF compiler:** 3.12  
**Validation:** GF Wordbench 1.0.0

---

## Status

> **Historical milestone record.** This file describes the exact FIX22C / v0.1.0 baseline. It is not the status of later post-baseline working trees. As of 2026-09-21, the mega-update working snapshot has a syntax-level compile regression documented in `../CURRENT_REPAIR_STATE.md`. Do not rewrite this milestone to match later failures; use it as a regression baseline.

The Albanian RGL has reached a compiler-stable core baseline.

The main grammar, lexicon, construction layer, extension layer, public language facade, and top-level grammar compile successfully with GF 3.12.

This milestone freezes the repaired compiler/structural foundation before the next phase of functional and linguistic completion.

This is **not** the final Albanian RGL 1.0 release.

---

## FIX22C release gate

The following Wordbench targets completed successfully and produced their final `.gfo` artifacts:

| Target | Result |
|---|---|
| `StructuralSqi.gf` | OK |
| `GrammarSqi.gf` | OK |
| `LexiconSqi.gf` | OK |
| `ConstructionSqi.gf` | OK |
| `ExtendSqi.gf` | OK |
| `LangSqi.gf` | OK |
| `AllSqi.gf` | OK |
| `TestSqi.gf` | OK |

GF 3.12 PMCFG internal crash:

```text
ABSENT
```

Release gate:

```text
PASS
```

---

## Major repairs included in this baseline

### ExtendSqi PMCFG crash

The GF 3.12 crash in `GeneratePMCFG.hs` was traced to a parameter-provenance mismatch.

Incorrect:

```gf
v.Indicative ! P.Pres ! P.Sg ! P.P3
```

Correct:

```gf
v.Indicative ! R.Pres ! P.Sg ! P.P3
```

After this correction, `ExtendSqi.gf` reaches PMCFG generation and produces `ExtendSqi.gfo`.

### Verb paradigm dispatch

The lexical verb `bëj` was incorrectly reaching the generic `mkV028` paradigm.

The dispatcher now contains the more specific route:

```gf
_ + "ëj" => mkV042 form;
```

This allows `do_V2` to compile successfully.

### Noun paradigm dispatch

The noun `dashuri` was incorrectly routed to `mkN149`.

The dispatcher now routes the `-uri` class through:

```gf
_ + "uri" => mkN459 form;
```

This allows `love_N` to compile successfully.

---

## Current compiler-stable surface

The following major layers are operational at the compiler level:

- morphology and paradigms;
- nominal grammar;
- verbal grammar;
- adjectives and adverbs;
- numerals;
- sentence formation;
- questions;
- relative clauses;
- conjunction;
- phrase and text layers;
- tense;
- names;
- structural vocabulary;
- standard lexicon;
- constructions;
- `ExtendSqi`;
- `GrammarSqi`;
- `LangSqi`;
- `AllSqi`.

---

## Known warnings

The v0.1.0 core baseline still emits non-blocking compiler warnings.

Known categories include:

- `category DConj is not in abstract`;
- atomic `Prep`, `Quant`, `Pron`, and `Det` terms;
- missing `lock_Prep` fields;
- `must_VV` currently has no linearization;
- `TColon`, `TComma`, and `TSemicolon` are reported as not present in the current abstract;
- several directional `ConstructionSqi` functions are reported as not present in the current abstract.

These warnings are recorded technical debt for the completion phase.

They did not prevent the FIX22C release-gate targets from compiling.

---

## Validation boundary

FIX22C used Wordbench quick validation.

For the release-gate runs:

```text
Scenarios seen: 0
```

Therefore this milestone establishes:

- compiler stability;
- structural composition;
- successful `.gfo` production;
- absence of the former PMCFG crash.

It does **not** yet establish:

- complete linguistic correctness;
- full behavioral coverage;
- complete `ExtendSqi` coverage;
- English-level RGL feature parity;
- final release quality.

---

## Core policy after v0.1.0

The compiler-stable core is a protected regression baseline, not an absolute ban on foundational changes. A later change may reopen `ResSqi`, core categories, or morphology when concrete evidence shows a defect, but the historical FIX22C gate must then be re-established or the deviation explicitly recorded.

The baseline should otherwise be treated as frozen.

Changes to foundational representations such as `ResSqi`, core category representations, or basic morphology should be made only when a concrete test or higher-level implementation exposes a defect.

Development now moves upward toward capability completion.

---

## Next phase — Albanian RGL Completion

This section records the capability priorities anticipated **at the FIX22C milestone**. It is not the current patch order for a later working tree. For the 2026-09-21 mega-update snapshot, follow `../ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md` first.

The post-baseline capability phase focuses on closing the gap with mature RGL languages such as English.

Priorities:

1. complete the remaining `ExtendSqi` families, especially VPS/VPI/VPS2/VPI2;
2. remove provisional or empty implementations;
3. complete and clean `StructuralSqi`;
4. strengthen `ConstructionSqi`;
5. improve irregular morphology and public paradigms;
6. align `LangSqi` and `AllSqi` with the intended full-language surface;
7. add behavioral and linguistic Wordbench scenarios;
8. validate Albanian-specific phenomena;
9. reduce known compiler warnings;
10. prepare the final Albanian RGL release.

---

## Milestone meaning

`albanian-rgl-core-v0.1.0` means:

> The Albanian RGL has a reproducibly compiling GF 3.12 core and is ready for systematic higher-level completion without reopening foundational architecture unless evidence requires it.

The next major target is a linguistically validated, substantially complete Albanian RGL suitable for a `v1.0.0` release.
