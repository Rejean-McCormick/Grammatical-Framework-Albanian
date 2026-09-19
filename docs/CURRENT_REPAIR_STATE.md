# CURRENT_REPAIR_STATE

Status: **live repair state — update after every evidence-changing Wordbench run**  
Last evidence update: 2026-09-18  
Target: `GF/lib/src/albanian/ExtendSqi.gf`

This file is intentionally short and volatile. It records **what is true in the latest reproducible run**, while the override matrix records stable ownership and the decision log records history.

## 1. Source / tool lock

- GF: `3.12.0`
- GF executable used by Wordbench: `C:/mycode/Grammatical_Framework/gf-3.12-windows/gf.exe`
- GF build commit previously recorded for this repair cycle: `fa2826d`
- RGL root: `C:/mycode/Grammatical_Framework/gf-rgl`
- pinned RGL commit used by the AI Compendium: `62c5030be182fdb1289dd472a28027fc5718dcde`
- last compiler-validated cumulative Albanian repair state: through **fix17**
- fix17 overlay SHA-256: `2e99c62ef82eed8b7f06c140785e61379044ee9f6e96909992672e9ce1f0aa8d`
- active source candidate: **fix18 / complete `Comp` + `Imp` list boundary family — NOT YET RUN**

If any of these source/tool facts change, previous compiler evidence becomes stale until rerun.

## 2. Latest Wordbench evidence

Run: `20260918_210629`  
Mode: `quick`  
Target: `ExtendSqi.gf`  
Overall status: **FAIL**  
`ExtendSqi.gfo`: **not produced**; only a temporary `ExtendSqi.gfo.tmp...` artifact exists

The raw verbose PMCFG tail is authoritative. Wordbench's summarized `OTHER: Voc` label remains a verbose-parser artifact rather than the current semantic blocker.

### Relevant completed entries

```text
+ PossPronRNP 324 (28,28)
...
+ SlashBareV2S 1 (1,1)
+ StrandQuestSlash 1 (1,1)
+ StrandRelSlash 1 (1,1)
...
+ youPolPl_Pron 1 (1,1)
<GeneratePMCFG non-exhaustive-pattern crash after the final named entry>
```

Therefore:

- fix16 `PossPronRNP` remains **PMCFG-confirmed structurally** as `(28,28)`;
- fix17 `SlashBareV2S` is **PMCFG-confirmed structurally** as `(1,1)`;
- GF now reaches the end of the named PMCFG declarations before crashing;
- the six missing `Comp`/`Imp` list linearizations are the first unresolved structural family, but their causal role in the final PMCFG crash is **not yet proven**.

## 3. Current warning state

GF 3.12 reports exactly this boundary family:

```text
Warning: no linearization of BaseComp
Warning: no linearization of BaseImp
Warning: no linearization of ConjComp
Warning: no linearization of ConjImp
Warning: no linearization of ConsComp
Warning: no linearization of ConsImp
```

No current `missing lock_*` cluster is present.

## 4. Current active symbol states

| Symbol/family | Compiler status | Linguistic status | Current rule |
|---|---|---|---|
| `FrontComplDirectVS` | `pmcfg_confirmed` | `provisional` | keep fix15 compositional path; direct-speech realization still needs targeted linguistic validation |
| `PossPronRNP` | `pmcfg_confirmed` `(28,28)` | `provisional` | keep fix16 core-composition path |
| `SlashBareV2S` | `pmcfg_confirmed` `(1,1)` | `provisional` | keep fix17 inherited `SlashV2S` path; dead local helper may be removed later |
| VPS/VPI/VPS2/VPI2 inherited family | `pmcfg_incomplete_by_design` (`(0,0)` on `variants {}` members) | `incomplete` | keep inherited this cycle |
| `Base/Cons/ConjComp` + `Base/Cons/ConjImp` | `not_run_after_change` (previous state: six missing-linearization warnings) | `provisional` | fix18 implements all six as one family in `ExtendSqiScaffolding`, with exact ListComp/ListImp retyping in the coordinator |
| `ComplGenVV` | `pmcfg_confirmed` | `provisional` | structural reuse accepted; `Ant`/`Pol` semantics remain open |

## 5. Active fix18 probe — `Comp` / `Imp` list boundary family

### Evidence gate

1. abstract `Extend` declares `[Comp]{2}`, `ConjComp : Conj -> ListComp -> Comp`, `[Imp]{2}`, and `ConjImp : Conj -> ListImp -> Imp`; generated `Base*`/`Cons*` constructors therefore require concrete linearizations;
2. pinned `ExtendFunctor` supplies no `Base/Cons/ConjComp` or `Base/Cons/ConjImp` implementation;
3. Albanian `CatSqi` has `Comp = {s : Str}`, `Imp = {s : Str}`, and `Conj = {s : Str}`;
4. current `ExtendSqi` already fixes both list boundaries to `{init,last : Str}`;
5. Albanian `ConjunctionSqi` already uses the exact string-list pattern for `S`, `Adv`, `AdV`, `IAdv`, and `RS`: Base splits first/last, Cons appends comma-separated material into `init`, and Conj joins `init`, conjunction, and `last`;
6. run `20260918_210629` reaches the end of all named PMCFG entries, while these six linearizations are still explicitly absent;
7. AI Compendium policy requires one coherent family patch rather than dummy outputs, unrestricted variants, or piecemeal warning suppression.

### fix18 candidate

Implement the six functions together in `ExtendSqiScaffolding.gf`, and keep `ExtendSqi.gf` as category-explicit wiring only:

```gf
BaseComp / ConsComp / ConjComp
BaseImp  / ConsImp  / ConjImp
```

The family mirrors current Albanian string-list coordination. `ListComp` and `ListImp` retyping remains in the concrete coordinator so the generated category locks are preserved at the exact boundary.

### Acceptance gate

Run verbose `Quick -> ExtendSqi.gf`.

- **Primary PASS:** all six `no linearization` warnings disappear.
- **Strong PASS:** `ExtendSqi.gfo` is produced and the final PMCFG crash disappears.
- **Partial PASS:** warnings disappear but PMCFG still crashes after the final named entry; then fix18 is structurally useful but not the complete root-cause repair.
- **FAIL:** new type/lock errors appear or one of the six linearizations is still missing; revert/minimize the family wiring rather than adding placeholders.

## 6. Documentation synchronization after the next run

Always update:

- this file (`CURRENT_REPAIR_STATE.md`);
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md` for any symbol whose compiler/linguistic status changed;
- `ALBANIAN_DECISION_LOG.md` when an experiment changes accepted reasoning;
- `ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md` only when stable ownership/acceptance truth changes;
- `ALBANIAN_OPEN_QUESTIONS.md` only when an unresolved design question is answered or reprioritized.
