# ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX

Status: normative ownership matrix for the current development cycle  
Scope: `GF/lib/src/albanian/ExtendSqi.gf` and its companion extension modules  
Live run state: see `CURRENT_REPAIR_STATE.md`  
Authority: exact abstract contract + current Albanian category/source contract > exact inherited/functor source > accepted Albanian architecture > compatible model-language corroboration; current compiler output is authoritative for build facts on the same source state

---

## 1. Fixed architectural decisions

This matrix assumes the following decisions are already locked for the Completion phase:

- `ExtendSqi.gf` is a **thin coordinator**.
- Companion modules align to the coordinator contract, not the other way around.
- Inheritance is the default until Albanian evidence justifies a coherent local subsystem.
- The VPS/VPI/VPS2/VPI2 family is currently in an **Architecture Gate / ownership transition** state: inherited placeholders are allowed temporarily, but the family is now an explicit completion target.
- `ExtendSqiVPS.gf` may be introduced only when its local ownership is compatible with the coherent family contract in `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` and the live evidence state authorizes the transition.
- No local override is accepted unless there is Albanian-specific evidence or a clear structural need.
- Each override family must be coherent as a family; no one-off drift.
- Local boundary `lincat` declarations do not by themselves establish final ownership or final category design.

---

## 2. Coordinator module

### File
- `GF/lib/src/albanian/ExtendSqi.gf`

### Role
Thin wiring layer only.

### Allowed contents
- subsystem imports
- override subtraction list
- subsystem-to-function renamings
- minimal boundary `lincat` declarations when explicitly justified by this matrix and the lockfield/boundary guide

### Disallowed contents
- new local helper logic
- local ad hoc record construction
- VPS/VPI/VPS2/VPI2 implementation machinery directly in the coordinator; if activated, family logic belongs in `ExtendSqiVPS.gf`
- repair code that belongs in companion modules
- local ownership of functions marked **inherit** in this matrix

### Coordinator ownership rule
If a function is marked **inherit** in this matrix, `ExtendSqi.gf` must not:
- subtract it from `ExtendFunctor`
- wire a local replacement
- or reintroduce local family logic around it

unless this matrix is updated first with:
- the exact abstract signature
- the exact `ExtendFunctor` path
- the Albanian-specific reason for changing ownership
- and the acceptance rule for the new owner

---

## 3. VPS/VPI ownership transition and inherited defaults

The VPS/VPI/VPS2/VPI2 family was intentionally kept inherited during compiler stabilization. That decision protected the v0.1.0 core, but it is no longer a permanent Completion constraint.

### Current mode

Until the Architecture Gate is complete, the family remains inherited/provisional. Inherited `variants {}` and `(0,0)` members are classified as **known completion gaps**.

The family in scope is:

- `VPS`, `ListVPS`;
- `VPI`, `ListVPI`;
- `VPS2`, `ListVPS2`;
- `VPI2`, `ListVPI2`;
- `MkVPS`, `BaseVPS`, `ConsVPS`, `ConjVPS`, `PredVPS`, `QuestVPS`, `SQuestVPS`, `RelVPS`;
- `MkVPI`, `BaseVPI`, `ConsVPI`, `ConjVPI`, `ComplVPIVV`;
- `MkVPS2`, `BaseVPS2`, `ConsVPS2`, `ConjVPS2`, `ComplVPS2`, `ReflVPS2`;
- `MkVPI2`, `BaseVPI2`, `ConsVPI2`, `ConjVPI2`, `ComplVPI2`.

### Activation rule for local ownership

Local Albanian ownership may be activated only when all of the following are true:

1. the producer/consumer map identifies the required retained information;
2. Wordbench scenarios demonstrate the current information-loss boundary;
3. the minimal core verbal realization contract is known;
4. the family can be implemented coherently rather than one function at a time;
5. ownership is recorded here before coordinator wiring changes;
6. regression through `ExtendSqi`, `LangSqi`, and `AllSqi` is part of the same work package.

Preferred extension owner after activation:

```text
ExtendSqiVPS.gf
```

General Albanian verbal realization machinery remains owned by the appropriate core resource/syntax modules.

### `Comp` / `Imp` list family

The historical `Base/Cons/ConjComp` and `Base/Cons/ConjImp` work is no longer the active blocker. The v0.1.0 release gate passed and `ExtendSqi.gfo` is produced. Preserve the accepted implementation unless a concrete regression exposes a defect.

---

## 4. Mandatory pre-edit gate for `ExtendSqi.gf`

Run this gate **before any coordinator edit**.

1. Check the exact abstract signature.
2. Check the current `ExtendFunctor` path.
3. Check this override matrix.
4. Check the current full-build stderr for the live warning cluster.
5. Only then decide whether the function is:
   - inherited
   - local override
   - or boundary-declaration-only

### Hard stop rules
Do **not** edit `ExtendSqi.gf` if any of the following is true:

- the function is marked **inherit** here and no matrix update has been made
- the change would move subsystem logic into the coordinator
- the change would create local list-family logic
- the change is being justified only by a compile warning, without checking signature/functor/category evidence
- the change would accept a new `lock_*` warning as “good enough”

---

## 5. Operational drift fields

When a family is under active repair, maintain the following fields for the affected rows or in an adjacent working table.

- **Current code owner**
- **Allowed owner this cycle**
- **Inherited from `ExtendFunctor`?**
- **Current code state** = `aligned` / `drifted`
- **Required action** = `keep inherited` / `remove from subtraction` / `keep local` / `move to subsystem`
- **Evidence checked** = abstract / functor / Albanian lincat / model language / current stderr

These fields do not replace the stable matrix below; they are the required working overlay during live repair.

---

## 6. Override matrix by subsystem

Legend:
- **Owner** = module that must implement the function in this cycle
- **Mode** = `override` or `inherit`
- **Priority** = execution order for this cycle
- **Evidence required** = what must be checked before accepting the implementation

---

### 6.1 Scaffolding subsystem

**Owner modules**
- `GF/lib/src/albanian/ExtendSqiScaffolding.gf`
- `GF/lib/src/albanian/ExtendSqiHelpers.gf`

**Coordinator touchpoint**
- `GF/lib/src/albanian/ExtendSqi.gf`

**Priority**
1

| Function | Mode | Owner | Evidence required | Acceptance rule |
|---|---|---|---|---|
| `GenNP` | override | `ExtendSqiScaffolding.gf` | abstract signature + Albanian lincat shape | no flattening, compiles cleanly |
| `GenIP` | override | `ExtendSqiScaffolding.gf` | signature + current codedump | safe IQuant shape |
| `GenRP` | override | `ExtendSqiScaffolding.gf` | signature + CN/Num ownership | RP shape preserved |
| `GenModNP` | override | `ExtendSqiScaffolding.gf` | signature + Albanian modifier behavior | placeholder only if justified |
| `GenModIP` | override | `ExtendSqiScaffolding.gf` | signature + Albanian modifier behavior | placeholder only if justified |
| `PiedPipingQuestSlash` | override | `ExtendSqiScaffolding.gf` | abstract + current lincats | QS shape preserved |
| `PiedPipingRelSlash` | override | `ExtendSqiScaffolding.gf` | abstract + current lincats | RS shape preserved |
| `StrandQuestSlash` | override | `ExtendSqiScaffolding.gf` | abstract + current lincats | QS shape preserved |
| `StrandRelSlash` | override | `ExtendSqiScaffolding.gf` | abstract + current lincats | RS shape preserved |
| `EmptyRelSlash` | override | `ExtendSqiScaffolding.gf` | abstract + current lincats | RS shape preserved |
| `ProDrop` | override | `ExtendSqiScaffolding.gf` | pronoun record shape | no clitic field loss |
| `AdAdV` | override | `ExtendSqiScaffolding.gf` | AdA/Adv/AdV shapes | no category flattening |
| `PositAdVAdj` | override | `ExtendSqiScaffolding.gf` | `A` category evidence | no wrong resource type leakage |
| `IAdvAdv` | override | `ExtendSqiScaffolding.gf` | IAdv/Adv shapes | safe coercion only |
| `CompS` | override | `ExtendSqiScaffolding.gf` | `Comp` record shape | only valid `Comp` fields |
| `CompQS` | override | `ExtendSqiScaffolding.gf` | `Comp` record shape | only valid `Comp` fields |
| `CompVP` | override | `ExtendSqiScaffolding.gf` | abstract signature + `CommonX` contract | no `TenseSqi` leakage |
| `UttAccIP` | override | `ExtendSqiScaffolding.gf` | `Utt` shape | no lock-field damage |
| `UttDatIP` | override | `ExtendSqiScaffolding.gf` | `Utt` shape | no lock-field damage |
| `UttAccNP` | override | `ExtendSqiScaffolding.gf` | NP case behavior | only valid case use |
| `UttDatNP` | override | `ExtendSqiScaffolding.gf` | NP case behavior | only valid case use |
| `UttAdV` | override | `ExtendSqiScaffolding.gf` | `Utt` shape | safe utterance coercion |
| `UttVPShort` | override | `ExtendSqiScaffolding.gf` | `Utt` shape | safe utterance coercion |
| `ComplBareVS` | override | `VerbSqi.gf` via `ComplVS` (wired by `ExtendSqi.gf`) | verbose PMCFG localization + exact `VS -> S -> VP` signature + Albanian core constructor + model-language corroboration | **PMCFG-confirmed 2026-09-18** (`+ ComplBareVS 1 (1,1)`); structural path accepted by GF 3.12; linguistic/golden validation remains pending |
| `SlashBareV2S` | **inherit** | `ExtendFunctor.gf` -> Albanian core `SlashV2S` | exact `V2S -> S -> VPSlash` signature + pinned functor alias + Albanian `VerbSqi.SlashV2S` | **PMCFG-confirmed in run `20260918_210629`** as `+ SlashBareV2S 1 (1,1)`; linguistic slash realization remains provisional |
| `ComplDirectVS` | override | `ExtendSqiScaffolding.gf` | verbose PMCFG localization + VS/VP/Utt shapes + Albanian core `UseV`/`AdvVP` composition | **PMCFG-confirmed 2026-09-18** (`+ ComplDirectVS 1 (1,1)`); `Utt.s` preservation accepted structurally; linguistic punctuation/quotation validation remains pending |
| `ComplDirectVQ` | override | `ExtendSqiScaffolding.gf` | verbose PMCFG localization + VQ/VP/Utt shapes + Albanian core `UseV`/`AdvVP` composition | **PMCFG-confirmed 2026-09-18** (`+ ComplDirectVQ 1 (1,1)`); `Utt.s` preservation accepted structurally; linguistic punctuation/quotation validation remains pending |
| `FrontComplDirectVS` | override | `ExtendSqiScaffolding.gf` | fix13r empty path + fix14 exact-typed path + fix15 exact helper composition; latest run `20260918_153932` | **PMCFG-confirmed structurally** (`+ FrontComplDirectVS 9 (1,1)`) with `PredVP np (sc_ComplDirectVS vs utt)`; no `VS -> VQ` cast/direct `lin Cl`/record update; **linguistic fronting/order/punctuation remains provisional** |
| `FrontComplDirectVQ` | override | `ExtendSqiScaffolding.gf` | Cl shape | **PMCFG-confirmed 2026-09-18** (`+ FrontComplDirectVQ 9 (1,1)`); current implementation is compiler-accepted, but canonical Cl-constructor/punctuation review remains separate |
| `PredIAdvVP` | override | `ExtendSqiScaffolding.gf` | QCl shape | no partial records |
| `ApposNP` | override | `ExtendSqiScaffolding.gf` | NP record shape | agreement preserved |
| `ComplGenVV` | override | `ExtendSqiScaffolding.gf` | verbose PMCFG localization + abstract signature + `CommonX` contract + Albanian core `ComplVV` | **PMCFG-confirmed 2026-09-18** (`+ ComplGenVV 4 (1,1)`); structural reuse of `ComplVV` accepted by GF 3.12; `Ant`/`Pol` remain a documented linguistic gap requiring separate design |
| `CompoundN` | override | `ExtendSqiScaffolding.gf` | N shape | no ad hoc flattening |
| `GerundCN` | override | `ExtendSqiScaffolding.gf` | CN helper ownership | uses helper, not ad hoc CN |
| `GerundNP` | override | `ExtendSqiScaffolding.gf` | NP helper ownership | uses helper, not ad hoc NP |
| `GerundAdv` | override | `ExtendSqiScaffolding.gf` | Adv shape | no wrong-case leakage |
| `UncontractedNeg` | override | `ExtendSqiScaffolding.gf` | abstract signature + polarity record shape | `CommonX`-side contract only |
| `TPastSimple` | override | `ExtendSqiScaffolding.gf` | abstract signature + tense record shape | `CommonX`-side contract only |
| `ComplSlashPartLast` | override | `ExtendSqiScaffolding.gf` | VPSlash/VP/NP shape | no partial records |
| `DetNPMasc` | override | `ExtendSqiScaffolding.gf` | Det/NP agreement | gender agreement preserved |
| `DetNPFem` | override | `ExtendSqiScaffolding.gf` | Det/NP agreement | gender agreement preserved |
| `UseComp_estar` | override | `ExtendSqiScaffolding.gf` | VP/Comp shape | no bogus copula logic |
| `UseComp_ser` | override | `ExtendSqiScaffolding.gf` | VP/Comp shape | no bogus copula logic |
| `SubjRelNP` | override | `ExtendSqiScaffolding.gf` | NP/RS shape | agreement preserved |
| `SubjunctRelCN` | override | `ExtendSqiScaffolding.gf` | CN/RS shape | category shape preserved |

**Required outcome**
This subsystem compiles with no contract-shape errors and no accidental `TenseSqi`/`CommonX` leakage.

---

### 6.2 Existential subsystem

**Owner modules**
- `GF/lib/src/albanian/ExtendSqiExistential.gf`

**Coordinator touchpoint**
- `GF/lib/src/albanian/ExtendSqi.gf`

**Priority**
5

| Function | Mode | Owner | Evidence required | Acceptance rule |
|---|---|---|---|---|
| `ExistS` | override | `ExtendSqiExistential.gf` | abstract signature + constructor path | constructor-based composition |
| `ExistNPQS` | override | `ExtendSqiExistential.gf` | abstract signature + constructor path | constructor-based composition |
| `ExistIPQS` | override | `ExtendSqiExistential.gf` | abstract signature + constructor path | constructor-based composition |
| `ExistCN` | override | `ExtendSqiExistential.gf` | abstract signature + CN behavior | no ad hoc flattening |
| `ExistMassCN` | override | `ExtendSqiExistential.gf` | abstract signature + CN behavior | no ad hoc flattening |
| `ExistPluralCN` | override | `ExtendSqiExistential.gf` | abstract signature + CN behavior | no ad hoc flattening |
| `ExistsNP` | override | `ExtendSqiExistential.gf` | abstract signature + constructor path | constructor-based composition |

---

### 6.3 AP/CN subsystem

**Owner modules**
- `GF/lib/src/albanian/ExtendSqiAPCN.gf`

**Audit spillover modules**
- `GF/lib/src/albanian/AdjectiveSqi.gf`
- `GF/lib/src/albanian/NounSqi.gf`

**Coordinator touchpoint**
- `GF/lib/src/albanian/ExtendSqi.gf`

**Priority**
4

| Function | Mode | Owner | Evidence required | Acceptance rule |
|---|---|---|---|---|
| `ICompAP` | override | `ExtendSqiAPCN.gf` | abstract signature + AP shape | AP shape preserved |
| `CompBareCN` | override | `ExtendSqiAPCN.gf` | abstract signature + CN shape | CN shape preserved |
| `CompIQuant` | override | `ExtendSqiAPCN.gf` | abstract signature + IQuant/Comp behavior | category shape preserved |
| `PredAPVP` | override | `ExtendSqiAPCN.gf` | AP/VP predicate behavior | no flattening |
| `AdjAsCN` | override | `ExtendSqiAPCN.gf` | AP→CN conversion evidence | only justified Albanian conversion |
| `AdjAsNP` | override | `ExtendSqiAPCN.gf` | AP→NP conversion evidence | only justified Albanian conversion |
| `CardCNCard` | override | `ExtendSqiAPCN.gf` | numeral/CN integration | no partial records |

---

### 6.4 Focus/preposition subsystem

**Owner modules**
- `GF/lib/src/albanian/ExtendSqiFocusPrep.gf`

**Audit spillover modules**
- `GF/lib/src/albanian/AdverbSqi.gf`

**Coordinator touchpoint**
- `GF/lib/src/albanian/ExtendSqi.gf`

**Priority**
7

| Function | Mode | Owner | Evidence required | Acceptance rule |
|---|---|---|---|---|
| `FocusObj` | override | `ExtendSqiFocusPrep.gf` | abstract signature + focus behavior | no string-only hacks |
| `FocusAdv` | override | `ExtendSqiFocusPrep.gf` | abstract signature + focus behavior | Adv shape preserved |
| `FocusAdV` | override | `ExtendSqiFocusPrep.gf` | abstract signature + focus behavior | AdV shape preserved |
| `FocusAP` | override | `ExtendSqiFocusPrep.gf` | abstract signature + focus behavior | AP shape preserved |
| `PrepCN` | override | `ExtendSqiFocusPrep.gf` | abstract signature + prep ownership | if shared, migrate logic toward `AdverbSqi` |

---

### 6.5 VP bridge subsystem

**Owner modules**
- `GF/lib/src/albanian/ExtendSqiVPBridge.gf`

**Coordinator touchpoint**
- `GF/lib/src/albanian/ExtendSqi.gf`

**Priority**
3

| Function | Mode | Owner | Evidence required | Acceptance rule |
|---|---|---|---|---|
| `PresPartAP` | override | `ExtendSqiVPBridge.gf` | participial/AP evidence | AP shape preserved |
| `EmbedPresPart` | override | `ExtendSqiVPBridge.gf` | participial embedding evidence | no ad hoc flattening |
| `EmbedSSlash` | override | `ExtendSqiVPBridge.gf` | exact `SSlash -> SC` signature + pinned `ExtendFunctor` `variants {}` + PMCFG failure + model-language comparison | **temporary compile probe only**; `ExtendSqi.gf` must compile with no new warnings, and linguistic finalization remains blocked until Albanian slash/free-relative realization is validated |
| `PastPartAP` | override | `ExtendSqiVPBridge.gf` | participial/AP evidence | AP shape preserved |
| `PastPartAgentAP` | override | `ExtendSqiVPBridge.gf` | participial/AP evidence | AP shape preserved |
| `PassVPSlash` | override | `ExtendSqiVPBridge.gf` | abstract signature + VPSlash shape | no bare record mismatch |
| `PassAgentVPSlash` | override | `ExtendSqiVPBridge.gf` | abstract signature + VPSlash shape | no bare record mismatch |
| `NominalizeVPSlashNP` | override | `ExtendSqiVPBridge.gf` | nominalization evidence | no ad hoc NP construction |
| `ProgrVPSlash` | override | `ExtendSqiVPBridge.gf` | progressive evidence | category shape preserved |
| `A2VPSlash` | override | `ExtendSqiVPBridge.gf` | abstract signature + A2 bridge | no bare record mismatch |
| `N2VPSlash` | override | `ExtendSqiVPBridge.gf` | abstract signature + N2 bridge | no bare record mismatch |
| `AdvIsNP` | override | `ExtendSqiVPBridge.gf` | abstract signature + Adv/NP bridge | no ad hoc flattening |
| `AdvIsNPAP` | override | `ExtendSqiVPBridge.gf` | abstract signature + Adv/AP/NP bridge | no ad hoc flattening |
| `PurposeVP` | override | `ExtendSqiVPBridge.gf` | abstract signature + Adv bridge | no bare record mismatch |
| `WithoutVP` | override | `ExtendSqiVPBridge.gf` | abstract signature + Adv bridge | no bare record mismatch |
| `ByVP` | override | `ExtendSqiVPBridge.gf` | abstract signature + Adv bridge | no bare record mismatch |
| `InOrderToVP` | override | `ExtendSqiVPBridge.gf` | abstract signature + Adv bridge | no bare record mismatch |
| `CompoundAP` | override | `ExtendSqiVPBridge.gf` | abstract signature + AP bridge | AP shape preserved |

---

### 6.6 RNP subsystem

**Owner modules**
- `GF/lib/src/albanian/ExtendSqiRNP.gf`

**Audit spillover modules**
- `GF/lib/src/albanian/NounSqi.gf`

**Coordinator touchpoint**
- `GF/lib/src/albanian/ExtendSqi.gf`

**Priority**
6

| Function | Mode | Owner | Evidence required | Acceptance rule |
|---|---|---|---|---|
| `ReflRNP` | override | `ExtendSqiRNP.gf` | abstract signature + NP/VPSlash shapes | no ad hoc flattening |
| `ReflPron` | override | `ExtendSqiRNP.gf` | pronoun evidence | no partial records |
| `ReflPoss` | override | `ExtendSqiRNP.gf` | possessive/reflexive evidence | agreement preserved |
| `PredetRNP` | override | `ExtendSqiRNP.gf` | predeterminer evidence | NP shape preserved |
| `AdvRNP` | override | `ExtendSqiRNP.gf` | NP/prep attachment evidence | category shape preserved |
| `AdvRVP` | override | `ExtendSqiRNP.gf` | VP/prep attachment evidence | category shape preserved |
| `AdvRAP` | override | `ExtendSqiRNP.gf` | AP/prep attachment evidence | category shape preserved |
| `ReflA2RNP` | override | `ExtendSqiRNP.gf` | AP/reflexive evidence | category shape preserved |
| `PossPronRNP` | override | `ExtendSqiRNP.gf` | exact `Pron -> Num -> CN -> RNP -> NP` signature + Albanian `PossPron`/`DetQuant`/`PossNP`/`DetCN` constructor chain + pinned Bulgarian/German/Swedish corroboration | **PMCFG-confirmed in run `20260918_205422`** as `+ PossPronRNP 324 (28,28)`; linguistic possessive/RNP validation remains provisional |
| `ConjRNP` | override | `ExtendSqiRNP.gf` | NP coordination evidence | coherent list behavior |
| `Base_rr_RNP` | override | `ExtendSqiRNP.gf` | list behavior evidence | coherent list behavior |
| `Base_nr_RNP` | override | `ExtendSqiRNP.gf` | list behavior evidence | coherent list behavior |
| `Base_rn_RNP` | override | `ExtendSqiRNP.gf` | list behavior evidence | coherent list behavior |
| `Cons_rr_RNP` | override | `ExtendSqiRNP.gf` | list behavior evidence | coherent list behavior |
| `Cons_nr_RNP` | override | `ExtendSqiRNP.gf` | list behavior evidence | coherent list behavior |

---

### 6.7 Lexical tail subsystem

**Owner modules**
- `GF/lib/src/albanian/ExtendSqiLexicon.gf`

**Coordinator touchpoint**
- `GF/lib/src/albanian/ExtendSqi.gf`

**Priority**
8

| Function | Mode | Owner | Evidence required | Acceptance rule |
|---|---|---|---|---|
| `ReflPossPron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | syntax clean, quant shape correct |
| `iFem_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `youFem_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `weFem_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `youPlFem_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `theyFem_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `theyNeutr_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `youPolFem_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `youPolPl_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `youPolPlFem_Pron` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | full pronoun record preserved |
| `UseDAP` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | NP shape preserved |
| `UseDAPMasc` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | NP shape preserved |
| `UseDAPFem` | override | `ExtendSqiLexicon.gf` | lexical ownership evidence | NP shape preserved |

---

## 7. Acceptance checks per subsystem

Every subsystem pass is accepted only if all of the following are true:

1. The companion module compiles with no hard errors.
2. `ExtendSqi.gf` still remains a thin coordinator.
3. No VPS/VPI/VPS2/VPI2 implementation logic has been placed directly in the coordinator.
4. No category has been flattened to `Str` when a later consumer still requires lost grammatical information.
5. No new unexplained lock/shape warning is introduced.
6. No override is justified only by convenience; every override must have Albanian or structural evidence.
7. The family remains coherent as a family.
8. Any current mismatch between this matrix and `ExtendSqi.gf` ownership has been explicitly resolved.
9. Any core reopening is justified by a Wordbench behavior scenario and first-boundary analysis.

---

## 8. Coordinator drift checks

Run these checks on every `ExtendSqi.gf` edit.

### 8.1 Subtraction-list check
For every name in the subtraction list:
- it must appear in this matrix as `override`
- its owner must be one of the allowed companion modules
- it must not appear in the inherited-family section above

### 8.2 Wiring check
For every `lin` renaming in `ExtendSqi.gf`:
- it must target the owner declared in this matrix
- it must not wire a function that is marked inherited
- it must not keep stale local ownership after a subsystem decision changed

### 8.3 Boundary-lincat check
Any local `lincat` declaration in `ExtendSqi.gf` must be one of:
- a documented boundary declaration for an inherited shallow family
- a documented local family boundary required by current Albanian ownership

If neither is true, the `lincat` is drift.

### 8.4 High-risk mismatch rule
If a function is:
- marked inherited here
- but still subtracted or locally wired in code

then **fix that mismatch before accepting any other coordinator-side patch**.

---

## 9. Doc-sync rule

Whenever any of the following changes:
- subtraction list
- subsystem ownership
- inherited/local status
- boundary `lincat` policy
- family execution order

update this matrix in the **same change**.

Do not allow:
- code-first coordinator changes
- later “we’ll fix the docs” follow-up
- untracked ownership exceptions

---

## 10. Completion execution order

The active order is:

1. Architecture Gate scenarios and producer/consumer map;
2. minimal verbal realization kernel;
3. finite VPS vertical slice;
4. VPS question/relative integration;
5. VPI + representative `VV` embedding/control;
6. structured slash/clitic preservation;
7. VPS2/VPI2 completion;
8. `ExtendSqi` → `LangSqi` → `AllSqi` regression;
9. reviewed Wordbench goldens;
10. remaining Structural/Construction/Irreg completion.

For the live cursor and active gates, use `CURRENT_REPAIR_STATE.md`. For the completed-system contract, use `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`.

---

## 11. What is not allowed in the Completion phase

- Reintroducing `MkVPS` / `BaseVPS` or any VPS-family implementation directly into `ExtendSqi.gf`
- Creating `ExtendSqiVPS.gf` before the Architecture Gate defines the family contract
- Implementing only isolated VPS/VPI functions without coherent family ownership
- Fixing a family by scattering ad hoc helpers into unrelated modules
- Accepting compile success if it depends on category-shape drift
- Leaving warnings unexplained in high-risk families
- Changing coordinator ownership without updating this matrix
- Treating a boundary `lincat` declaration as proof of local family ownership

---

## 12. Final target state

At the end of the Completion phase:

- `ExtendSqi.gf` is a stable thin coordinator.
- Every local override belongs to a declared companion module.
- The VPS/VPI/VPS2/VPI2 family is either coherently implemented locally or explicitly documented as an unresolved gap; no placeholder is presented as finished coverage.
- Any `ExtendSqiVPS.gf` module is backed by the same core verbal realization architecture used by ordinary Albanian syntax rather than a parallel string pipeline.
- All companion modules compile cleanly.
- Required Wordbench behavior scenarios pass and reviewed goldens exist for release-required cases.
- The matrix and the coordinator agree on ownership, inheritance, and family boundaries.

---

## 13. Live state and repair chronology policy

This matrix is normative and must stay compact. Per-run experiments and rejected hypotheses are **not** maintained here.

- Current compiler state and next blocker: `CURRENT_REPAIR_STATE.md`
- Chronological repair evidence: `ALBANIAN_DECISION_LOG.md`
- Current symbol maturity: `ALBANIAN_SYMBOL_STATUS_LEDGER.md`

The fix11–fix15 sequence is preserved in `ALB-DEC-033` through `ALB-DEC-038`. Only the stable conclusions are retained in the matrix rows above.

### Stable conclusions retained from the stabilization sequence

- VPS/VPI/VPS2/VPI2 **coordinator-side** local ownership was drift and remains prohibited.
- That historical result does not prohibit a later coherent `ExtendSqiVPS.gf` subsystem after the Completion Architecture Gate.
- `FrontComplDirectVS`, `PossPronRNP`, and `SlashBareV2S` are historical structurally confirmed repairs; their linguistic behavior still depends on scenario/golden validation where not yet covered.
- The v0.1.0 release gate supersedes the earlier live fix18 cursor: `ExtendSqi.gfo` is now produced and there is no active PMCFG blocker.
