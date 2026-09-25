# Parallel-conversation ownership lock

## Why this exists

Ten Albanian-RGL conversations are being developed in parallel. A patch can be locally correct and still conflict with another subsystem. This document prevents silent cross-thread architectural drift.

## C8 ownership classes

| Class | Files/subsystems | Rule |
|---|---|---|
| `C8_PRIMARY` | `VerbSqi.gf`, `ConjunctionSqi.gf`, `ConstructionSqi.gf`, `IdiomSqi.gf` | C8 may change behavior after evidence + tests. |
| `SHARED_CONTRACT` | `CatSqi.gf`, `ResSqi.gf`, `ClauseSqiRes.gf`, `ParadigmsSqi.gf` | Any representation/signature change requires an explicit migration record and consumer audit. |
| `SHARED_EXTEND` | `ExtendSqi.gf`, `ExtendSqiVPS.gf`, `ExtendSqiVPBridge.gf`, `ExtendSqiScaffolding.gf`, related Extend companions | Change only the C8-owned behavior; preserve companion ownership boundaries. |
| `HANDOFF` | `DictSqi*`, `LexiconSqi.gf`, `StructuralSqi*` | C8 proposes/promotes entries only after core constructors are proven. |
| `OUT_OF_SCOPE_DEFAULT` | `MorphoSqi.gf`, noun/adjective morphology internals | Do not modify to solve a syntax/valence problem unless evidence proves morphology is the root cause. |
| `QUARANTINED_REFERENCE` | `development/draftmax/**` | Mine one demonstrated idea at a time; never overlay wholesale. |

## Collision protocol

Before editing a `SHARED_*` file:

1. identify the exact record field/type/function to change;
2. enumerate producers and consumers;
3. record whether another conversation has changed the same boundary;
4. if the other conversation ownership is unknown, mark `PARALLEL_OWNER_TBD` and avoid irreversible representation changes;
5. prefer an additive field/helper over destructive reinterpretation;
6. compile focused consumers before full validation;
7. update `18_TRACEABILITY_MATRIX.md`.

## Forbidden parallel-development behavior

- changing `Agr`, `VP`, `VPSlash`, `Compl`, `NP` or lexical category shape only because one local function is awkward;
- changing a shared field's meaning without changing all producers/consumers;
- importing DRAFT-MAX type changes as a block;
- solving a C8 failure by adding a placeholder in DictSqi;
- treating a concurrent patch as authoritative until it is merged into the same source lock.

## Missing input

The exact ownership map of Conversations 1-7 and 9-10 has not been supplied here. This document therefore deliberately does **not** invent those owners. Once supplied, add a table mapping each shared file/field to all conversation IDs before a shared representation migration.
