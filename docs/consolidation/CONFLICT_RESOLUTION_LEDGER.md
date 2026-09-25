# Consolidated Albanian RGL — conflict-resolution ledger

Date: 2026-09-25

This ledger records the decisions used to consolidate C1/C2/C4/C5/C6/C7/C8/C9/C10 onto the current `20260925-153041` snapshot. It is deliberately conservative: useful incompatible implementations are preserved under `development/consolidation_variants/` instead of being silently discarded.

## Active ownership

- **C1** — morphology smart paradigms, exact irregular escape hatches, productive V morphology improvements.
- **C2** — MorphoDict payload, provenance, coverage and tooling.
- **C4** — TAM/voice metadata and marked/advanced verbal realizers.
- **C5** — typed clitic cluster, case/government, central finite realization base.
- **C6** — nominal representation, number-sensitive agreement, noun/adjective morphology.
- **C7** — clause test/evidence material retained; active clause contracts reconciled with C5/C8.
- **C8** — valency/complement carriers, slash gap payloads, construction/sentence/question/relative integration.
- **C9** — public API, Extend/Extra/Documentation integration.
- **C10** — certification/governance tooling and campaign assets.

## Resolved shared-contract conflicts

1. **Case vs surface noun case** — keep grammatical `Case = Nom|Acc|Gen|Dat|Ablat`; use `MorphCase = MNom|MAcc|MDat|MAblat`, with Gen syncretizing to MDat at the morphology boundary.
2. **Number-sensitive gender** — keep C6 `Noun.g : Number => Gender`; plural agreement retains gender.
3. **GenNum compatibility** — retain `GenNum = GSg Gender | GPl Gender` because C5/C7 relative/agreement APIs still consume it. This is a compatibility carrier, not the old gender-losing representation.
4. **Adjectives** — keep typed C6 gender×number adjective morphology; compatibility references that are merely substrings of `.clitics` are not treated as the old `.clit` adjective flag.
5. **Nyje** — central typed service remains canonical.
6. **Clitics** — C5 typed `CliticCluster` is canonical until final flattening; old weak-pronoun strings are not active authorities.
7. **Progressive** — `Progressivity` is canonical; a Bool compatibility field remains temporarily where required by existing APIs.
8. **Voice** — `MorphVoice` and `VoiceUse` remain distinct; `PassV2`/`ReflVP`/Extend bridge explicitly mark semantic voice use.
9. **Valency sentence complementizers** — preserve C8 `scomp` on `VS/V2S` through `CatSqi -> ParadigmsSqi -> VerbSqi`; do not hard-code `që` at the final consumer.
10. **Clause marked realizers** — preserve C4 aorist/optative/admirative/gerund/purpose/progressive realizers referenced by `ExtraSqi`; adapt them to the C5 typed clitic/TAM representation.
11. **Relative strategies** — ordinary invariant `që` remains available; declined `cili` is retained for overt governed/pied-piped paths. English-style preposition stranding is not made canonical.
12. **Required scenario baseline** — keep the historical 52 required scenarios unchanged. Workstream additions are consolidated as optional campaigns; 91 optional scenario names are registered/resolvable.
13. **C10 campaign state** — preserve C10 data, but do not pretend its isolated 79-scenario campaign manifests certify the 91-scenario consolidated tree. `refresh` correctly leaves maturity `pre-R0 evidence-backed` / `NOT_ESTABLISHED` until recertification.
14. **Conflicting implementations** — 196 files are preserved under `development/consolidation_variants/` for recovery/comparison.

## Compendium rule applied

When alternatives conflicted, the consolidation followed: exact current source/contracts -> producer/consumer requirements -> accepted Albanian architecture/evidence -> compiler/test evidence if available -> compatible model/pattern. Information was preserved until its final consumer, and no isolated overlay validator was allowed to force removal of capabilities owned by another workstream.
