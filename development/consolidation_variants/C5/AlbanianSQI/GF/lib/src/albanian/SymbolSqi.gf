-- GF/lib/src/albanian/SymbolSqi.gf
concrete SymbolSqi of Symbol = CatSqi
  ** open Prelude, Predef, ParamX, ResSqi, ParadigmsSqi in {

  lincat
    Symb, [Symb] = SS ;

  oper
    agr3 : Number -> Gender -> Agr = \n,g ->
      { gn = case n of {Sg => GSg g ; Pl => GPl g} ; p = P3 } ;

    mkNP_NumCN : Str -> Number -> Gender -> (Case => Str) -> CatSqi.NP =
      \numStr,n,g,cnCase ->
        lin NP {
          s = \\c => numStr ++ cnCase ! c ;
          a = agr3 n g ; isPron = False
        } ;

    cnCaseIndef : CatSqi.CN -> Number -> (Case => Str) = \cn,n ->
      table {
        Nom   => nounForm cn Indef Nom n ;
        Acc   => nounForm cn Indef Acc n ;
        Gen   => nounForm cn Indef Gen n ;
        Dat   => nounForm cn Indef Dat n ;
        Ablat => nounForm cn Indef Ablat n
      } ;

    cnCaseWithDet : CatSqi.Det -> CatSqi.CN -> (Case => Str) = \det,cn ->
      table {
        Nom => case det.placement of {
          PreNominal => det.s ! Nom ! cn.g ++ nounForm cn det.spec Nom det.n ;
          PostNominal => nounForm cn det.spec Nom det.n ++ det.s ! Nom ! cn.g
        } ;
        Acc => case det.placement of {
          PreNominal => det.s ! Acc ! cn.g ++ nounForm cn det.spec Acc det.n ;
          PostNominal => nounForm cn det.spec Acc det.n ++ det.s ! Acc ! cn.g
        } ;
        Gen => case det.placement of {
          PreNominal => det.s ! Gen ! cn.g ++ nounForm cn det.spec Gen det.n ;
          PostNominal => nounForm cn det.spec Gen det.n ++ det.s ! Gen ! cn.g
        } ;
        Dat => case det.placement of {
          PreNominal => det.s ! Dat ! cn.g ++ nounForm cn det.spec Dat det.n ;
          PostNominal => nounForm cn det.spec Dat det.n ++ det.s ! Dat ! cn.g
        } ;
        Ablat => case det.placement of {
          PreNominal => det.s ! Ablat ! cn.g ++ nounForm cn det.spec Ablat det.n ;
          PostNominal => nounForm cn det.spec Ablat det.n ++ det.s ! Ablat ! cn.g
        }
      } ;

  lin
    MkSymb s = s ;

    BaseSymb = infixSS "dhe" ;
    ConsSymb = infixSS "," ;

    SymbPN symb = mkPN symb.s ;

    IntPN i = mkPN i.s ;
    FloatPN f = mkPN f.s ;
    NumPN c = mkPN c.s ;

    SymbNum symb = mkCard symb.s ;

    SymbOrd symb =
      lin Ord {s = \\_,_,_ => symb.s} ;

    SymbS symb = symb ;

    CNIntNP cn i =
      let
        n : CatSqi.CN = lin CN cn ;
      in
      mkNP_NumCN i.s Pl n.g (cnCaseIndef n Pl) ;

    CNNumNP cn c =
      let
        n : CatSqi.CN = lin CN cn ;
      in
      mkNP_NumCN c.s Pl n.g (cnCaseIndef n Pl) ;

    CNSymbNP det cn syms =
      let
        d : CatSqi.Det = lin Det det ;
        n : CatSqi.CN  = lin CN cn ;
      in
      lin NP {
        s = \\c => cnCaseWithDet d n ! c ++ syms.s ;
        a = agr3 d.n n.g ; isPron = False
      } ;

} ;