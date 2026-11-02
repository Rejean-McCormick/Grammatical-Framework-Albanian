# Albanian Resource Grammar Library (Sqi)

**An Albanian implementation of the [Grammatical Framework](https://www.grammaticalframework.org/) Resource Grammar Library (RGL).**

This repository develops Albanian inflection, sentence grammar, lexical resources, and the public RGL interfaces used to build multilingual GF applications. The implementation is designed around Albanian grammatical evidence rather than a word-for-word adaptation of another language's grammar.

> **Latest verified local checkpoint — 2 November 2026:** **58/58 GF targets compile** under **GF 3.12** in Wordbench **1.4.0** Strict Diagnostic mode; **51/52 required scenarios pass**. The one remaining scenario, `alb-clitic-vp` / **C0369**, requests future progressive generation that is deliberately unsupported by the current grammar contract. **Overall Wordbench status: `FAIL`**, because that required scenario remains open. These figures describe a source-locked **local working-tree run**, not an independently verified build of GitHub `main`. Linguistic certification and an R4 release claim have **not** been established.

## What has been built

- **Albanian morphology:** productive nominal, adjectival, and verbal paradigms, with explicitly handled irregular and non-active forms.
- **Compositional syntax:** noun phrases, clauses, tense/aspect/voice, questions, relatives, complementation, coordination, and RGL `Extend`/`Extra` surfaces.
- **Typed grammatical representation:** case and agreement, valency, complement government, clitic slots, and realization decisions are retained as structured information until their realization boundary.
- **Lexical resources:** `LexiconSqi`, `DictSqi`, and `MorphoDictSqi`, with a project emphasis on provenance and testable inflection tables.
- **Public GF interfaces:** language grammar and API facades, including `SyntaxSqi`, `ConstructorsSqi`, `CombinatorsSqi`, `TrySqi`, and `SymbolicSqi`.
- **Evidence-based validation:** source-lock hashes, GF compile census, strict diagnostics, required and optional scenario campaigns, and documented linguistic constraints.

## Validation snapshot

| Evidence | Latest verified local result |
| --- | --- |
| GF compiler | **3.12** |
| Diagnostic runner | **GF Wordbench 1.4.0**, Strict |
| GF target census | **58/58 passed** (51 language + 5 API + 2 MorphoDict) |
| Required scenarios | **51 passed / 52 executed** |
| Compile failures or timeouts | **0** |
| Structural `lock_*` warnings | **0** |
| Other compiler warnings | **2,786** (including namespace warnings; not all resolved) |
| Remaining required scenario | **`alb-clitic-vp` / C0369**, future progressive |
| Overall run status | **FAIL** (one outstanding required scenario) |
| Linguistic / release certification | **Not established** |

The archived Wordbench run is `20261102_014442` (UTC), with source-lock SHA-256 `3da642c0f6198105a7564ce7b195d3e52e5d0ce1b9bc83d69761df50b5719ed8`. Its full source snapshot and artifacts are needed to reproduce the precise result. The GitHub branch may differ: **do not treat these counts as a CI badge or a certification of the current remote commit**.

## Known boundary: future progressive

The current realizer deliberately returns `nonExist` for unsupported progressive combinations, including future constructions of the form `do të po ...`. Scenario **C0369** presently expects a non-empty output and therefore fails. The project has elected to **defer implementation** rather than invent a form solely to make the test green. A future, evidence-backed treatment of the periphrastic `jam + duke + participle` construction remains possible; it is **not implemented or certified by this checkpoint**.

See [`validation/verbal_advanced/NEGATIVE_CONSTRAINTS.md`](validation/verbal_advanced/NEGATIVE_CONSTRAINTS.md) and the [Known Limitations](https://github.com/Rejean-McCormick/Grammatical-Framework-Albanian/wiki/Known-Limitations) wiki page.

## Repository map

| Path | Purpose |
| --- | --- |
| [`AlbanianSQI/GF/lib/src/albanian/`](AlbanianSQI/GF/lib/src/albanian/) | Main Albanian RGL GF modules |
| [`AlbanianSQI/GF/lib/src/morphodict/`](AlbanianSQI/GF/lib/src/morphodict/) | Morphological dictionary GF modules |
| [`resources/`](resources/) | Lexical and morphological source materials and provenance |
| [`validation/`](validation/) | Scenarios, test inputs, gold data, and negative constraints |
| [`docs/canonical/`](docs/canonical/) | Authoritative architecture, contracts, evidence, and release rules |
| [`development/`](development/) | Development and consolidation materials |
| [`project.toml`](project.toml) | Wordbench project profile: 52 required + 90 optional scenarios |

## Development and validation

**Requirements:** GF **3.12**, an appropriate [GF RGL](https://github.com/GrammaticalFramework/gf-rgl) checkout, and GF Wordbench **1.4.0** for the recorded diagnostic workflow. Configure the repository and RGL source paths for your own installation; local Windows paths in historic reports are not portable commands.

The source-locked workflow is:

1. Confirm compiler version, RGL checkout, source hashes, and module search-path order.
2. Compile the smallest affected GF modules and API consumers, retaining full diagnostic logs.
3. Run targeted linguistic scenarios and inspect actual linearizations and full inflection tables.
4. Run the **complete 58-target Strict Diagnostic** and **52 required scenarios** before accepting a new checkpoint.
5. Preserve the `summary.md`, `raw/`, source-lock metadata, and relevant compiler artifacts as evidence. Compilation success alone does **not** certify linguistic correctness.

**Important search-path note:** The verified local scenario run excluded a competing `gf-rgl/src/albanian` directory that contained different Albanian `.gfo` artifacts. Mixing those with the repository's modules previously caused API resolution errors such as `constant not found: youPol_Pron`. Keep a single coherent Albanian source/artifact path when reproducing the run.

## Documentation

- **[GitHub Wiki](https://github.com/Rejean-McCormick/Grammatical-Framework-Albanian/wiki)** — getting started, architecture, morphology, syntax, testing, project history, and limitations.
- **[Canonical documentation — start here](docs/canonical/00_START_HERE.md)** — project source of truth and document routing.
- **[Architecture](docs/canonical/05_GLOBAL_ARCHITECTURE.md)** and **[feature model](docs/canonical/06_ALBANIAN_GRAMMATICAL_FEATURE_MODEL.md)**.
- **[Testing and release levels](docs/canonical/17_TESTING_CERTIFICATION_AND_RELEASE_LEVELS.md)** — structural, behavioral, and linguistic evidence are distinct.
- **[Public API and parity](docs/canonical/15_PUBLIC_API_AND_ENGLISH_PARITY.md)** — common RGL contracts and intended scope.

## Project status and contributions

The R09 repair campaign has reached a **stable compilation checkpoint**, not an assertion that all Albanian grammar or every optional test is complete. Further development is intentionally paused at the documented future-progressive boundary while the source tree, tests, and documentation are stabilized.

Contributions should cite Albanian evidence, preserve GF API contracts, avoid unsubstantiated forms, and include targeted plus regression tests. For changes to common grammatical machinery (clitics, voice, case, TAM, complement realization), consult the canonical documentation before modifying sources.

The repository's governing documentation distinguishes **structural validation**, **behavioral validation**, and **independently reviewed linguistic certification**. Only the first two have the checkpoint results stated above; **no blanket linguistic certification or R4 release designation is claimed**.
