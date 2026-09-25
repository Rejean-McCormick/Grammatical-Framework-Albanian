# Decisions and open questions

**Status:** canonical owner of design decisions and unresolved questions. Other documents may reference these IDs but must not redefine them.

## Accepted decisions

`VDEC-001` **Common RGL `Tense` remains common.** Albanian-specific tense/mood/aspect distinctions are exposed through internal/extension APIs.

`VDEC-002` **One central verbal realizer.** Finite ordering is not duplicated across clause modules.

`VDEC-003` **Morphological voice and semantic voice use are separate.** `MorphVoice` and `VoiceUse` (or equivalent distinctions) survive until realization.

`VDEC-004` **Default Standard-Albanian perfect auxiliary is voice-conditioned.** Active → `kam`, non-active → `jam`, unless future Albanian evidence establishes lexical exceptions.

`VDEC-005` **Progressive is typed/strategy-selected, not a free `po` prefix.**

`VDEC-006` **DRAFT-MAX is harvested by idea, never merged as a block.**

`VDEC-007` **Current internal `Past` is not final semantics.** Simple past morphology and compound perfect construction must be named/owned separately.

`VDEC-008` **No heuristic synthesis of non-active present/imperfect from active strings.** Productive derivation belongs to validated morphology constructors.

## Open questions

`VQ-001` **Common `TPast + ASimul` default.** The current source maps it to aorist; upstream RGL glosses common `TPast` as past/“imperfect”; Albanian has both aorist and imperfect. Resolve by RGL semantics + Albanian usage/test policy, not by inertia.

`VQ-002` **Common `TPast + AAnter` default.** Choose the neutral common mapping among documented past-anterior series (`kisha + participle`, `pata + participle`); expose the other explicitly if retained.

`VQ-003` **Complete progressive compatibility.** Close only source-attested cells; no mechanical `do të po` synthesis.

`VQ-004` **Generic `PassV2` mapping.** Determine when common passive semantics should use synthetic non-active versus analytic/passive strategies across TAM.

`VQ-005` **Reciprocal realization.** Define semantics, morphology/clitic interaction and tests.

`VQ-006` **Productive non-active API breadth.** Decide which morphological classes can construct non-active paradigms productively and which require irregular/principal-form input.

`VQ-007` **Particle/clitic ordering.** Negative future/conditional, progressive, non-active aorist, imperative and combined weak-pronoun clusters require focused source/test closure.

`VQ-008` **Marked mood public scope.** Decide final exposure of optative/admirative through `ExtraSqi`/other Albanian extension API.

`VQ-009` **Tosk non-finite public API.** Decide exposure of `për të + participle`, `duke + participle` and related constructions without pretending Tosk has the Geg infinitive.

## Closure record

A `VQ-*` closes only with:

```yaml
question_id: VQ-...
decision: ...
albanian_evidence_ids: [...]
rgl_contract: ...
implementation_symbols: [...]
positive_test_ids: [...]
negative_test_ids: [...]
run_evidence: ...
gold_review: ...
```

Changing an accepted `VDEC-*` requires the same record plus an explicit supersession note.
