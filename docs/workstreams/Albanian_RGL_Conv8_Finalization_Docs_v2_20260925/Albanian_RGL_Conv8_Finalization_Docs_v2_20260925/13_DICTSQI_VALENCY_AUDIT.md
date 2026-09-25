# DictSqi valency audit - quantitative baseline

## Current abstract category counts

Total functions parsed from `DictSqiAbs.gf`: **6720**.

| category | count |
| --- | --- |
| V | 2175 |
| V2 | 50 |
| V3 | 5 |
| VS | 4 |
| VQ | 2 |
| VV | 0 |
| VA | 1 |
| V2A | 1 |
| V2S | 1 |
| V2Q | 1 |
| V2V | 1 |

For context: `N=4310`, `A=110`, `Adv=19`.

## Placeholder pressure

Observed constructor-token occurrences in current `DictSqi.gf`:

| helper | occurrences including definition |
| --- | --- |
| invariantN | 4135 |
| invariantA | 65 |
| invariantV | 2142 |

The provenance ledger contains:

| validation_status | rows |
| --- | --- |
| imported_unreviewed | 6339 |
| baseline_lexicon_exact | 337 |
| reference_attested_unreviewed | 44 |

## Interpretation

The exit criterion is **not** to maximize non-`V` counts mechanically. It is to promote entries only when lexical evidence establishes valence. However, the current distribution is a strong signal that C8 must make rich categories practical: `VV` is currently absent and the high-valence families are represented by only a handful of functions.

## Promotion protocol

Each promotion row must record:

| field | requirement |
|---|---|
| `gf_id` | exact DictSqi function |
| `lemma/sense` | lexical identity being classified |
| `old_category` | usually `V` or provisional category |
| `new_category` | one of the justified valence categories |
| `c2/c3` | case/preposition where applicable |
| `embedding` | finite/question/subjunctive/verbal/adjectival strategy |
| `controller` | where VV/V2V/V2A requires one |
| `evidence_id` | Albanian lexical/grammar evidence |
| `constructor` | public `ParadigmsSqi` constructor; no low-level record unless justified |
| `test_id` | focused C8 case |
| `review_status` | REVIEW_REQUIRED/CERTIFIED |

## Safety rule

Do not convert imported unreviewed verbs from `V` to richer categories by WordNet-like semantic guess alone. Richer category = stronger grammatical claim.
