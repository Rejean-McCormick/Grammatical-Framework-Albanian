# Albanian DRAFT-MAX — checkpoint 1 (2026-09-24)

## Intent
This is an intentionally ambitious development checkpoint, not a release candidate.
The base is the last concrete Albanian linguistic-completion overlay applied to the
20260923-194448 snapshot. The goal is to broaden the Albanian RGL representation
before doing the stabilization pass.

## Concrete changes in this checkpoint

1. **Explicit Genitive case in the internal Albanian case space**
   - `Case = Nom | Acc | Gen | Dat | Ablat`.
   - `ParadigmsSqi.genitive` is exposed.
   - Current generic noun/adjective constructors mirror Dative morphology into
     Genitive as a draft default. This is deliberate scaffolding of the *case
     distinction*, not a claim that all Genitive morphology is independently
     different from Dative.

2. **Plural agreement now preserves gender**
   - `GenNum = GSg Gender | GPl Gender` instead of a genderless `GPl`.
   - `agrGender` therefore no longer falls back to masculine for every plural.

3. **Noun gender becomes number-sensitive**
   - `Noun.g : Number => Gender`.
   - Existing one-gender paradigms are lifted to constant Sg/Pl gender.
   - `setNounGender` is added as an escape hatch for ambigeneric nouns (e.g.
     masculine singular / feminine plural) without rewriting their surface table.

4. **Number-sensitive gender propagated through core nominal composition**
   - `DetCN`, `MassNP`, `AdjCN`, `RelCN`, etc. select `cn.g ! number`.
   - plural agreement constructors are updated to carry an explicit gender.

5. **Declined `cili` relative-pronoun strategy**
   - invariant `që` remains the clause-relative strategy in `RelCl`.
   - `IdRP` now exposes a case × gender × number `cili` series for overt relative
     pronoun contexts: nominative, accusative, genitive/dative, ablative draft forms.

6. **Coordination agreement is no longer hard-coded P3 masculine plural**
   - person is combined P1 > P2 > P3.
   - feminine plural is retained when both conjuncts are feminine; mixed gender
     currently falls back to masculine pending a fuller Albanian agreement audit.

## Files changed (10)
- `CatSqi.gf`
- `ClauseSqiRes.gf`
- `ConjunctionSqi.gf`
- `IdiomSqi.gf`
- `NounSqi.gf`
- `ParadigmsSqi.gf`
- `RelativeSqi.gf`
- `ResSqi.gf`
- `StructuralSqiNominal.gf`
- `SymbolSqi.gf`

## What is *not yet* encoded in checkpoint 1
These were designed/discussed in the draft-max work but are intentionally left for
checkpoint 2 rather than falsely marked complete:

- typed `CliticCluster` replacing flat `VP.cl : Str`;
- centralized accusative+dative clitic fusion and `të` contractions;
- typed perfect auxiliary selection (`kam` vs `jam`) propagated through `Verb/VP`;
- full non-active/passive/reflexive voice representation;
- broader imperative/subjunctive clitic ordering;
- systematic propagation of Genitive through every remaining case table in the
  entire RGL surface;
- full ambigeneric lexical audit and reclassification.

## Validation status
- This checkpoint is **not GF compile-certified** by design.
- `validation/` is byte-for-byte unchanged from the base.
- `MorphoSqi.gf` itself is unchanged in checkpoint 1 and its heuristic lint is run
  only as a mechanical sanity check.
- The next stabilization pass should treat missing `Gen` branches or old `GPl`
  assumptions as expected propagation work, not as reasons to roll back the richer
  representation.
