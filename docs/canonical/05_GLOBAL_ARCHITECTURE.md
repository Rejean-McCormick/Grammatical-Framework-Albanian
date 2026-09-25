# Architecture globale cible

```text
linguistic evidence
      ↓
ResSqi — typed shared representation
      ↓
MorphoSqi / IrregSqi — inflection and productive rules
      ↓
ParadigmsSqi — public lexical constructor API
      ↓
LexiconSqi / DictSqi / MorphoDictSqi
      ↓
CatSqi carriers
      ↓
Noun / Verb / Adjective / Conjunction / ...
      ↓
central nominal + verbal + clause realization boundaries
      ↓
Sentence / Question / Relative / Construction / Extend / Extra
      ↓
LangSqi / AllSqi / public facades
      ↓
Wordbench + golds + certification
```

## Architecture principles

- **Typed until consumed.** Case, government, clitic role, agreement, voice, complement type and realization strategy remain structured.
- **One final realizer per ordering problem.** Finite verbal ordering is centralized; nominal nyje realization is centralized; clause assembly has one ordinary boundary.
- **Morphology selects/generates forms; syntax composes them.**
- **Valence wraps a morphologically correct head.** `V2/V3/VV/...` ne réparent pas un `V` défectueux.
- **Public API hides internal class IDs.** `mkN###/mkA###/mkV###` restent implementation detail.
- **Common API semantics are preserved.** Albanian-specific distinctions use internal typed state or `ExtraSqi`/`ExtendSqi`.
- **No parallel strings as hidden state.** Fields like legacy `cl/subjcl` are migration debt if they duplicate information that should be typed.
