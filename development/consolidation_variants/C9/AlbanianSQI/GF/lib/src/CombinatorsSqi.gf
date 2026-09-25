--# -path=.:api:albanian:common:abstract:prelude

-- Albanian specialization of the generic Combinators possession helpers.
-- The generic fallback realizes appCN/appCNc through possess_Prep, which cannot
-- carry the Albanian linking-article behavior owned by NounSqi.PossNP.
resource CombinatorsSqi = Combinators - [appCN, appCNc] with
  (Cat = CatSqi),
  (Structural = StructuralSqi),
  (Noun = NounSqi),
  (Constructors = ConstructorsSqi) ** {

  oper
    appCN : CN -> NP -> NP = \cn,x ->
      mkNP the_Art (PossNP cn x) ;

    appCNc : CN -> [NP] -> NP = \cn,xs ->
      let np : NP = mkNP and_Conj xs
      in mkNP the_Art (PossNP cn np) ;
} ;
