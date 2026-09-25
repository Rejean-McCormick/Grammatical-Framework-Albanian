# Copula and secondary predication contract

## Copular families

The public `Verb` API requires `CompNP`, `CompAP`, `CompCN`, `CompAdv`, `UseComp`, `UseCopula`. Current Sqi realizes them through `jam` with deferred complement material.

Finalization requires separate tests for:

- identity/classification (`NP`, `CN`);
- adjectival predication (`AP`) with agreement;
- locative/adverbial/PP predication (`Adv`);
- polarity and tense;
- subject number/gender/person interactions where the complement is agreement-sensitive.

## Secondary predication

`V2A` is not simply `V2 + AP string`. It encodes an object plus a predicative AP. The user-supplied regression family `e lyeva i kuq` is a mandatory design test.

### Protected invariant

The AP agreement controller must be the Albanian syntactic controller justified by evidence. Current code in `SlashV2A` realizes the AP using the `Agr` passed into the matrix VP, which is normally the matrix subject channel. This is explicitly **PROVISIONAL/RISK** until corrected or linguistically justified.

### Required architecture outcome

If object-controlled agreement is required, the solution must carry the object agreement to the secondary-predicate realization boundary. Do not patch the final string with a hard-coded article/adjective form.

## Resultative vs depictive

No final claim is made from the supplied evidence that Albanian uses one uniform construction for all English-style resultatives/depictives. Keep these as separate test/evidence families. A successful `V2A` example does not certify the full semantic class.

## Evidence gate

Secondary-predication decisions remain `EVIDENCE_REQUIRED` unless supported by an Albanian reference/example beyond the user-provided regression family.
