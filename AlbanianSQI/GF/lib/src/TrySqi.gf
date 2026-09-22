--# -path=.:api:albanian:common:abstract:prelude

resource TrySqi =
  SyntaxSqi-[mkAdN],
  LexiconSqi,
  ParadigmsSqi - [mkAdv,mkAdN,mkOrd,mkQuant,mkVoc]
  ** open (P = ParadigmsSqi) in {

oper
  mkAdv = overload SyntaxSqi {
    mkAdv : Str -> Adv = P.mkAdv ;
  } ;

  mkAdN = overload {
    mkAdN : CAdv -> AdN = SyntaxSqi.mkAdN ;
    mkAdN : Str -> AdN = P.mkAdN ;
  } ;

  mkOrd = overload SyntaxSqi {
    mkOrd : Str -> Ord = P.mkOrd ;
  } ;

}
