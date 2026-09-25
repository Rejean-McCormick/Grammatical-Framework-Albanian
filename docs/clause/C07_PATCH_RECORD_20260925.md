# C07 patch record — clause finalization candidate

## Task header

```yaml
language: Albanian (Sqi)
route_primary: R05_SYNTAX_IMPLEMENTATION
routes_secondary: [R07_EXTEND_EXTRA_AND_MISSING, R10_REPAIR_LINGUISTIC_OUTPUT, R11_TESTING]
target_modules:
  - ClauseSqiRes.gf
  - SentenceSqi.gf
  - QuestionSqi.gf
  - RelativeSqi.gf
cross_workstream_consumers:
  - VerbSqi.gf
  - AdjectiveSqi.gf
  - ExtendSqiScaffolding.gf
  - ExtendSqiVPS.gf
  - ConstructionSqi.gf
  - IdiomSqi.gf
gf_version: "3.12"
rgl_archive_sha256: e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d
source_archive_sha256: 961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829
source_lock: locked_to_supplied_archives
language_state: S07_CORE_IMPLEMENTATION
subsystem: clause
representation_migration: false
new_placeholders: 0
```

## Causal problems repaired

1. Ordinary clause framing was repeated in several public/extension modules instead of being delegated to one kernel.
2. `PredSCVP` used the generic masculine fallback where supplied Albanian evidence supports feminine singular for the attested clausal-subject family.
3. `SentAP` prepended `që` even though `SC` already owned embedding, allowing duplicate complementizers.
4. English-named stranding functions generated postposed Albanian prepositions despite no supplied evidence licensing canonical stranding.
5. Complementizer and polar-question markers were duplicated as raw string assembly in multiple modules.

## Patch class

- architecture consolidation: behavior-preserving for ordinary realizations;
- linguistic-output repair: clausal-subject agreement;
- linguistic-output repair: `SentAP` complementizer ownership;
- linguistic-output repair: explicit-IP/RP stranding neutralization;
- evidence-preserving deferral: embedded questions, focus/scrambling, `se/që` variation, `EmptyRelSlash` representation debt.

## Patterns selected

- EP019 single clause assembly point — selected, primary;
- EP021 polarity propagation — preserved via existing typed polarity/TAM realizer;
- EP023 order as a dimension — **not selected**: supplied evidence does not justify a new productive order parameter yet;
- EP005 segmented clause slots — **not selected**: no representation-level discontinuity requirement was proven for this patch.

## Regression boundary

The patch is additive/minimal at the representation level:

- `CatSqi.gf`: byte-identical to input baseline;
- `ResSqi.gf`: byte-identical to input baseline;
- 52 required scenarios unchanged;
- optional C07 scenario added separately;
- Dict/MorphoDict untouched.

## Evidence-open items deliberately not “solved”

- embedded polar and embedded wh clause marking;
- canonical `se` vs `që` generation policy;
- productive focus/topicalization/scrambling inventory;
- generalized pro-drop generation policy;
- adverb-class ordering;
- sentential/nonrestrictive relative agreement;
- positive-imperative clitic canonical variant;
- purpose-clause canonicalization;
- fully standard prepositional `cili/e` relatives under the current plural-gender-losing agreement representation;
- controller-sensitive person agreement for generic `EmbedVP : VP -> SC` under the inherited flat `SC` representation.


## Validation evidence attached

- `validation/clause/STATIC_VALIDATION.txt` — C07 static contract PASS.
- `validation/clause/DICT_VALIDATION.txt` — Dict validator PASS.
- `validation/clause/MORPHODICT_VALIDATION.txt` — MorphoDict 592-entry validator PASS.
- `validation/clause/DICT_MORPH_STATIC_VALIDATION.txt` — combined validator PASS.
- `validation/clause/MORPHOSQI_LINT.txt` — 0 findings.
- `validation/clause/WORDBENCH_SCENARIO_CONTRACT_DIRECT.txt` — all 53 registered scenario contracts PASS (input locks + section markers).
- `validation/clause/WORDBENCH_BASELINE_PROJECT_CHECK.txt` and `WORDBENCH_CANDIDATE_PROJECT_CHECK.txt` — identical 18-error pre-existing project-documentation limitation apart from root paths.
- `validation/clause/DIFF_CHECK.txt` — no whitespace-error findings in the baseline→candidate patch.

No GF executable is present in this environment, so this record does not assert fresh GF compile results.
