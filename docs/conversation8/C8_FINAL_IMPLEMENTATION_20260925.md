# Conversation 8 — final implementation candidate — 2026-09-25

## Scope
Valence/complementation, control, lexical finite complementizers, copula/secondary predication, coordination agreement, existential/progressive idioms, and propagation through slash/Extend consumers.

## Implemented architecture
- `VPSlash` separates pre-gap material from `gapPost` material.
- `gapPost` receives matrix-subject and missing-object agreement.
- `V2V` object control uses the missing object as embedded subject.
- `V2A` predicates agree with the missing object and use accusative adjective realization.
- `V3` slash variants preserve c2/c3 order.
- `VS` / `V2S` preserve lexical finite complementizers; default `që`, `hope_VS` = `se`.
- coordinated NP agreement resolves P1 > P2 > P3 and preserves plural gender.
- existential `kam` remains impersonal 3sg including anterior forms.
- saturated `ProgrVP` uses tense-general `jam + duke + participle`.
- unresolved `ProgrVPSlash` retains `po + finite V` pending a cross-workstream clitic-site representation.

## Certification boundary
No GF executable is available in this environment. Static/structural validation is executed here; fresh GF 3.12 / Wordbench acceptance and linguistic gold promotion remain external gates.

## Explicit review target
Object secondary-predicate accusative (`e lyeva të kuq/të kuqe`) is the implemented target and must be promoted to linguistic gold only after Albanian review. Lexical `që`/`se` selection must likewise be expanded entry-by-entry from evidence.
