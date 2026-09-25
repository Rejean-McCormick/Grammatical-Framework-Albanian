--# -path=.:api:albanian:common:abstract:prelude

-- Interactive/public convenience surface.  Keep low-level/collision-prone
-- Albanian paradigms excluded, then reintroduce only safe string constructors
-- as overloads alongside the ordinary Syntax API.
resource TrySqi =
  SyntaxSqi - [mkAdN],
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
  ] **
  open (P = ParadigmsSqi) in {

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
} ;
