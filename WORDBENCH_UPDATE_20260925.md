# Albanian Wordbench remediation — run 20260925_024114 / summary 20260925-024243

## Confirmed state before this correction

- Wordbench native census: **58 = 51 language + 5/5 API facades + 2/2 MorphoDict**.
- Historical core remains green.
- `DictSqiAbs.gf`: direct type failure because legacy suffix `AV` (plus A2V/AS/V0) was emitted as a GF category.
- `DictSqi.gf`: downstream from `DictSqiAbs`.
- `MorphoDictSqi.gf`: direct compiler failure at `cilido_A`: `Predef.error: Cannot find an inflection rule`.
- `alb-dict-smoke` and `alb-morphodict-smoke`: loaded dictionary files directly from the GF shell and therefore reported `Unable to find`.

## Corrections applied

1. Preserve all Dict function IDs, but normalize declaration/linearization types: `A2V→A2`, `AS→A`, `AV→A`, `V0→V`.
2. Patch `tools/dictionary/build_complete_dict.py` so regeneration keeps that normalization.
3. Replace `cilido_A = mkA "cilido"` with an explicit declined realization derived from `StructuralSqiNominal.which_IQuant` + bound suffix `do`; this yields the Tosk-attested `cilindo` in masculine accusative singular.
4. Validation abstracts now inherit `DictSqiAbs` / `MorphoDictSqiAbs`; concretes inherit the corresponding concrete dictionary.
5. Smoke scenarios import only the validation concrete, matching the pattern used by the 50 established passing scenarios.
6. Remove obsolete `[gf].path_parts = ["morphodict"]`; Wordbench 1.3.4 discovers the project-local MorphoDict companion natively.
7. No historical Albanian core GF module is modified.

## Expected next Wordbench gate

- **58/58** direct census compile.
- **52/52** required scenarios.
- Only after that: linguistic/ChatGPT review and gold promotion.

## Follow-up from Wordbench run 20260925_030234

- census: 58 targets, 56 OK before this follow-up
- Dict direct cause: `aftesi_mendore_V` smart `mkV` raised `Cannot find an inflection rule`; all 2141 Albanet-only unreviewed V entries now use `invariantV`
- MorphoDict direct cause: `cilido_A` used `True` without `Prelude` in scope; `Prelude` is now explicitly opened
- the 50 historic scenarios remained green; the two dictionary smoke scenarios are expected to become loadable once their parent dictionary modules compile
- target for next GF 3.12 run: 58/58 files and 52/52 scenarios


## v3 — run 20260925_031945

- Dict Albanet unreviewed N/A/V converted to compile-safe placeholders.
- MorphoDict 155 Tosk smart-generated N/A/V converted to compile-safe placeholders, preserving known noun gender.
- Exact RGL morphology remains unchanged.
- Next target: 58/58 + 52/52 under GF 3.12.


## v4 strict-lock fix (run 20260925_032810)
- Wordbench 1.3.4 discovered 58 targets and all 52 scenarios passed.
- Only DictSqi.gf and MorphoDictSqi.gf were rejected by Strict mode because local placeholder helpers returned bare ResSqi records without category lock fields.
- `invariantN` and `invariantA` now construct `lin N {...}` / `lin A {...}` values, matching the category boundary used by ParadigmsSqi.
- Dictionary entries and scenario corpus are unchanged from v3.
- The Dict generator and both static validators were updated so rebuilds keep the lock-safe form.
- Target for the next GF 3.12 Wordbench run: 58/58 files + 52/52 scenarios.
