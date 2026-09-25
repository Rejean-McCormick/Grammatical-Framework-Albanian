# C07 final evidence — maximum locally verifiable state

**Date:** 2026-09-25  
**Workstream:** C07 — clause syntax  
**GF target:** 3.12  
**Wordbench:** 1.3.4

## Final status

The C07 implementation is complete to the maximum extent justified by the supplied Albanian sources and the current shared representations. It introduces no `CatSqi` or `ResSqi` migration and no new compile-safe placeholder.

## Wordbench evidence obtained in this environment

A full supplied RGL layout was reconstructed from `gf-rgl-master.zip`, then the C07 Albanian candidate was injected into `src/albanian`, the five Sqi API facades, and `src/morphodict`.

Wordbench 1.3.4 successfully resolved that language context and produced the following exact static census:

- language modules: **51**;
- API facades: **5/5** (`CombinatorsSqi`, `ConstructorsSqi`, `SymbolicSqi`, `SyntaxSqi`, `TrySqi`);
- MorphoDict modules: **2/2** (`MorphoDictSqi`, `MorphoDictSqiAbs`);
- complete source census: **58**;
- static findings: **0**;
- source-lock file count: **58**;
- source-lock aggregate SHA-256: `55906c0f63c919e307730cc642d432d86392b120a414d2080937bd42dc8550c1`;
- Compendium evidence level: **T0 PASS / S01 SOURCE_LOCKED**.

The raw machine evidence is stored under `validation/clause/wordbench_static_58/`.

## Important interpretation boundary

The Wordbench run was deliberately **scan-only** because this execution environment has no GF executable. Consequently `global_scan.json` marks all 58 compile targets as `SKIPPED`, and `compendium_matrix.json` reports T8 aggregate compilation as failed/not-passing. That is the expected representation of an unexecuted compiler gate; it is **not** evidence that any of the 58 GF sources fail to compile.

Therefore this delivery does not claim fresh GF 3.12 compiler certification.

## Other executed validation

- C07 static validator: PASS;
- shared Sentence/Question/Relative API coverage: **41/41**;
- required scenario registry preserved: **52**;
- optional `alb-clause-final`: **18 SHA-locked CASEs**;
- Wordbench direct scenario contracts: **53/53 scripts PASS**;
- Dict static validation: PASS;
- MorphoDict static validation: PASS;
- combined Dict + MorphoDict static validation: PASS;
- MorphoSqi lint: **0 findings**;
- Python validation/tool compileall: PASS.

## Why no further C07 code is added here

The remaining issues are not safe local string fixes. They are deliberately stopped at their ownership boundary:

1. Fully declined governed `cili/e` relatives cannot preserve plural head gender with the current `GenNum = GSg Gender | GPl` representation. Fixing this properly is a cross-workstream nominal/relative representation migration.
2. Generic controller-sensitive `EmbedVP` needs controller/agreement information that the current generic SC boundary does not carry.
3. Embedded question marking is not sufficiently established by the supplied linguistic references to justify inventing an Albanian policy.
4. The supplied references establish `se` and `që` as indicative complementizers but do not provide a sufficient generation-selection rule to force one universally.
5. Focus, topicalization, scrambling, generalized pro-drop, and fine adverb order need a larger evidence matrix before they can be exposed as canonical generation dimensions.

Adding code for these merely to make the workstream appear closed would violate the project anti-drift rules.

## External merge/certification gate

Run on the exact source-lock above with GF 3.12:

1. strict compile census: **58/58**;
2. required scenarios: **52/52**;
3. optional C07 scenario: **18/18**;
4. existing gold comparison: **zero unintended regression**;
5. human linguistic review of any newly proposed gold outputs.

Until those executable gates are stored, the correct status is **final C07 implementation candidate, T0 source-locked and statically clean; compiler/behavioral certification pending**.
