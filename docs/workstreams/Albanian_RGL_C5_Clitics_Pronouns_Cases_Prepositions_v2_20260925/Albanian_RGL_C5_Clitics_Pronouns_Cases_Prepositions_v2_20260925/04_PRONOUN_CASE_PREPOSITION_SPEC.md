---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 04 — Pronoms, cas, relatif et prépositions

## Cas

**SOURCE_FACT** — Nom, Acc, Dat, Gen, Abl; Gen/Dat morphologiquement identiques dans les paradigmes décrits, mais Gen est distingué syntaxiquement par le `nyje`.

La représentation exacte du syncrétisme est décidée par le spike `OQ-C5-CASE-001` de `10_OPEN_QUESTIONS.md`.

## Pronoms personnels forts attestés

| | Nom | Acc | Gen/Dat | Abl |
|---|---|---|---|---|
| 1sg | `unë` | `mua` | `mua` | `meje` |
| 1pl | `ne` | `ne` | `neve` | `nesh` |
| 2sg | `ti` | `ty` | `ty` | `teje` |
| 2pl | `ju` | `ju` | `juve` | `jush` |

La 3e personne emploie les formes distales `ai/ajo`.

## Distal / 3e personne

| Cas | Masc Sg | Masc Pl | Fem Sg | Fem Pl |
|---|---|---|---|---|
| Nom | `ai` | `ata` | `ajo` | `ato` |
| Acc | `atë` | `ata` | `atë` | `ato` |
| Gen/Dat | `atij` | `atyre` | `asaj` | `atyre` |
| Abl | `atij` | `atyre` | `asaj` | `atyre` |

## Proximal

| Cas | Masc Sg | Masc Pl | Fem Sg | Fem Pl |
|---|---|---|---|---|
| Nom | `ky` | `këta` | `kjo` | `këto` |
| Acc | `këtë` | `këta` | `këtë` | `këto` |
| Gen/Dat | `këtij` | `këtyre` | `kësaj` | `këtyre` |
| Abl | `këtij` | `këtyre` | `kësaj` | `këtyre` |

## Relatif `cili`

| Cas | Masc Sg | Masc Pl | Fem Sg | Fem Pl |
|---|---|---|---|---|
| Nom | `i cili` | `të cilët` | `e cila` | `të cilat` |
| Acc | `të cilin` | `të cilët` | `të cilën` | `të cilat` |
| Gen/Dat | `të cilit` | `të cilëve` | `së cilës` | `të cilave` |
| Abl | `të cilit` | `të cilëve` | `së cilës` | `të cilave` |

La référence précise que les formes génitives nécessitent un `nyje` additionnel; le design final doit représenter ce fait sans confondre génitif et datif.

## Interrogatifs

La référence fournie établit au minimum l'opposition `kush` (sujet) / `kë` après `me`. Le code courant contient davantage de formes; celles-ci restent à certifier cellule par cellule avant de devenir gold.

## Gouvernement prépositionnel source-attesté minimum

| Cas gouverné | Prépositions explicitement données |
|---|---|
| Acc | `në`, `me`, `pa`, `për`, `mbi`, `nën` |
| Nom | `nga`, `tek` |
| Abl | `prej`, `brenda`, `gjatë`, `para`, `midis`, `sipas` |

**C5-REQ-016** — ces 14 entrées forment le noyau minimum obligatoire de tests de gouvernement. Les autres `Structural.*_Prep` doivent être classées séparément comme `SOURCE_ATTESTED`, `SEMANTIC_MAPPING_REVIEW`, ou `UNASSESSED`.

## Possession

`PossNP` et `PartNP` sont préférables comme chemins RGL modernes pour la syntaxe nominale; `possess_Prep`/`part_Prep` doivent rester cohérents pour compatibilité sans devenir une seconde grammaire du génitif.
