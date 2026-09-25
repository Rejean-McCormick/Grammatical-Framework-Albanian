# Wordbench run 20260925_032810 — v4 strict-lock fix

## Observed run
- GF Wordbench 1.3.4, GF 3.12, strict mode.
- Complete census: 58 = 51 language + 5 API facades + 2 MorphoDict.
- Compilation: 56/58 accepted by strict mode.
- Scenarios: 52/52 OK.
- The two remaining file failures were not GF type/paradigm errors; they were strict structural warnings only.

## Root cause
`DictSqi.invariantN`, `DictSqi.invariantA`, `MorphoDictSqi.invariantN`, and `MorphoDictSqi.invariantA` returned bare `ResSqi.Noun` / `ResSqi.Adj` records. GF accepted their structure but warned that the concrete-category lock fields `lock_N` / `lock_A` were missing. Wordbench strict mode correctly promoted those warnings to blockers.

## Fix
The helpers now construct explicit category values with `lin N {...}` and `lin A {...}`. This preserves the exact same placeholder surface tables and gender/clitic values while allowing GF to attach the category lock fields. `invariantV` is unchanged because it already returns a proper `V` through `irregV`.

The Dict generator was updated with the same helper form. Static validators now assert the lock-safe constructors. No dictionary entry, abstract inventory, historical core module, or scenario was changed by this fix.

## Certification boundary
Static validation passes locally. The next external GF 3.12 Wordbench run is still required to establish 58/58 strict compile certification. The previous run already established 52/52 scenario execution for this source family.
