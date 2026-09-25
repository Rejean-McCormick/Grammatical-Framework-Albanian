# v2 quality audit — remaining known gaps

**Audit date:** 2026-09-25  
**Scope:** documentation/control-system quality, not linguistic certification.

## What v2 now closes

- Every common function tracked by the C9 matrix has a stable row ID and exact supplied-master signature.
- Every current matrix row has an Albanian owner or an explicit inherited/version-blocked state.
- Coverage and certification are separate columns/status axes.
- Common-contract “N/A” can no longer mean omission; neutralization must still satisfy the abstract.
- Public facade composition and English-only/module surfaces are explicitly inventoried.
- Decisions, linguistic evidence, tests, compatibility and cross-workstream dependencies have dedicated registers.
- Closure is checklist-driven rather than inferred from prose.

## Quantitative matrix state at documentation generation

| Area | Rows | Current structural state |
|---|---:|---|
| Structural | 102 | candidate: 100 implemented; 2 neutralized-equivalent (`it_Pron`, `they_Pron`); all 102 execution-certification rows not_run |
| Extend | 140 | candidate: 137 implemented; 3 neutralized-equivalent; 0 partial; all 140 execution-certification rows not_run |
| Extra | 56 | candidate: 53 implemented; 3 neutralized-equivalent through shared slash strategy; all 56 not_run |
| Markup | 8 | 8 implemented; release-surface smoke added; all 8 not_run |
| Symbol | 13 | 13 implemented; public/release smoke added; all 13 not_run |
| Documentation | 31 | candidate: 31 implemented against supplied RGL archive; release smoke added; all 31 not_run |

## Remaining blockers before this pack can support a final parity claim

1. **RGL identity:** exact active RGL revision/search path for the protected 58/58 baseline is unresolved (`C9-DEC-001`).
2. **Documentation contract:** candidate targets the exact supplied RGL archive and implements `InflectionCl`; historical baseline Git identity is still a provenance question.
3. **Inherited Extend:** closed in the candidate: `SlashBareV2S` is locally owned and wired; exact-current compile remains pending.
4. **Public API:** Browse scope is closed as optional/out-of-core; Combinators/Try code and facade-only smokes are present, but GF-resolved export/collision execution evidence is still required.
5. **Linguistic evidence:** the evidence ledger currently routes broad phenomena; implementation decisions still require exact source locators/examples.
6. **Focused tests:** resource, facade-only API, and release-surface smokes are now added; several deeper semantic families (focus, existentials, RNP, VPS/VPI, voice interactions) still depend on cross-workstream contracts and require execution/review.
7. **Cross-workstream contracts:** clitic, voice, TAM, genitive/article and valency dependencies may block particular C9 rows until their core owners are stable.

## Audit conclusion

The v2 pack is suitable as the **governing anti-drift system for development**. It is intentionally not a certificate that Conversation 9 is complete. Its value is that the remaining incompleteness is now explicit, addressable by stable IDs, and connected to release gates.

## C9 finalization candidate delta

Implemented in source candidate `C9-FINAL-20260925`: `nga` government correction, local `SlashBareV2S`, no-stranding compatibility realization, Albanian `CombinatorsSqi.appCN/appCNc`, safe Try overloads, `DocumentationSqi.InflectionCl`, corrected proximal-demonstrative accusative plural cells, and Standard singular `ndonjë` for `someSg_Det`. Static validator: 144/144 PASS. No GF executable was available; all changed rows remain `not_run` until external GF 3.12/Wordbench certification.

## Candidate-wide certification reset

Because the source-lock changed and no exact-current GF 3.12 run was possible here, all 350 C9 parity rows are `not_run` on the execution-certification axis. Coverage classifications remain intact; the prior green baseline is historical evidence only.

## Common pronoun neutralization

The common API does not parameterize `it_Pron`/`they_Pron` by Albanian grammatical gender. The supplied Lesson 30 states that unspecified-gender pronouns default to the feminine form. The candidate therefore uses `ajo` for `it_Pron` and `ato` for `they_Pron`; this is recorded as a neutralized common-RGL equivalence (`E-C9-ALG-016`), not as a claim that Albanian has an English-like neuter pronoun.
