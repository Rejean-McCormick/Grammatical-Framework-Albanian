# Coordination and agreement contract

## Active public surface

Current Sqi directly implements all 9 active public conjunction functions: `ConjS`, `ConjRS`, `ConjAP`, `ConjNP`, `ConjAdv`, `ConjAdV`, `ConjIAdv`, `ConjCN`, `ConjDet`.

## Current risks

- NP list agreement is currently hard-coded to `{gn=GPl; p=P3}`.
- CN coordination propagates a stored gender from list members rather than proving a coordinated-gender resolution rule.
- These facts compile but are not equivalent to a linguistic agreement analysis.

## Final target

### NP
Store/derive enough information to compute the agreement required by Albanian coordinated subjects. Person resolution, number and gender must be evidence-backed. Do not import English resolution rules by default.

### AP/CN
Coordinate full inflectional tables without losing case/species/number/gender distinctions. Any resolved gender metadata must reflect Albanian evidence rather than whichever conjunct was easiest to copy.

### S/RS/Adv/AdV/IAdv/Det
Preserve constituent type and punctuation/conjunction ordering without semantic loss.

### VP-like coordination
The locked RGL does not provide ordinary `ConjVP` in `Conjunction.gf`; C8 therefore uses the scoped `Extend` families (`VPS/VPI/VPS2/VPI2`) for predicate coordination where appropriate. This boundary must stay explicit.

## Linguistic evidence state

The supplied PDF explicitly lists common coordinating conjunctions (`dhe/e/edhe`, alternatives such as `a/apo/ose`, adversatives), but the current supplied evidence does **not** establish a complete coordinated-subject agreement resolution algorithm. That algorithm remains `EVIDENCE_REQUIRED`.
