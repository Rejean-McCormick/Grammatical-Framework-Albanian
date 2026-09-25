# Definition of done - Conversation 8

## Final objective

Reach English-RGL-comparable **coverage and engineering maturity** for the C8 scope while preserving Albanian-specific grammar. English is a coverage/API reference, not a linguistic template.

The final C8 subsystem must make rich lexical categories usable in ordinary Albanian syntax, so `DictSqi` can promote verbs from generic `V` to real valence categories without compensating strings or placeholder semantics.

## Required final surface

### Valence

`V`, `V2`, `V3`, `VS`, `VQ`, `VV`, `VA`, `V2A`, `V2S`, `V2Q`, `V2V` must have:

- explicit lexical construction support;
- complement government preserved to final realization;
- clitic behavior integrated at the argument boundary;
- finite/non-finite/subjunctive complement strategy justified per category;
- controller/agreement behavior represented where linguistically required;
- direct and slash realizers that agree on the same contracts.

### Copula and secondary predication

The system must distinguish and correctly realize at least NP, AP, CN and Adv/PP complements. Secondary predicates such as the user-supplied family `e lyeva i kuq` must not accidentally agree with the matrix subject when Albanian evidence requires object control.

### Coordination

Public RGL coordination for S/RS/AP/NP/Adv/AdV/IAdv/CN/Det must be structurally complete. NP/CN agreement resolution must be evidence-backed. Predicate coordination is handled through the appropriate VPS/VPI families, not by inventing an abstract `ConjVP` absent from the locked API.

### Construction and Idiom

Every active abstract `Construction` and `Idiom` function must be classified as `CERTIFIED`, `REVIEW_REQUIRED`, `PROVISIONAL`, or `EVIDENCE_REQUIRED`; nothing may silently remain a plausible-looking literal string.

## Quantitative exit gates

1. GF structural census remains **58/58**.
2. Existing scenario baseline remains **52/52**.
3. All new C8 structural scenarios pass.
4. The current project roadmap records **569 reviewable generated CASEs**; C8-relevant cases must be classified during the review campaign, and no reviewed failure may be hidden by a compile-only fix.
5. Existing `validation/gold/` currently contains no approved gold beyond `.gitkeep`; therefore C8 must not claim gold regression certification until reviewed C8 golds are actually promoted.
7. 100% of active public functions in the C8 API matrix are classified.
7. 100% of C8 lexical valence constructors are mapped to producer/carrier/consumer contracts.
8. No `EVIDENCE_REQUIRED` item may be marked final.
9. No new compile-safe lexical placeholder may be introduced to hide a C8 core weakness.
10. Every DictSqi promotion records lemma, old category, new category, valence evidence, constructor, focused test and review status.
11. The final report separates structural green status from linguistic certification.

## Maturity comparison with English

"Equivalent to English" means comparable public coverage, maintainability, testability and lexical usability. It does **not** mean identical internal types, identical complement syntax, identical infinitival strategy, identical word order, or identical idioms.
