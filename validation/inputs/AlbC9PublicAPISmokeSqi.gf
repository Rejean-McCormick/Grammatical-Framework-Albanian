--# -path=.:../../../AlbanianSQI/GF/lib/src:../../../AlbanianSQI/GF/lib/src/albanian:../../../AlbanianSQI/GF/lib/src/api:../../../AlbanianSQI/GF/lib/src/common:../../../AlbanianSQI/GF/lib/src/abstract:../../../AlbanianSQI/GF/lib/src/prelude

-- This smoke grammar intentionally exercises the public resources rather than
-- Albanian internal Res/Cat helpers.  It is a compile/type-check contract for
-- application authors, not a linguistic gold grammar.
concrete AlbC9PublicAPISmokeSqi of AlbC9PublicAPISmoke =
  open Prelude,
       (S = SyntaxSqi),
       (K = ConstructorsSqi),
       (C = CombinatorsSqi),
       (T = TrySqi),
       (Y = SymbolicSqi),
       (L = LexiconSqi) in {

  lincat Probe = {s : Str} ;

  lin
    API_SYNTAX_SENTENCE = {
      s = (S.mkUtt (S.mkCl S.i_NP L.sleep_V)).s
    } ;

    API_CONSTRUCTORS_SENTENCE = {
      s = (K.mkUtt (K.mkCl K.she_NP L.read_V2 (K.mkNP K.a_Det L.book_N))).s
    } ;

    API_COMBINATOR_POSSESSION = {
      s = (K.mkUtt (C.appCN (K.mkCN L.book_N) K.i_NP)).s
    } ;

    API_TRY_ADV = {
      s = (K.mkUtt (T.mkAdv "qartë")).s
    } ;

    API_TRY_ADN = {
      s = (K.mkUtt (K.mkCard (T.mkAdN "rreth") (K.mkCard "5"))).s
    } ;

    API_TRY_ORD = {
      s = (K.mkUtt (K.mkNP (K.mkDet K.the_Quant (T.mkOrd "i pari")) L.book_N)).s
    } ;

    API_SYMBOLIC_NP = {
      s = (K.mkUtt (Y.symb "x")).s
    } ;
}
