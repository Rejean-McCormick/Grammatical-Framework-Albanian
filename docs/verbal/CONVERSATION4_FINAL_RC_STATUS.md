# Conversation 4 — Final RC status

**Scope:** Albanian verbal TAM + auxiliaries + voice/non-active

## Closed in code

- common `TPast + ASimul` mapped to imperfect;
- common anteriority mapped to perfect/pluperfect/future-perfect/conditional-perfect;
- active compound auxiliary `kam`, non-active compound auxiliary `jam`;
- explicit lexical `MorphVoice` on all 135 `MorphoSqi` verb records;
- semantic `VoiceUse` separated from lexical/morphological voice;
- future/conditional `do + të` realization centralized;
- `po` represented as typed `Progressivity`, not a stored string prefix;
- impossible unsupported progressive future/conditional/anterior combinations return `nonExist`;
- subjunctive, negative subjunctive, imperative, purpose and gerund ordering centralized;
- explicit Albanian aorist and aorist-anterior outside common RGL `TPast`;
- optative/admirative families exposed in `ExtraSqi`;
- analytic `PassV2` and weak-clitic `ReflVP` kept distinct from lexical non-active morphology;
- existential TAM routed through the same central realization boundary;
- 29/29 common `Verb` operations retained;
- protected compile census unchanged at 58 targets;
- protected required scenario registry unchanged at 52;
- `alb-verb-advanced` registered as one **optional** Wordbench scenario with 98 cases.

## Static acceptance completed

- Conversation 4 structural validator: PASS;
- advanced identities V001..V098 aligned across TSV / abstract / concrete / `.gfs`: PASS;
- Dict + MorphoDict unified validator: PASS;
- MorphoDict validator: PASS;
- Dict validator: PASS;
- `gf_morphosqi_lint.py`: 0 findings;
- Python validator compileall: PASS;
- full delivery patch reproduces the final source tree byte-for-byte from the supplied baseline: PASS.

## External acceptance still required

This environment has no GF executable. Final certification therefore still requires:

- GF 3.12;
- Wordbench 1.3.4 strict diagnostic;
- 58/58 compile acceptance;
- 52/52 required baseline scenarios;
- optional `alb-verb-advanced` complete execution;
- review of the 98-case matrix, especially rows marked `linguistic-review-required`.

Until that evidence exists, the correct status is **implementation-complete release candidate**, not compiler/linguistic-certified release.
