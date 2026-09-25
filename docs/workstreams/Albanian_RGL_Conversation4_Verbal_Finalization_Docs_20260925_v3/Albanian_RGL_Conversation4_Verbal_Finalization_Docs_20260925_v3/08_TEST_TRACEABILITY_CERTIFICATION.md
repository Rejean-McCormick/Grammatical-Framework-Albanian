# Test, traceability and certification protocol

**Status:** canonical owner of evidence→implementation→test linkage.

## 1. Four independent gates

1. **structural/static** — contracts, no orphan fields, no forbidden construction patterns;
2. **compiler** — focused GF build then full 58/58;
3. **behavioral/regression** — original 52/52 plus new verbal scenarios/golds;
4. **linguistic** — outputs reviewed against Albanian evidence.

A compiler PASS cannot substitute for gate 4.

## 2. Test namespaces

```text
VT-RGL-001..      common Tense × Anteriority × Polarity strategies
VT-MORPH-...      simple/irregular/non-active morphology
VT-FUT-...        future and future perfect
VT-COND-...       conditional and past conditional
VT-PERF-...       active compound auxiliaries
VT-NA-...         non-active simple/aorist/compound
VT-PASS-...       PassV2 semantics
VT-REFL-...       ReflVP/clitic preservation
VT-PROG-...       licensed progressive strategies
VT-NEG-...        negation/mood-frame ordering
VT-IMP-...        positive/negative imperative
VT-EMB-...        VV/V2V embedded mood selection
VT-NF-...         participial/gerundive/purpose constructions
VT-ANTI-...       impossible-combination rejection
```

## 3. Representative morphology set

Focused tests must include regular and irregular verbs spanning:

- at least one major productive conjugation family;
- `jam`, `kam`, `dua` and other irregulars already modeled;
- a transitive `V2` usable for passive/reflexive tests;
- a `VV`/`V2V` governor for embedded-strategy tests;
- verbs whose non-active behavior exercises different morphological classes.

Do not certify a strategy on one lexical item only when the rule is claimed productive.

## 4. Mandatory negative tests

At minimum assert that the architecture does not generate or internally build:

- unlicensed `do të po ...` mechanical chains;
- duplicate `të` from independent marker/contraction assembly;
- duplicate semantic-reflexive/non-active `u`;
- `nuk` as generic negative imperative;
- two finite heads in one finite strategy;
- active `kam` in a certified compound non-active strategy;
- a participle without its required frame;
- synthetic non-active forms guessed from active strings by syntax.

## 5. Trace record

A behavior is eligible for `CERTIFIED` only with:

```yaml
behavior_id: ...
strategy_id: VR-...|VX-...
rgl_operation_or_extension: ...
albanian_evidence_ids: [VE-...]
decision_ids: [VDEC-...]
implementation_symbols: [...]
test_ids: [VT-...]
expected_surface: ...
compiler_run: ...
wordbench_run: ...
gold_status: reviewed|not_required
review_note: ...
```

## 6. Validation cadence per slice

1. static validators/lints;
2. compile the changed lowest-level producer;
3. compile its direct consumer(s);
4. run focused `VT-*` tests;
5. run 58/58 census;
6. run original 52/52 scenarios;
7. run new verbal scenarios;
8. compare existing golds;
9. only then promote reviewed new golds.

## 7. Certification labels

- `STRUCTURAL_ONLY` — representation/compile evidence, no linguistic claim.
- `BEHAVIOR_OBSERVED` — output captured but not linguistically reviewed.
- `LINGUISTICALLY_REVIEWED` — reviewer/evidence supports the specific behavior.
- `CERTIFIED` — structural + compiler + regression + linguistic gates satisfied for the declared behavior/scope.
- `OPEN` — insufficient evidence; no release claim.

## 8. Gold policy

A gold file is evidence only after review. Never update a gold to match a new implementation merely because the output changed. The change must link to `VE-*`, `VDEC/VQ`, strategy and tests.
