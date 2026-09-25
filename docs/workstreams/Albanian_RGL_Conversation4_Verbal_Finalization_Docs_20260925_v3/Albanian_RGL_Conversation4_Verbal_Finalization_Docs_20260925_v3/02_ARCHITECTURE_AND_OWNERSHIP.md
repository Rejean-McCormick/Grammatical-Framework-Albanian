# Target architecture and ownership

**Status:** normative TARGET architecture. Exact GF field names may evolve; distinctions and ownership may not disappear without a recorded decision.

## 1. Four-layer model

The final system separates four questions:

1. **Morphology:** which forms does the lexeme possess?
2. **VP state:** which valency/complements/semantic voice use are requested?
3. **Clause request:** which tense, anteriority, mood, polarity and progressivity are requested?
4. **Realization:** which complete Albanian verbal strategy satisfies that request?

No layer may recover an earlier distinction by inspecting a later surface string.

## 2. Required internal distinctions

Equivalent information to the following must survive until its final consumer:

```text
MorphVoice = ActiveMorph | NonActiveMorph
VoiceUse = PlainUse | PassiveUse | ReflexiveUse | ReciprocalUse
FiniteMood = Indicative | Subjunctive | Imperative | Optative | Admirative
Progressivity = Neutral | Progressive
```

The exact parameter names are implementation choices. The distinctions are normative.

## 3. Morphology ownership

`MorphoSqi` / `ParadigmsSqi` / `IrregSqi` own exact inflectional forms and productive class logic. The final lexical verb representation must expose the simple finite and non-finite material actually consumed by syntax, including at least:

- active present, imperfect, aorist;
- non-active equivalents where productively represented/lexically available;
- finite subjunctive forms required by Standard Albanian;
- imperative;
- participle;
- optative/admirative forms retained by the Albanian extension surface.

Compound perfect/pluperfect/future-perfect constructions are clause strategies from auxiliary + participle; they should not masquerade as an opaque simple lexical tense.

## 4. VP ownership

`VP`/`VPSlash` own deferred syntactic state:

```text
lexical verbal head
+ complements / slash contract
+ object/reflexive clitic state from the shared clitic interface
+ MorphVoice
+ VoiceUse
+ agreement-dependent postmaterial
```

Progressivity may be carried at VP or clause-request level, but must have one owner and one final consumer.

## 5. Clause-request ownership

A disciplined `ClauseContext` or equivalent argument bundle owns:

```text
common RGL tense or Albanian-specific tense request
anteriority
polarity
finite mood
progressivity
embedding/clause mode needed for particle/clitic placement
```

Common constructors populate common values. Albanian-only distinctions use Albanian extension requests rather than redefining `TPast`, `TFut` or `TCond`.

## 6. Single realization boundary

All finite strings flow through one operation family, conceptually:

```text
realizeFinite
realizeEmbedded
realizeImperative
realizeParticiple / realizeGerundive
```

That boundary owns compatibility and order among:

- `nuk` / `mos`;
- future/conditional `do`;
- subjunctive `të` and licensed contractions;
- progressive `po`;
- non-active `u` where grammatically required;
- auxiliary `kam/jam`;
- finite head or participle;
- weak-pronoun cluster;
- complements/adverbs.

Sentence/Question/Relative/Construction/Extend modules may supply clause-specific order around the verbal complex but may not independently reconstruct TAM or auxiliary chains.

## 7. Auxiliary selection

For the Standard-Albanian behavior supported by the supplied references:

- active compound forms use `kam`;
- non-active compound forms use `jam`.

Therefore the default target is **voice-conditioned auxiliary strategy**, not a copied Italian lexical `essere/avere` class. A persistent lexical auxiliary-class field is added only if Albanian exceptions are established.

## 8. Voice/use separation

`PassV2` sets passive semantic use; `ReflVP` sets reflexive semantic use; reciprocal constructions set reciprocal use. They do not directly assert one fixed surface prefix.

The realizer selects the licensed Albanian morphological strategy for the requested TAM and voice state. A synthetic non-active, `u` aorist, and `jam + participle` are distinct realizations, not interchangeable strings.

## 9. Cross-workstream ownership

| Neighbor | Owns | Conversation 4 consumes/owns |
|---|---|---|
| clitic/pronoun work | pronoun morphology, legal cluster representation | placement of the provided structured cluster inside verbal strategies |
| lexicon/DictSqi | category and subcategorization | realization after valency is selected |
| MorphoDict | lemma→inflection-table coverage | required form inventory, never semantic valency |
| Sentence/Question/Relative | clause-type constituent ordering | central finite complex service |
| Extend/Extra | abstract extension semantics/public surface | reusable Albanian verbal strategy services |
| StructuralSqiVerbal | lexical modal/auxiliary items | complement-realization contract they select |

A neighbor changing a consumed record/type triggers focused verbal tests plus full baseline validation before integration.
