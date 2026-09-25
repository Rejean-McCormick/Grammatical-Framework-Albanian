# Wordbench Dict/Morpho integration fix — 2026-09-25

Based on run `20260925_001953`.

## Dict compile failure

`DictSqiAbs` had four legacy Lexicon suffixes misread as GF categories. The standard RGL `Lexicon` declares:

- `easy_A2V : A2`
- `probable_AS : A`
- `fun_AV : A`
- `rain_V0 : V`

The Dict function identifiers are preserved, but their GF declaration/linearization types are normalized accordingly. The dictionary remains 6720 functions. The generator is patched so rebuilds do not reintroduce the bug.

## Scenario load failure

The old smoke scripts tried to `i DictSqi.gf` / `i MorphoDictSqi.gf` directly. GF shell file import does not resolve those files from the Wordbench scenario working directory.

The replacement uses validation grammars that inherit the real dictionary modules. The MorphoDict validation grammar has a local GF path pragma pointing to the project `src/morphodict` directory.

No core Albanian grammar module is changed.
