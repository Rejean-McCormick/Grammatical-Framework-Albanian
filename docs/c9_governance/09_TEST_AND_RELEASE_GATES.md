# Test strategy and release gates — Conversation 9

The executable coverage register is `18_TEST_COVERAGE_REGISTER.md`. This file defines promotion gates.

## Gate 0 — exact source integrity

Before every patch record:

- Albanian source-lock;
- active RGL revision/search path;
- GF 3.12;
- relevant matrix row IDs;
- relevant decision/evidence/test IDs.

Version-sensitive changes cannot proceed on a guessed RGL identity.

## Gate 1 — focused compile

Compile edited modules and first-order public consumers. Rich-category changes require producer/consumer compilation, not just the edited file.

## Gate 2 — focused semantic scenarios

Each changed behavior must have a test that names the contrast being exercised. Tests must distinguish where relevant:

- grammatical vs ungrammatical/unsupported strategy;
- case/government alternatives;
- singular/plural/person/gender/definiteness contrasts;
- polarity/mood/TAM interactions;
- clitic vs full NP behavior;
- parse vs linearization behavior;
- direct vs inherited/default implementation paths.

A smoke test proves reachability, not linguistic correctness.

## Gate 3 — public API compatibility

Run facade-only grammars and the compatibility checks in `20_API_COMPATIBILITY_CONTRACT.md`. Try/Combinators changes require export/collision checks.

## Gate 4 — full Wordbench integration

Regression floor:

- 58/58 compile unless census intentionally grows;
- 52/52 existing required scenarios;
- zero structural lock warnings;
- no accepted-gold regression without evidence-backed update;
- new scenarios additive and source/SHA locked per project policy.

The current 52 scenarios remain baseline regression assets. They are not automatically counted as C9 semantic certification until explicitly mapped in `18_TEST_COVERAGE_REGISTER.md`.

## Gate 5 — linguistic review

For output-sensitive changes:

1. state expected contrasts before execution;
2. inspect Albanian evidence;
3. review generated output and, where relevant, parses;
4. classify legitimate variants rather than forcing one form;
5. record evidence IDs;
6. promote stable outcomes to gold.

## Gate 6 — parity closure

C9 is release-ready only when:

- no unexplained common-contract `missing`, `partial`, `needs_review`, `version_blocked` or `evidence_blocked` rows remain in release scope;
- retained inherited defaults are `equivalent`/`neutralized_equivalent`;
- N/A-like Albanian neutralizations still satisfy the common abstract and have tests;
- Structural and high-risk Extend families are linguistically reviewed and regression protected;
- API facades satisfy the compatibility contract;
- Documentation/Symbol/Markup match current category contracts;
- all release-blocking decisions in `22_DECISION_REGISTER.md` are closed;
- `24_CLOSURE_CHECKLIST.md` is complete.
