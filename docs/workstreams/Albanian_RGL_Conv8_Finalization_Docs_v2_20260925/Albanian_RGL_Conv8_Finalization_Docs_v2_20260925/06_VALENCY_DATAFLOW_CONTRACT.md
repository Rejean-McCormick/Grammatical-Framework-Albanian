# Valency dataflow contract

## Observed current representations

```gf
V, VA, VV, VS, VQ = Verb
V2 = Verb ** {c2 : Compl}
V2S, V2Q, V3, V2A, V2V = Verb ** {c2,c3 : Compl}
Compl = {s : Str ; c : Case}
```

`NP` currently carries case forms, accusative/dative clitics, agreement and `isPron`. `VP` carries finite/subjunctive/imperative/participle morphology plus `cl`, `subjcl` and agreement-indexed `post`; `VPSlash` adds the unsaturated complement `c2`.

## Required producer -> carrier -> consumer chains

| Information | Producer | Carrier | Final consumer | Invariant |
|---|---|---|---|---|
| object case/preposition | `ParadigmsSqi.mkV2*`, lexical entry | `V2.c2`, then `VPSlash.c2` | `ComplSlash` / `saturateSlash` | case is not flattened before NP realization |
| second/third argument government | `mkV3`, `mkV2*` | `c2`, `c3` | `Slash2V3`, `Slash3V3`, V2X slash functions | slot identity must not swap silently |
| NP clitic form | pronoun/NP constructor | `NP.acc_clit/dat_clit/isPron/a` | slash saturation | clitic choice is driven by object + governed case |
| embedded subjunctive marker | VP construction | `VP.subjcl` | `vpiStr` / `realizeSubjVP` | no caller should recreate clitic contraction ad hoc |
| embedded predicate agreement | controller analysis | explicit controller metadata or correct argument | `ComplVA` / `SlashV2A` | never default to matrix subject merely because only subject `Agr` is available |
| finite declarative complementizer | lexical/construction policy | **target metadata TBD** | `ComplVS` / `SlashV2S` | current hard-coded `që` is not automatically universal |
| V2V controller | lexical valence | **target metadata TBD** | `SlashV2V`, `SlashV2VNP`, VPI realization | subject-control vs object-control must be explicit when Albanian distinguishes them |

## Current proven implementation facts

- `ComplVV` realizes the embedded VP through its `subjcl + subjunctive + post` path.
- `ComplVS` currently hard-codes `që`.
- `SlashV2S` currently combines `c3.s + që + S`.
- `SlashV2A` currently selects AP agreement from the `Agr` passed to the matrix VP, exposing the known secondary-predicate controller risk.
- `SlashV2V` and `SlashV2VNP` preserve `c2/c3`, but no explicit lexical controller field exists in the current category representation.

## Migration rule

Do not add a new field until all four are named:

```text
semantic meaning -> producer -> every carrier -> final consumer
```

A field with no final consumer is rejected. A consumer that reconstructs information discarded earlier is a design defect.
