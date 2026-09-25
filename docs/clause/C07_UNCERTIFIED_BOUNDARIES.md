# C07 uncertified boundaries after final implementation candidate

This file is intentionally short and blocking. A future patch must not silently convert any item below into a certified behavior.

## U-C07-001 — Empty prepositional relative

`Extend.EmptyRelSlash` has no RP argument. Standard Albanian `cili/e` relatives require case plus head gender/number; the current shared `Agr` uses `GenNum`, which loses plural gender. The function remains a compatibility realization and is explicitly not canonical linguistic evidence.

**Closure condition:** a cross-workstream representation decision that can carry the necessary head agreement, or new Albanian evidence for a different fully compositional strategy.

## U-C07-002 — Embedded questions

`EmbedQS`, `ComplVQ`, `SlashV2Q`, and related extension paths preserve existing QS surface. No supplied source establishes the complete direct-vs-indirect polar/wh marking paradigm.

**Closure condition:** explicit Standard Albanian evidence and contrastive tests.

## U-C07-003 — `se/që` generation

Both are supported as indicative subordinators by the supplied grammar. This candidate keeps historical canonical `që` and does not add `variants` or uncontrolled ambiguity.

**Closure condition:** register/lexical selection evidence plus parse/generation policy.

## U-C07-004 — Focus, topicalization, scrambling

Existing `ExtraSqi.Foc*`, `FrontExtPredVP`, and `InvFrontExtPredVP` compile-level surfaces are not promoted to linguistically certified Albanian order rules here.

**Closure condition:** corpus/grammar evidence for each productive construction and contrastive scenarios.

## U-C07-005 — Pro-drop

`ExtraSqi.ProDrop` exists, but a general generation policy is not certified by this patch.

## U-C07-006 — Adverb ordering classes

The current post/preverbal adverb APIs are preserved. No new `ClauseOrder` dimension is introduced.

## U-C07-007 — Sentential relatives

`SentenceSqi.RelS` keeps its historical fallback agreement. The supplied evidence does not close the correct agreement strategy for an `RS` whose antecedent is an entire proposition.

## U-C07-008 — Positive imperative clitic variants / purpose clauses

These remain owned by their dedicated verbal/extension boundaries and need additional evidence before canonical generation changes.


## U-C07-009 — Controller-sensitive generic `EmbedVP`

The inherited `SC` representation is flat, while Standard/Tosk finite subjunctives are person-inflected. `EmbedVP` therefore cannot receive a controller agreement value through the shared API and retains an explicit third-singular fallback.

**Closure condition:** a cross-workstream representation design that preserves controller agreement to the final subjunctive consumer, or Albanian evidence and API policy for a different generic nonfinite realization. This must not be repaired by guessing the controller or adding a new placeholder.

## U-C07-010 — Governed invariant `që` versus declined relative strategy

`RelSlash` correctly preserves the preposition and governed case supplied by `ClSlash`, but `IdRP` remains invariant `që`. The supplied references establish declined `cili/e` as the explicit case/agreement strategy and invariant `që` as the common ordinary relative marker; they do not establish `Prep + që` as the canonical governed-relative output.

**Closure condition:** enough head agreement in the representation to realize the full declined paradigm (including plural gender), plus contrastive singular/plural/gender/preposition tests.
