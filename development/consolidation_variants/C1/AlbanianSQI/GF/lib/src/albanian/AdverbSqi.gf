-- FILE: AdverbSqi.gf
concrete AdverbSqi of Adverb = CatSqi ** open ResSqi, Prelude in {

  oper
    -- Adverbial default from adjective: use basic Nom/Masc/Sg form,
    -- include linking clitic if needed.
    aBase : Adj -> Str = \a ->
      case adjNeedsNyje a of {
        True  => nyje ! Indef ! Nom ! Masc ! Sg ++ a.s ! Nom ! Masc ! Sg ;
        False => a.s ! Nom ! Masc ! Sg
      } ;

    thanSep : Str = "se" ;


  lin
    PositAdAAdj a = {s = aBase a} ;
    PositAdvAdj a = {s = aBase a} ;

    AdAdv ada adv = {s = ada.s ++ adv.s} ;
    AdnCAdv cadv  = {s = cadv.s} ;

    ComparAdvAdj cadv a np =
      {s = cadv.s ++ aBase a ++ thanSep ++ np.s ! Nom} ;

    ComparAdvAdjS cadv a s =
      {s = cadv.s ++ aBase a ++ thanSep ++ s.s} ;

    PrepNP p np = {s = p.s ++ np.s ! p.c} ;

    SubjS subj s = {s = subj.s ++ s.s} ;
}