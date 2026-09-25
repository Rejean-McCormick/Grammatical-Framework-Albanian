# Albanian Linguistic Rules for Clause Syntax v2

**Scope:** only claims supported by the supplied Albanian reference bundle.  
**Rule:** absence of a rule here means “not established by this package”, not “false in Albanian”.

Each fact has a stable evidence ID used by the traceability and change-record files.

## E-C07-001 — Neutral order

**Source:** `Lesson_10.html`, “1 General Syntactic Concerns”.  
**Supported fact:** Albanian is described as generally Subject–Verb–Object, with some flexibility.

**Engineering consequence:** neutral ordinary predication may use SVO. The phrase “some flexibility” does not license free scrambling, nor identify which marked orders are grammatical in which discourse contexts.

## E-C07-002 — Indicative negation

**Source:** `Lesson_30.html`, “13 Negation”.  
**Supported fact:** indicative negation uses `nuk` or `s'`, described there as synonymous.

**Engineering consequence:** current canonical `nuk` generation is compatible with the source, but the source also establishes a legitimate alternative. Whether both should be generated, parsed, or conditioned by style/register is an explicit policy question (OD-C07-013).

## E-C07-003 — Non-indicative negation

**Source:** `Lesson_30.html`, “13 Negation”.  
**Supported fact:** `mos` is used with subjunctives, imperatives, optatives and participial formations.

**Engineering consequence:** clause/VP realization must not use one undifferentiated negator for all moods. Dedicated negative-imperative and negative-subjunctive interaction tests are required.

## E-C07-004 — Subjunctive `të`

**Sources:** `Lesson_10.html` verb section; `Lesson_20.html`, present tense; `Lesson_30.html`, “14.2 Subjunctive Subordination”.  
**Supported fact:** the subjunctive is introduced by `të`, and Standard/Tosk Albanian uses finite subjunctive structures in environments where many languages use infinitives.

**Engineering consequence:** `të` belongs to the structured subjunctive realization path. It must not be inferred by inspecting an indicative string.

## E-C07-005 — Standard/Tosk future

**Source:** `Lesson_10.html` verb section.  
**Supported fact:** future is described as invariant `do` plus a present subjunctive form including `të`.

**Engineering consequence:** future-clitic ordering must retain the position between `të` and the verb; the clause workstream consumes the clitic interface rather than building contractions itself.

## E-C07-006 — Indicative sentential complementizers

**Source:** `Lesson_30.html`, “14.1 Indicative Subordination”.  
**Supported fact:** `se` and `që` are described as common indicative subordinators with the same “that” function in the examples discussed.

**Engineering consequence:** a global hardcoded `që` can be a working implementation but is not yet a fully characterized generation policy. The source does not provide a complete distribution/register rule for choosing `se` vs `që`.

## E-C07-007 — Finite verbal complements

**Source:** `Lesson_30.html`, “14.2 Subjunctive Subordination”.  
**Supported fact:** Standard/Tosk uses a finite `të`-subjunctive instead of an infinitive in examples such as ‘want to learn’; an overt embedded subject can appear in a `që SUBJECT të VERB` pattern.

**Engineering consequence:** `VV`/control and `EmbedVP` cannot be treated as English infinitives. Subject/control ownership must remain with the valency/control contract.

## E-C07-008 — Declined relative pronoun

**Source:** `Lesson_30.html`, “14.3 Relative Clauses”.  
**Supported facts:** Standard Albanian has a declined relative pronoun; it appears clause-initially; its case follows its role in the relative clause; its gender/number follow the head noun.

**Engineering consequence:** `RP` must preserve case and head agreement long enough to select the form. The current `RP : Case => GenNum => Str` is compatible with this need.

## E-C07-009 — Invariant relative `që`

**Source:** `Lesson_30.html`, “14.3 Relative Clauses”.  
**Supported fact:** the source says invariant `që` is more common in spoken Albanian than the declined `cili/e` relative pronoun.

**Engineering consequence:** both strategies are linguistically relevant, but the supplied source does not fully characterize when Standard generation should prefer one, especially with prepositions. Strategy selection remains open.

## E-C07-010 — Weak-pronoun placement

**Source:** `Lesson_30.html`, “17.2 Position of weak pronouns”.  
**Supported facts:** outside imperatives, weak pronouns precede the verb; with `të` and `do të`, they occur directly before the verb; positive imperatives permit pre- or postverbal placement in the examples; negative imperatives place the clitic before the verb after the negator.

**Engineering consequence:** clause assembly must preserve the VP/clitic interface. It must not append object pronouns as ordinary post-complements. Positive imperative alternants require a deliberate variant policy.

## E-C07-011 — Object clitic realization

**Source:** `Lesson_30.html`, “17.3 Use of clitic pronouns”.  
**Supported facts:** an overt direct object may occur with or without the direct-object weak pronoun in the described examples; indirect-object weak pronouns are required even with an overt indirect object; dative precedes accusative in combinations.

**Engineering consequence:** this is primarily WS06/WS09 ownership. Conversation 7 must test interactions but must not recreate doubling rules at clause level.

## E-C07-012 — Direct questions

**Source:** `Lesson_50.html`, “29 Questions”.  
**Supported facts:** wh pronouns show case distinctions (e.g. subject vs prepositional form); a direct yes/no question requires marker `a` in the source's description.

**Engineering consequence:** direct `QuestCl` with `a` and case-governed `IP` are evidence-backed. This evidence does not establish embedded-question form.

## E-C07-013 — Impersonal/clausal-complement agreement clue

**Source:** `Lesson_30.html`, discussion immediately following relative clauses.  
**Supported fact:** an impersonal construction with an understood expletive subject and clausal complement is exemplified with feminine adjective agreement.

**Engineering consequence:** “unknown/default subject agreement = masculine 3SG” is not a universally safe linguistic assumption. Mapping this fact to specific RGL constructors requires a separate decision; do not mechanically change every `defaultAgr` to feminine.

## E-C07-014 — Information-structure evidence gap

The supplied clause sections establish neutral SVO plus unspecified flexibility. They do **not** provide a complete inventory of topicalization, focus or scrambling orders and licensing conditions.

**Engineering rule:** existing `Foc*`, fronting or inversion functions are implementation facts only until backed by targeted Albanian evidence.

## E-C07-015 — Embedded-question evidence gap

A search of the supplied lesson/reference texts did not locate a section that establishes whether embedded polar or wh questions retain the direct interrogative marker/order.

**Engineering rule:** do not infer embedded behavior from English, Greek, Bulgarian, Macedonian, Romanian, or the current `EmbedQS = identity` implementation.

## Evidence boundaries

This package does not currently establish:

- canonical `se` vs `që` selection by verb/register;
- direct vs indirect `QForm` behavior;
- productive preposition stranding;
- a complete information-structure order inventory;
- automatic pro-drop policy;
- adverb placement classes;
- exact nonrestrictive-relative punctuation policy;
- the RGL agreement value appropriate for every sentential subject/expletive construction.

Those remain open even if the current code compiles.
