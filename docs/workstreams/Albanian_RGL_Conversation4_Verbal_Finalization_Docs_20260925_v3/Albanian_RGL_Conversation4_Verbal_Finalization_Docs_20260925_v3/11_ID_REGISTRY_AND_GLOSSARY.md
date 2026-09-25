# ID registry and glossary

**Status:** naming authority for this documentation pack.

## Stable ID namespaces

| Prefix | Meaning | Canonical owner |
|---|---|---|
| `VINV-*` | hard invariant | `00_MASTER_CONTRACT.md` |
| `DEBT-V-*` | current-source debt | `01_CURRENT_BASELINE_AND_DEBT.md` |
| `VE-*` | Albanian linguistic evidence | `03_LINGUISTIC_EVIDENCE.md` |
| `VR-*` | common-RGL realization strategy | `04_REALIZATION_STRATEGIES_AND_CONSTRAINTS.md` |
| `VX-*` | Albanian-specific realization/extension strategy | same |
| `VDEC-*` | accepted design decision | `06_DECISIONS_AND_OPEN_QUESTIONS.md` |
| `VQ-*` | open question | same |
| `VSL-*` | implementation migration slice | `07_IMPLEMENTATION_CHANGE_CONTROL.md` |
| `TEMP-V-*` | temporary compatibility adapter | same |
| `VT-*` | test | `08_TEST_TRACEABILITY_CERTIFICATION.md` |

IDs are stable. If a rule is superseded, keep the old ID in history and record its replacement rather than reusing it for a different meaning.

## Glossary

**MorphVoice** — morphological active/non-active state of the verbal paradigm.

**VoiceUse** — semantic/syntactic use such as plain, passive, reflexive or reciprocal; not identical to MorphVoice.

**Clause request/context** — structured request containing the temporal/mood/polarity/progressivity information needed to choose a realization strategy.

**Strategy** — one complete licensed construction that owns its finite head(s), particles, auxiliary and ordering. It is not a concatenation recipe.

**Common RGL tense** — abstract `TPres`, `TPast`, `TFut`, `TCond`; Albanian may have more distinctions internally or through extensions.

**Anteriority** — common RGL `ASimul` vs `AAnter`; in Albanian this often selects simple vs compound strategy families.

**Non-active** — Albanian morphological voice category described by the supplied references; it may realize passive/reflexive-like meanings but is not synonymous with either semantic label.

**Compile-safe placeholder** — implementation that compiles structurally but is explicitly not linguistic gold/certification.

**Green baseline** — regression anchor known by the project to pass its declared compilation/scenario gate; it is not proof of linguistic completeness.
