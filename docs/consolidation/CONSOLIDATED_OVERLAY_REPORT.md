# Albanian RGL — consolidated MAX overlay report

**Date:** 2026-09-25  
**Base snapshot:** `Code_snapshot_Grammatical_Framework-Albanian(20260925-153041).zip`  
**Base SHA-256:** `34e1cdddec016f5fdaee1722509ba7cabf4745a50a07ba3ee03e03502efc678f`  
**Final C10 working-tree source lock:** `2b077e63b4ddba96ba144551a0793a5bd664b760d9040ec080a5acbfb4848174`  
**Goal:** one conservative, testable consolidation of C1/C2/C4/C5/C6/C7/C8/C9/C10.

## What this overlay is

This is a **consolidation candidate**, not a claim that every remaining bug is resolved. It prioritizes retaining useful code and reconciling shared contracts. Conflicting large implementations that cannot safely coexist as active code without a GF run are preserved under `development/consolidation_variants/`.

## Active integrated capabilities

- 5 grammatical cases + 4 noun morph cases with Gen/Dat syncretism boundary.
- Number-sensitive noun gender and grammatical CN carrier.
- Typed adjective morphology / nyje service.
- Strict C1 smart paradigm rungs (`reg2/3N`, `reg2/3A`, `reg2/3/4V`) and full-form escape hatches.
- Exact/legacy irregular separation.
- Typed C5 clitic cluster and government.
- C4 TAM/voice/progressive metadata plus aorist/optative/admirative/gerund/purpose realizers.
- C8 `VS/V2S` complementizer payload and slash gap payload.
- C7/C8 clause/question/relative capabilities reconciled with C5 realization.
- C9 Structural/Extend/Extra/public API additions.
- C2 MorphoDict resources/tooling.
- C10 certification tooling/campaign material, explicitly marked for recertification after consolidation.

## Scenario policy

- Required historical scenarios: **52**, unchanged.
- Optional scenario registry: **91** names, all resolvable.
- Physical `.gfs` under validation include consolidated workstream/campaign artifacts and are intentionally more numerous than 52.

## Static validation

- Neutral consolidation validator: **54/54 PASS**.
- MorphoSqi heuristic lint: **0 findings**.
- Python compileall for `tools/` + `validation/`: PASS.
- GF 3.12 is not installed in this environment, so no compilation/Wordbench success is claimed.

## Certification status

C10 `refresh` intentionally remains non-green after merge because its isolated campaign manifests/source locks and its generated 79-scenario expectation no longer match the 91-scenario consolidated registry. The refreshed dashboard reports **`pre-R0 evidence-backed` / `NOT_ESTABLISHED`**. This is treated as a recertification requirement, not as a reason to discard useful merged code.

## Next action

Apply this overlay to the exact base snapshot, run GF 3.12 / Wordbench, and return diagnostics. The next repair cycle should be driven by actual compiler errors and scenario diffs, not by trying to make isolated pre-merge static validators mutually compatible.
