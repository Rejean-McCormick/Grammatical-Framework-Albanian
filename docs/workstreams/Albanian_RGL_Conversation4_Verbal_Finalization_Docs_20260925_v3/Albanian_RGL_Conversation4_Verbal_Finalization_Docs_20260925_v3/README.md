# Albanian RGL — verbal finalization pack v3

**Workstream:** Conversation 4 — TAM + auxiliaries + voice  
**Date:** 2026-09-25  
**Status:** normative design and certification pack  
**Protected baseline:** `albanian-s02-green-20260925`

## Purpose

This pack is the single anti-drift specification for finalizing the Albanian verbal subsystem of the GF Resource Grammar Library. It supersedes the v2 documentation pack by reducing duplication and assigning **one canonical owner document to each class of fact**.

The goal is **English-RGL-class maturity**, not English grammar copied into Albanian. English is the reference for public API coverage, compositional engineering and validation depth. Albanian references govern Albanian realization. Greek/Macedonian/Bulgarian and Romanian/Italian are targeted architecture comparisons only.

## Canonical document map

| Topic | Canonical owner |
|---|---|
| final objective, hard invariants, definition of done | `00_MASTER_CONTRACT.md` |
| current source behavior and debt | `01_CURRENT_BASELINE_AND_DEBT.md` |
| target types, ownership and realization boundary | `02_ARCHITECTURE_AND_OWNERSHIP.md` |
| Albanian linguistic claims and source locators | `03_LINGUISTIC_EVIDENCE.md` |
| TAM/voice strategies, particle/clitic slots, legal/illegal combinations | `04_REALIZATION_STRATEGIES_AND_CONSTRAINTS.md` |
| all 29 public `Verb` operations | `05_PUBLIC_RGL_COVERAGE.md` |
| accepted decisions and unresolved questions | `06_DECISIONS_AND_OPEN_QUESTIONS.md` |
| implementation order, DRAFT-MAX harvesting, migration/rollback | `07_IMPLEMENTATION_CHANGE_CONTROL.md` |
| tests, traceability and certification labels | `08_TEST_TRACEABILITY_CERTIFICATION.md` |
| model-language comparison policy | `09_COMPARISON_POLICY.md` |
| release gate | `10_RELEASE_GATE.md` |
| stable ID namespaces and terminology | `11_ID_REGISTRY_AND_GLOSSARY.md` |
| v2→v3 consolidation and completeness audit | `12_OPTIMIZATION_AND_COMPLETENESS_AUDIT.md` |

If two documents appear to overlap, the owner listed above wins. Other documents may link to the rule but must not redefine it.

## Source lock

| Source | SHA-256 | Role |
|---|---|---|
| Albanian working snapshot | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` | current Albanian implementation |
| supplied upstream RGL | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` | exact abstract/API and model implementations |
| GF RGL AI Compendium | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` | contracts, workflows and engineering patterns |
| GF Wordbench | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` | validation infrastructure |
| Albanian references | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` | linguistic authority for this workstream |

The supplied `gf-rgl-master.zip` has no Git metadata; it is a supplied upstream snapshot, not an asserted immutable Git revision.

## Status vocabulary

- **ESTABLISHED** — directly supported by current source, exact RGL contract, stored compiler evidence, or supplied Albanian linguistic evidence.
- **TARGET** — chosen architecture required to preserve established distinctions; implementation/test evidence still needed.
- **OPEN** — not sufficiently established; code must not silently choose a value.
- **HISTORICAL** — prior experiment/baseline that does not override current evidence.
- **CERTIFIED** — implemented, compiler/regression validated, and linguistically reviewed for the stated scope.

## Working rule

No verbal behavior is promoted from TARGET/OPEN to CERTIFIED merely because GF compiles it. Every promoted behavior must have an evidence ID (`VE-*`), strategy ID (`VR-*`/`VX-*`), implementation symbols, test IDs (`VT-*`) and stored run evidence.
