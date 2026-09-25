# Master contract — Albanian verbal finalization

**Status:** highest-level normative contract for Conversation 4.

## 1. Final objective

Deliver an Albanian verbal subsystem with English-RGL-class **coverage, compositionality, public API maturity and regression discipline**, while preserving Albanian-specific TAM, mood, auxiliary, voice, clitic and non-finite behavior.

The final system must support the common RGL `Tense × Anteriority × Polarity` contract, all public `Verb` operations, and Albanian-specific verbal distinctions through controlled extension points rather than by corrupting common RGL semantics.

## 2. Protected baseline

Project-declared baseline:

- GF 3.12;
- Wordbench 1.3.4 with native `src/morphodict` discovery;
- expected census 58/58 = 51 language + 5 API facades + 2 MorphoDict;
- existing scenarios 52/52;
- tag `albanian-s02-green-20260925`;
- `DictSqi` 6,720 functions;
- `MorphoDictSqi` 592 lemgrams;
- 569 reviewable linguistic CASEs;
- compile-safe placeholders are explicit debt, never linguistic gold.

These values are regression anchors. A final release claim still requires fresh stored GF/Wordbench evidence.

## 3. Hard invariants

`VINV-001` **One finite assembly point.** Finite TAM/polarity/voice/particle ordering is owned by one verbal realizer boundary, not reconstructed in Sentence/Question/Relative/Extend modules.

`VINV-002` **Morphology before syntax.** Exact inflectional forms belong to morphology/paradigms/irregulars. Syntax may select forms; it may not reverse-engineer them from strings.

`VINV-003` **Morphological voice != semantic voice use.** Non-active morphology, passive semantics, reflexive semantics and reciprocal semantics remain distinguishable until realization.

`VINV-004` **Particles are not free prefixes.** `do`, `të`, `po`, non-active `u`, `nuk`, `mos`, weak-pronoun clusters and auxiliaries are construction-sensitive slots.

`VINV-005` **No English grammatical imitation.** English governs API/maturity comparison only. Albanian forms require Albanian evidence.

`VINV-006` **No model-language proof by analogy.** Greek/Macedonian/Bulgarian/Romanian/Italian structures may motivate representation, not Albanian surface rules.

`VINV-007` **No blanket DRAFT-MAX activation.** Every harvested idea is re-derived as an independent current-tree migration slice.

`VINV-008` **No placeholder masking.** A core verbal weakness may not be hidden by a new compile-safe placeholder when a real paradigm/type/construction is required.

`VINV-009` **Common RGL semantics stay common.** Albanian-only distinctions belong in Albanian resources/`ExtraSqi`/`ExtendSqi`, not in altered meanings of common abstract constructors.

`VINV-010` **OPEN stays open.** Unsettled linguistic cells are not assigned a surface realization merely to complete a table.

## 4. Definition of done

Conversation 4 is final only when all of the following are true:

1. the final `Verb`/`VP`/clause realization contracts are implemented and documented;
2. common RGL 4×2×2 temporal/polarity behavior has an explicit Albanian strategy for every supported cell;
3. simple present, imperfect and aorist morphology are not conflated with compound perfect storage;
4. active compound forms select `kam` and non-active compound forms select `jam` for the Standard-Albanian behavior supported by the supplied references, unless a documented exception is later established;
5. future/conditional/subjunctive/progressive/imperative strategies have explicit legality and ordering rules;
6. `PassV2`, `ReflVP` and reciprocal policy do not conflate semantic use with one raw marker;
7. all 29 public `Verb` operations preserve the structured state required by the final architecture;
8. focused morphology/TAM/voice/clitic tests pass;
9. fresh Wordbench returns 58/58 and the original 52/52 with no unreviewed gold regression;
10. newly asserted linguistic behavior is reviewed and traceable to supplied Albanian evidence;
11. every remaining unsupported or unresolved behavior is explicitly listed as OPEN/deferred rather than hidden in code.

Compilation is necessary but never sufficient for item 10.
