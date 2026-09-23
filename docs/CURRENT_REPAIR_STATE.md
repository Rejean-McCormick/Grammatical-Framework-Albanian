# Albanian current repair state

**Updated:** 2026-09-23  
**Compiler:** GF 3.12  
**Validation tool:** GF Wordbench Diagnostic / Global Scan  
**Compendium protocol:** `TEST_RGL`

## 0. Evidence overlay — 2026-09-23

Wordbench diagnostic run `20260923_183542` on GF 3.12 supersedes the older
2026-09-22 current-run claims below wherever they conflict. The exact run
reported:

```text
complete GF census:       54/54 OK
structural lock warnings: 0
scenarios:                50
scenario OK:              49
scenario FAIL:             1
scenario ERROR:            0
```

The sole failing scenario was `alb-complement-control`. Its raw stdout begins
with the root diagnostic:

```text
Internal error in GeneratePMCFG:
    evalTerm (Predef.error "Cannot find an inflection rule")
```

and only afterwards emits repeated `empty grammar, no abstract` messages. The
latter are downstream shell symptoms, not the primary cause.

Source review localizes the candidate defect to validation cases C0371-C0375:
`AlbCampaign038Sqi.gf` constructed Albanian *dua* through `P.mkVV "dua"`. The
string overload delegates to regular verb inference, while *dua* is already
modeled canonically as irregular `IrregSqi.dua_V` and exported as
`StructuralSqi.want_VV`. The validation campaign now uses `St.want_VV` for
C0371-C0375. C0376-C0380 are unchanged. The scenario input SHA-256 lock was
updated accordingly.

This is a candidate repair until a fresh GF 3.12 scenario run confirms it. It
does **not** justify adding an irregular exception to `regV`, and it does not
claim 50/50 behavioral success before rerun.

## 1. Historical evidence lock — 2026-09-22

- current source snapshot supplied by the maintainer: `Code_snapshot_Grammatical_Framework-Albanian(20260922-123534).zip`
- latest Wordbench run: `20260922_123316`
- GF executable recorded by the run: `C:/mycode/Grammatical_Framework/gf-3.12-windows/gf.exe`
- RGL root recorded by the run: `C:/mycode/Grammatical_Framework/gf-rgl`
- historical compiler-stable baseline: FIX22C / `albanian-rgl-core-v0.1.0`
- current source census: **54 `.gf` files** = 49 language-folder sources + 5 parent-directory API facades

Compiler claims below apply only to this source/run combination.

### Evidence-integrity note

The detailed Wordbench source lock records aggregate SHA-256:

```text
7293e6436ea09d8f2631179a19964eff0af7667a417b018f80928bbb2b5f450d
```

while `summary.md` displays a different source-lock hash. The 2026-09-22 manual cross-check matched the 49 automatically scanned source entries to the supplied snapshot. Treat the hash-display disagreement as a Wordbench reporting defect to repair; do not use the summary-only hash as stronger evidence than the detailed source lock.

## 2. Historical Global Scan — 2026-09-22

```text
Files included:       49
Files OK:             22
Files failed:         27
Files errored:         0
Files skipped:         0
Direct failures:       0   # classifier output, not accepted causal count
Downstream failures:   0   # classifier output, not accepted causal count
Ambiguous failures:   27
Scenarios seen:        0
GF:                  3.12
```

The run is **22/49 green** at the automatic language-folder level, but the 27 reported failures do **not** represent 27 independent Albanian defects.

Raw GF stderr for `ParadigmsSqi` and its failed importers converges on one proven root diagnostic:

```text
ParadigmsSqi.gf:
  circular definitions: mkA2
```

The `summary.md` labels such as `Voc`, `Int`, and `N` are not the real GF error. They are artifacts of the current Wordbench first-error extraction, which is reading an early stderr token instead of the terminal fatal diagnostic.

Therefore the current first independent compiler blocker is:

> **`ParadigmsSqi.mkA2` contains recursive dispatch inside its own overload family and GF 3.12 rejects it as a circular definition.**

Importer failures must remain grouped as downstream until a post-fix rerun proves an additional independent cause.

## 3. Compendium evidence state

The run's `compendium_matrix.json` reports:

```text
highest_evidenced_level: T0
T0  environment_and_source_integrity   PASS
T1  resource_and_parameter_tests       NOT ASSESSED
T2  morphology_tests                   NOT ASSESSED
T3  public_paradigm_tests              NOT ASSESSED
T4  category_construction              NOT ASSESSED
T5  abstract_constructor_tests         NOT ASSESSED
T6  feature_interactions               NOT ASSESSED
T7  syntax_module_tests                NOT ASSESSED
T8  aggregate_language_compile         FAIL
T9  parse_and_generation_behavior      NOT ASSESSED
T10 regression_validation              NOT ASSESSED
T11 family_and_release_checks          NOT ASSESSED
```

This means the run establishes source/environment integrity and a failed aggregate compile. It does **not** establish the unexecuted intermediate levels, and it establishes no linguistic certification.

`rgl_coverage.json` correspondingly reports `structural_incomplete`, 49 modules seen, and an empty `api_facade_modules` list.

## 4. Current direct repair frontier — ALB-DEC-050 / ALB-DEC-051

### 4.1 Proven defect

The current `mkA2` overload contains `Str` branches that call `mkA2` again from inside the same overload family. GF 3.12 treats that definition as circular.

The repair rule is to introduce uniquely named, explicitly typed core helpers and make each overload branch call the helper directly. The overload must dispatch only at the public boundary; it must not redispatch by its own overloaded name.

### 4.2 Required family audit

The same source region contains other public overload families with self-dispatch patterns that must be audited in the same upgrade before declaring `ParadigmsSqi` repaired:

```text
mkN2
mkA2              # proven current failure
mkV2
mkVV
mkVS
mkVQ
mkVA
mkV2V
mkV2S
mkV2Q
mkV2A
mkV3
```

Only `mkA2` is proven by the current compiler run to be the active circular-definition failure. The sibling list is a preventive same-pattern audit requirement, not a claim that every item already has an independently observed compiler error.

The precedent is ALB-DEC-048: when GF 3.12 could not safely resolve an overloaded `mkPrep` path, the project moved construction behind a locally typed helper instead of relying on overload inference.

## 5. Structural warning frontier

The latest run contains nine `missing lock field` warnings in otherwise compiling modules:

```text
AdverbSqi.gf     lock_NP       x2
PhraseSqi.gf     lock_VP       x1
RelativeSqi.gf   lock_VP       x1
SentenceSqi.gf   lock_VPSlash  x1
SentenceSqi.gf   lock_VP       x4
```

Project policy already states that `missing lock_*` is evidence of category-shape damage until proved otherwise. These warnings are therefore **blocking structural defects for the next clean-build gate**, not cosmetic noise.

Do not copy lock fields manually merely to silence the compiler. Repair the constructor/retyping path that loses the category shape.

## 6. Complete compiler census — now 54, not 52

The current source tree contains:

```text
49 .gf files under AlbanianSQI/GF/lib/src/albanian
 5 .gf API facades under AlbanianSQI/GF/lib/src
-------------------------------------------------
54 GF files total
```

The five parent-directory API facades are:

```text
CombinatorsSqi.gf
ConstructorsSqi.gf
SymbolicSqi.gf
SyntaxSqi.gf
TrySqi.gf
```

The 2026-09-22 Global Scan included all 49 language-folder files, including the newly present `MarkupSqi.gf`, but included **zero** API facades. A green `49/49` automatic scan is therefore necessary but not sufficient.

Required complete compiler census: **54/54 GF files**.

Until Wordbench discovers the facades, compile those five explicitly and record the automatic/supplemental split.

## 7. Next upgrade — normative execution order

The next upgrade is one coherent recovery-and-validation cycle:

1. **Paradigms overload hardening** — remove self-dispatch from `mkA2` and audit the sibling overload families listed in §4.2 through typed non-overloaded helpers.
2. **Nearest-importer compiler ladder** — compile `ParadigmsSqi`, then affected lexical/verbal/structural importers, then `GrammarSqi`, `LangSqi`, and `AllSqi`; do not wait for the full scan to discover a local type error.
3. **Lock-field closure** — eliminate the nine current `lock_NP` / `lock_VP` / `lock_VPSlash` warnings by preserving native category shape.
4. **Full 54-file gate** — obtain 49/49 language-folder compile plus explicit/automatic PASS for all five API facades, including `CombinatorsSqi`.
5. **Wordbench diagnostic hardening** — classify the actual GF fatal diagnostic rather than `Voc`/`Int`/`N`, group importer failures as downstream when stderr provenance is clear, and reconcile the source-lock hash displayed in the summary with the detailed lock.
6. **Behavioral gate** — only after the structural/compiler gate is green, run reviewed Albanian scenarios/goldens for morphology, agreement, case, complementation, clitics, embedding, `PN`/Names, Markup-preserving composition, and public API usage.

No completion-release claim is allowed from a zero-scenario run.

The detailed scope and acceptance criteria are in `ALBANIAN_NEXT_UPGRADE_20260922.md`.

## 8. Historical progression

| Snapshot/run | Evidence |
|---|---|
| FIX22C | historical compiler-stable core baseline |
| early post-mega scan | 5 PASS / 42 FAIL; syntax corruption/root parse blocker |
| run `20260921_201720` | 27 PASS / 20 FAIL; nested `VP.v.Indicative` root identified |
| ALB-DEC-047 | explicit `Verb.Subjunctive` and structured Verb→VP boundary |
| run `20260921_212128` | 40 PASS / 7 FAIL; no PMCFG crash; ALB-DEC-047 confirmed |
| ALB-DEC-048 | Prelude visibility + typed `distance_N3` prepositions |
| run `20260921_213424` | 45 PASS / 2 FAIL; final blocker was `LangSqi` helper-name collision |
| ALB-DEC-049 overlay | Construction helper namespace isolated; public surface expanded with Markup/Combinators work |
| run `20260922_123316` | **22 PASS / 27 FAIL over all 49 language-folder sources; one proven root compiler defect: `ParadigmsSqi.mkA2` circular definition; 0 scenarios; API facades not included** |

Historical runs remain evidence for their exact source snapshots. They do not override the current source/run pair.

## 9. Documentation synchronization rule

After each evidence-changing run update, update at minimum:

- this file;
- `ALBANIAN_DECISION_LOG.md`;
- `ALBANIAN_OPEN_QUESTIONS.md`;
- `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`;
- `status/ALBANIAN_IMPLEMENTATION_STATUS.md`;
- the latest `DOCUMENTATION_SYNC_*.md` note;
- `ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md` when the target census changes;
- symbol/test ledgers when their specific evidence changes.

---

## 10. Upgrade candidate implementation state — 2026-09-22

The next-upgrade source edits are now implemented in the candidate tree.
This changes the **source state**, not the latest external compiler evidence.
Run `20260922_123316` remains the most recent GF 3.12 compiler result until a
new run is produced from this candidate.

Implemented candidate facts:

```text
Paradigms audited overload self-dispatch: removed (12/12 families)
VP/VPSlash resource boundary:             centralized in ResSqi
CatSqi VP/VPSlash lincats:                aliases to ResSqi types
Adverb NP helper coercions:               removed
complete source census:                   49 + 5 = 54 GF files
static upgrade gate:                      PASS
GF 3.12 compile gate:                     NOT RUN in assembly environment
scenario/golden gate:                     NOT RUN
```

The immediate next action is therefore **validation, not another feature
expansion**: run the supplied 54-target validator with GF 3.12, close any new
independent compiler diagnostic it exposes, and only then proceed to the
behavioral scenario/golden gate.

See `ALBANIAN_UPGRADE_IMPLEMENTATION_20260922.md` for the exact implementation
and evidence boundary.
