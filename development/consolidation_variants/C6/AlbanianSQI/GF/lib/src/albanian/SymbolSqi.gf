-- GF/lib/src/albanian/SymbolSqi.gf
concrete SymbolSqi of Symbol = CatSqi
  ** open Prelude, Predef, ParamX, ResSqi, ParadigmsSqi in {

  lincat
    Symb, [Symb] = SS ;

  oper
    agr3 : Number -> Gender -> Agr = \n,g ->
      { g = g ; n = n ; p = P3 } ;

    mkNP_NumCN : Str -> Number -> Gender -> (Case => Str) -> CatSqi.NP =
      \numStr,n,g,cnCase ->
        lin NP {
          s = \\c => numStr ++ cnCase ! c ;
          acc_clit = [] ; dat_clit = [] ;
          a = agr3 n g ; isPron = False
        } ;

    cnCaseIndef : CatSqi.CN -> Number -> (Case => Str) = \cn,n ->
      table {
        Nom   => cnForm cn Indef Nom n ;
        Acc   => cnForm cn Indef Acc n ;
        Gen   => cnForm cn Indef Gen n ;
        Dat   => cnForm cn Indef Dat n ;
        Ablat => cnForm cn Indef Ablat n
      } ;

    cnCaseWithDet : CatSqi.Det -> CatSqi.CN -> (Case => Str) = \det,cn ->
      table {
        Nom => case det.placement of {
          PreNominal => det.s ! Nom ! (cn.g ! det.n) ++ cnForm cn det.spec Nom det.n ;
          PostNominal => cnForm cn det.spec Nom det.n ++ det.s ! Nom ! (cn.g ! det.n)
        } ;
        Acc => case det.placement of {
          PreNominal => det.s ! Acc ! (cn.g ! det.n) ++ cnForm cn det.spec Acc det.n ;
          PostNominal => cnForm cn det.spec Acc det.n ++ det.s ! Acc ! (cn.g ! det.n)
        } ;
        Gen => case det.placement of {
          PreNominal => det.s ! Gen ! (cn.g ! det.n) ++ cnForm cn det.spec Gen det.n ;
          PostNominal => cnForm cn det.spec Gen det.n ++ det.s ! Gen ! (cn.g ! det.n)
        } ;
        Dat => case det.placement of {
          PreNominal => det.s ! Dat ! (cn.g ! det.n) ++ cnForm cn det.spec Dat det.n ;
          PostNominal => cnForm cn det.spec Dat det.n ++ det.s ! Dat ! (cn.g ! det.n)
        } ;
        Ablat => case det.placement of {
          PreNominal => det.s ! Ablat ! (cn.g ! det.n) ++ cnForm cn det.spec Ablat det.n ;
          PostNominal => cnForm cn det.spec Ablat det.n ++ det.s ! Ablat ! (cn.g ! det.n)
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
      mkNP_NumCN i.s Pl (n.g ! Pl) (cnCaseIndef n Pl) ;

    CNNumNP cn c =
      let
        n : CatSqi.CN = lin CN cn ;
      in
      mkNP_NumCN c.s Pl (n.g ! Pl) (cnCaseIndef n Pl) ;

    CNSymbNP det cn syms =
      let
        d : CatSqi.Det = lin Det det ;
        n : CatSqi.CN  = lin CN cn ;
      in
      lin NP {
        s = \\c => cnCaseWithDet d n ! c ++ syms.s ;
        acc_clit = [] ; dat_clit = [] ;
        a = agr3 d.n (n.g ! d.n) ; isPron = False
      } ;

} ;