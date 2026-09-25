# ConstructionSqi and IdiomSqi final contract

## Surface status

All 68 active abstract `Construction` functions and all 14 abstract `Idiom` functions have direct definitions in the current Sqi modules. Presence is not certification.

## Construction classification

Each function must be classified into one of:

1. compositional reuse of certified core grammar;
2. lexicalized but linguistically evidenced expression;
3. provisional literal/string realization requiring review;
4. N/A only if the abstract contract permits/needs a language-specific non-equivalent strategy and the decision is documented.

High-risk families:

- age/name/distance;
- stative predicates such as hungry/thirsty/right/wrong;
- weather;
- measurement/container constructions;
- date/time expressions;
- language expressions;
- any helper using invariant nouns/NPs solely for convenience.

## Idiom classification

Mandatory review families:

- impersonal and generic clauses;
- clefts;
- existentials with/without locative Adv;
- progressive;
- first-person plural and third-person imperatives;
- emphatic/reflexive `Self*` constructions.

## Existential contract

Current `IdiomSqi` uses a dedicated existential word path (`ka/pati/do të ketë/...`) rather than simply `jam`. This is an implementation fact, not yet blanket linguistic certification. Test number, polarity, tense, locative extension and interrogative counterparts independently.

## Progressive contract

Do not infer English `be + -ing` architecture. The supplied references identify Albanian gerundive formations (`duke` + participle in Standard/Tosk descriptions), but the exact RGL progressive realization must be tested for tense/polarity/argument interactions.

## Composition rule

`ConstructionSqi` and `IdiomSqi` should reuse certified core constructors whenever possible. A special string is acceptable only when the construction is genuinely lexicalized and evidence records that fact.
