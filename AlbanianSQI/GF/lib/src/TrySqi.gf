--# -path=.:api:albanian:common:abstract:prelude

resource TrySqi =
  SyntaxSqi,
  LexiconSqi,
  ParadigmsSqi - [
    mkAdv,
    mkAdN,
    mkCard,
    mkDet,
    mkIAdv,
    mkIDet,
    mkIP,
    mkOrd,
    mkPConj,
    mkQuant,
    mkVoc
  ] ;
