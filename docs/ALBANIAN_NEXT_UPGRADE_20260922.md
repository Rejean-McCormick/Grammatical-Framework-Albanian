# Albanian RGL — Next Upgrade 2026-09-22

**Status:** normative next implementation cycle  
**Source snapshot:** `Code_snapshot_Grammatical_Framework-Albanian(20260922-123534).zip`  
**Evidence run:** Wordbench `20260922_123316`, GF 3.12  
**Starting structural state:** 49 automatic language targets; 22 PASS / 27 FAIL; 0 scenarios  
**Full source census:** 54 GF files

## 1. Upgrade objective

Restore a trustworthy GF 3.12 compiler gate after the public-surface expansion, while hardening the public paradigms API and validating the newly completed RGL composition.

This upgrade is complete only when:

1. the proven `ParadigmsSqi.mkA2` circular definition is removed;
2. the same overload anti-pattern has been audited across the related public constructor families;
3. the current `missing lock_*` warnings are closed through category-preserving construction;
4. all 54 Albanian GF sources have a recorded compiler result and pass;
5. the five public API facades are part of the release gate;
6. Wordbench reports the real GF fatal diagnostic and reliable source-lock identity;
7. reviewed Albanian scenarios/goldens begin the linguistic certification track.

A compiler-green upgrade is not by itself a linguistic-completion claim.

## 2. U1 — Paradigms overload hardening

### Proven failure

GF 3.12 currently reports:

```text
ParadigmsSqi.gf:
  circular definitions: mkA2
```

The public overload currently redispatches through its own overloaded name. Replace that implementation style with explicitly typed, uniquely named core helpers.

### Normative construction pattern

Use this shape conceptually:

```gf
mkA2Core : A -> Prep -> A2 = \a,p ->
  lin A2 a ** {c2 = p} ;

mkA2 = overload {
  mkA2 : A -> A2 = \a -> mkA2Core a noPrep ;
  mkA2 : A -> Prep -> A2 = \a,p -> mkA2Core a p ;
  mkA2 : Str -> A2 = \s -> mkA2Core (mkA s) noPrep ;
  mkA2 : Str -> Prep -> A2 = \s,p -> mkA2Core (mkA s) p ;
  mkA2 : Str -> Str -> A2 = \s,p -> mkA2Core (mkA s) (mkPrep p) ;
} ;
```

Exact helper names may differ, but these invariants are mandatory:

- no branch calls the overload family by the same overloaded name;
- each branch reaches a uniquely typed implementation path;
- no linguistic information is flattened to a string merely to avoid overload resolution;
- the helper remains internal unless it is intentionally part of the public paradigms API.

### Same-pattern audit set

Audit and, where necessary, refactor in the same cycle:

```text
mkN2
mkA2
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

`mkA2` is the only member proven by the current run to be the active circular-definition error. The others are included because the same self-dispatch pattern appears in the public constructor block and should not be allowed to become the next one-error-per-rerun sequence.

### U1 acceptance

- `ParadigmsSqi.gf` compiles under GF 3.12;
- no `circular definitions` diagnostic remains in the audited overload families;
- the public constructor signatures remain compatible with the pinned RGL API;
- representative `mkN2`/`mkA2`/verbal constructor smoke grammars compile.

## 3. U2 — Dependency ladder and root-cause classification

After each U1 edit, compile in dependency order rather than treating all importer failures as independent:

```text
ParadigmsSqi
  -> LexiconSqi / VerbSqi / affected resource users
  -> StructuralSqi family / ConstructionSqi / ExtendSqi family as applicable
  -> GrammarSqi
  -> LangSqi
  -> AllSqi
```

When a failed target's raw stderr terminates in the same dependency diagnostic, classify it as downstream/blocked. Do not increment the Albanian defect count merely because another importer reaches the same failed dependency.

## 4. U3 — Lock-field closure

The current run exposes nine structural warnings:

```text
AdverbSqi     lock_NP       x2
PhraseSqi     lock_VP       x1
RelativeSqi   lock_VP       x1
SentenceSqi   lock_VPSlash  x1
SentenceSqi   lock_VP       x4
```

Repair each by preserving the native category shape through existing constructors, record extension, or correctly typed retyping. Do not manually fabricate lock fields and do not flatten rich categories to `{s : Str}`.

### U3 acceptance

A full compile contains no unexplained `missing lock field lock_*` warning in the touched Albanian surfaces.

## 5. U4 — Full 54-file public-surface gate

The current census is:

```text
49  AlbanianSQI/GF/lib/src/albanian/*.gf
 5  AlbanianSQI/GF/lib/src/*.gf public API facades
54  total
```

The five required facades are:

```text
CombinatorsSqi.gf
ConstructorsSqi.gf
SymbolicSqi.gf
SyntaxSqi.gf
TrySqi.gf
```

`MarkupSqi.gf` is now part of the 49-file language-folder census.

Until Wordbench automatically discovers all five parent-directory facades, run them explicitly after Global Scan. Record both parts of the gate; do not report `49/49` as full Albanian completion.

### U4 acceptance

```text
language-folder compiler gate: 49/49 PASS
API facade compiler gate:        5/5 PASS
full Albanian compiler gate:    54/54 PASS
```

`LangSqi`/`AllSqi` must compose the supported `MarkupSqi` surface, and `SyntaxSqi` must expose `CombinatorsSqi` consistently with the intended public API.

## 6. U5 — Wordbench evidence hardening

The 2026-09-22 run demonstrates two reporting defects that can obscure Albanian repair work.

### Fatal-diagnostic extraction

Current summary labels such as `Voc`, `Int`, and `N` are not the terminal GF failure. Wordbench should extract/classify the compiler's actual fatal diagnostic, for example:

```text
circular definitions: mkA2
```

The classifier should preserve the full module/source provenance required to distinguish direct from importer/downstream failures.

### Source-lock identity

The summary-level source-lock SHA and the detailed source-lock aggregate disagree in the current artifact. The report generator must expose one canonical source-lock identity or explicitly label the two hashes if they represent different objects.

### U5 acceptance

- a known direct `ParadigmsSqi` failure is classified as direct with its actual GF diagnostic;
- importers of the same failure are classifiable as downstream/blocked;
- summary and detail artifacts agree on source identity or clearly document distinct hash semantics.

## 7. U6 — Linguistic scenarios and goldens

Only after U1–U4 are compiler-green should the project promote scenario evidence.

Minimum next corpus should include:

- noun case/number/definiteness and representative dispatcher boundaries;
- adjective agreement and A2 complementation;
- finite vs embedded/subjunctive verbal behavior;
- transitive/ditransitive and VV/VS/VQ/VA/V2V/V2S/V2Q/V2A/V3 valencies;
- negation, tense, anteriority and agreement interactions;
- clitic placement/contraction/order;
- proper names and `PN` case/agreement through `NamesSqi`;
- `MarkupSqi` preservation of grammatical structure;
- public API smoke scenarios through `SyntaxSqi`/`ConstructorsSqi`/`CombinatorsSqi`/`TrySqi`.

Every accepted golden must be reviewed as Albanian output. A zero-scenario run proves compilation only.

## 8. Upgrade exit criteria

The upgrade may be called **compiler/structural complete** when all of the following are simultaneously true:

- 54/54 GF sources compile from the exact locked snapshot;
- no circular public-overload definition remains in the audited paradigms family;
- no unexplained `missing lock_*` warning remains in the touched surfaces;
- public facades compile and expose the intended language composition;
- Wordbench's report identifies actual root diagnostics and preserves evidence identity;
- the former PMCFG regressions remain absent.

The project may advance toward **linguistic completion** only after reviewed scenario/golden evidence is recorded. The mature/completion release definition in `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` remains unchanged by compiler success alone.

---

## 9. Implementation checkpoint — candidate assembled 2026-09-22

| Upgrade gate | Candidate state | Evidence boundary |
|---|---|---|
| U1 overload hardening | IMPLEMENTED / STATIC PASS | GF 3.12 rerun pending |
| U2 dependency/root-cause ladder | READY | execute after first GF result |
| U3 lock-field closure | STRUCTURAL FIX IMPLEMENTED | zero-warning compiler proof pending |
| U4 complete 54-file gate | STATIC CENSUS PASS 49+5 | 54/54 compile pending |
| U5 Wordbench evidence hardening | OPTIONAL PATCH PREPARED; 59 targeted tests pass | full Wordbench suite/run pending |
| U6 scenarios/goldens | NOT RUN | begins only after compiler gate |

The candidate implementation is described in
`ALBANIAN_UPGRADE_IMPLEMENTATION_20260922.md`. The next operation is validation
of this source state; no completion/release claim follows from the static PASS.
