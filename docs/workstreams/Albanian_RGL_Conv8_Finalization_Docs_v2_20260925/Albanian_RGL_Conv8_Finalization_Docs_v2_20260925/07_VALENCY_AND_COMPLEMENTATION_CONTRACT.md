# Valency and complementation contract

## Target category semantics

| Category | Required distinction |
|---|---|
| V | no selected object/complement in the RGL valence sense |
| V2 | one selected NP/PP object with government |
| V3 | two selected nominal/prepositional complements with distinct slots |
| VS | finite declarative/clausal complement |
| VQ | embedded question complement |
| VV | verbal complement; Standard/Tosk strategy must not be assumed to be English infinitival syntax |
| VA | adjectival predicate complement controlled by matrix subject unless evidence establishes another analysis |
| V2S | object plus clausal complement |
| V2Q | object plus embedded question |
| V2A | object plus secondary adjectival predicate; controller must be explicit/correct |
| V2V | object plus verbal complement; control relation must be evidence-backed |

## Standard/Tosk complement evidence already locked

The supplied PDF states that the subjunctive is a chief marker of subordination and gives intention/modal examples with `të` + subjunctive. It also states that Tosk/Standard uses subjunctive subordinate clauses in many contexts where Geg uses `me` + participle. The UT lessons independently give `dua të ...`, tense-sequenced subjunctive examples, and finite-clause strategies corresponding to English infinitival complements.

Consequence: C8 must treat English `VP`/infinitival labels as abstract API semantics, not as an instruction to manufacture an English-like infinitive.

## Lexical constructor requirements

Final `ParadigmsSqi` must expose enough constructor distinctions to build every valence category without raw record surgery. Current observed constructors already include `mkV2`, `mkVV`, `mkVS`, `mkVQ`, `mkVA`, `mkV2V`, `mkV2S`, `mkV2Q`, `mkV2A`, `mkV3`.

The next question is not constructor existence but whether the constructors carry enough Albanian-specific metadata. Add overloads/metadata only when a reviewed lexical contrast demands them.

## Required lexical evidence per promoted verb

- lemma and sense relevant to the GF function;
- selected category;
- complement case/preposition for every nominal slot;
- finite vs subjunctive/verbal complement behavior;
- control relation for V2V/VV where applicable;
- clitic compatibility/doubling implications when relevant;
- at least one positive realization test;
- a contrastive negative/alternative test when the distinction could collapse.

## Anti-patterns

- `V` plus manually appended object string instead of V2/V3;
- V2/V3 whose case is ignored at saturation;
- all VS hard-coded identically without lexical evidence;
- interpreting every RGL `VV` as an English infinitive;
- using V2A subject agreement because the current function happens to receive subject `Agr`;
- creating a DictSqi placeholder instead of fixing a core constructor/realizer.
