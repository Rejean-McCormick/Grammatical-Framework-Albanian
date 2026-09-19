resource StructuralSqiVerbal =
  open Prelude, ParamX, ResSqi, CatSqi, (P=ParadigmsSqi), (I=IrregSqi) in {

oper
  invariantV : Str -> CatSqi.V = \x ->
    P.irregV x x x x x x x x x ;

  can8know_VV : CatSqi.VV =
    P.mkVV (P.irregV "di" "di" "di" "dimë" "dini" "dinë" "di" "dini" "ditur") ;

  -- mund and duhet are modal particles/impersonal modal predicates in
  -- Standard Albanian; keeping them invariant here lets ComplVV place the
  -- selected të-clause after them without pretending they inflect regularly.
  can_VV : CatSqi.VV = P.mkVV (invariantV "mund") ;
  must_VV : CatSqi.VV = P.mkVV (invariantV "duhet") ;
  want_VV : CatSqi.VV = P.mkVV (lin V I.dua_V) ;
  have_V2 : CatSqi.V2 = P.mkV2 (lin V I.kam_V) ;
}
