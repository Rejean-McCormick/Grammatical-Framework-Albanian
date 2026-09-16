-- GF/lib/src/albanian/NounSqi.gf

concrete NounSqi of Noun = CatSqi ** open MorphoSqi, ResSqi, Prelude in {

  flags optimize = all_subs ;

  lin
    DetCN det cn = {
      s = \\c => det.s ! c ! cn.g ++ cn.s ! det.spec ! c ! det.n ;
      a = agrgP3 cn.g det.n
      } ;

    UsePN pn = {
      s = \\c => pn.s ;
      a = agrgP3 Masc Sg
      } ;

    UsePron p = p ;

    PredetNP pred np = {
      s = \\c => pred.s ++ np.s ! c ;
      a = np.a
      } ;

    PPartNP np v2 = {
      s = \\c => np.s ! c ++ v2.participle ;
      a = np.a
      } ;

    AdvNP np adv = {
      s = \\c => np.s ! c ++ adv.s ;
      a = np.a
      } ;

    ExtAdvNP np adv = {
      s = \\c => np.s ! c ++ adv.s ;
      a = np.a
      } ;

    RelNP np rs = {
      s = \\c => np.s ! c ++ rs.s ;
      a = np.a
      } ;

    DetNP det = {
      s = \\c => det.s ! c ! Masc ;
      a = agrgP3 Masc det.n
      } ;

    DetQuant quant num = {
      s    = \\c,g => quant.s ! c ! g ! num.n ++ num.s ;
      n    = num.n ;
      spec = quant.spec
      } ;

    DetQuantOrd quant num ord = {
      s    = \\c,g => quant.s ! c ! g ! num.n ++ num.s ++ ord.s ;
      n    = num.n ;
      spec = quant.spec
      } ;

    NumSg = {s = [] ; n = Sg} ;
    NumPl = {s = [] ; n = Pl} ;

    NumCard card = {s = card.s ; n = card.n} ;

    NumDigits digits = {s = digits.s ; n = digits.n} ;
    NumDecimal decimal = {s = decimal.s ; n = decimal.n} ;
    NumNumeral numeral = {s = numeral.s ; n = Pl} ;

    AdNum adn card = {
      s = adn.s ++ card.s ;
      n = card.n
      } ;

    OrdDigits digits = {s = "i" ++ digits.s} ;
    OrdNumeral numeral = {s = "i" ++ numeral.s} ;
    OrdSuperl a = {s = "më" ++ positiveMascSg a} ;
    OrdNumeralSuperl numeral a = {
      s = "i" ++ numeral.s ++ "më" ++ positiveMascSg a
      } ;

    IndefArt = {
      s    = \\c,g => table {Sg => "një" ; Pl => []} ;
      spec = Indef
      } ;

    DefArt = {
      s    = \\c,g,n => [] ;
      spec = Def
      } ;

    MassNP cn = {
      s = \\c => cn.s ! Indef ! c ! Sg ;
      a = agrgP3 cn.g Sg
      } ;

    -- Compatibility implementation within the current Quant shape. Albanian
    -- possessives are normally postnominal; the present RGL category boundary
    -- does not encode determiner position, so this preserves the possessive
    -- paradigm and definiteness while remaining type-correct.
    PossPron p = {
      s = \\c,g,n => possessiveForm p.a g n ;
      spec = Def
      } ;

    UseN n  = n ;
    UseN2 n = n ;

    ComplN2 n2 np = {
      s = \\spec,c,n =>
            n2.s ! spec ! c ! n ++ n2.c2.s ++ np.s ! Acc ;
      g = n2.g
      } ;

    ComplN3 n3 np = {
      s = \\spec,c,n =>
            n3.s ! spec ! c ! n ++ n3.c2.s ++ np.s ! Acc ;
      g = n3.g ;
      c2 = n3.c3
      } ;

    Use2N3 n3 = n3 ;
    Use3N3 n3 = n3 ** {c2 = n3.c3} ;

    AdjCN ap cn = {
      s = \\spec,c,n => cn.s ! spec ! c ! n ++ ap.s ! spec ! c ! cn.g ! n ;
      g = cn.g
      } ;

    RelCN cn rs = {
      s = \\spec,c,n => cn.s ! spec ! c ! n ++ rs.s ;
      g = cn.g
      } ;

    AdvCN cn adv = {
      s = \\spec,c,n => cn.s ! spec ! c ! n ++ adv.s ;
      g = cn.g
      } ;

    SentCN cn sc = {
      s = \\spec,c,n => cn.s ! spec ! c ! n ++ sc.s ;
      g = cn.g
      } ;

    ApposCN cn np = {
      s = \\spec,c,n => cn.s ! spec ! c ! n ++ np.s ! c ;
      g = cn.g
      } ;

    PossNP cn np = {
      s = \\spec,c,n =>
            cn.s ! spec ! c ! n ++ genitiveLink cn.g n ++ np.s ! Dat ;
      g = cn.g
      } ;

    PartNP cn np = {
      s = \\spec,c,n =>
            cn.s ! spec ! c ! n ++ "prej" ++ np.s ! Ablat ;
      g = cn.g
      } ;

    CountNP det np = {
      s = \\c => det.s ! c ! Masc ++ "prej" ++ np.s ! Ablat ;
      a = agrgP3 Masc det.n
      } ;

    DetDAP det = {
      s = det.s ! Nom ! Masc
      } ;

    AdjDAP dap ap = {
      s = dap.s ++ ap.s ! Indef ! Nom ! Masc ! Sg
      } ;

    QuantityNP decimal mu = {
      s = \\c => case mu.isPre of {
                    True  => mu.s ++ decimal.s ;
                    False => decimal.s ++ mu.s
                  } ;
      a = agrgP3 Masc decimal.n
      } ;

  oper
    positiveMascSg : Adj -> Str = \a ->
      case a.clit of {
        True  => link_clitic ! Indef ! Nom ! Masc ! Sg ++ a.s ! Nom ! Masc ! Sg ;
        False => a.s ! Nom ! Masc ! Sg
      } ;

    genitiveLink : Gender -> Number -> Str = \g,n ->
      case n of {
        Pl => "e" ;
        Sg => case g of {
                Masc => "i" ;
                Fem  => "e"
              }
      } ;

    -- Surface-compatible possessive forms keyed by possessor agreement and
    -- possessed gender/number. Case distinctions are currently unavailable in
    -- the shallow Quant positioning model, so the same form is reused by case.
    possessiveForm : Agr -> Gender -> Number -> Str = \a,g,n ->
      case a.p of {
        P1 => case a.gn of {
                GSg _ => case <g,n> of {
                           <Masc,Sg> => "im" ;
                           <Fem,Sg>  => "ime" ;
                           <Masc,Pl> => "e mi" ;
                           <Fem,Pl>  => "e mia"
                         } ;
                GPl => case <g,n> of {
                         <Masc,Sg> => "ynë" ;
                         <Fem,Sg>  => "jonë" ;
                         <Masc,Pl> => "tanë" ;
                         <Fem,Pl>  => "tona"
                       }
              } ;
        P2 => case a.gn of {
                GSg _ => case <g,n> of {
                           <Masc,Sg> => "yt" ;
                           <Fem,Sg>  => "jote" ;
                           <Masc,Pl> => "e tu" ;
                           <Fem,Pl>  => "e tua"
                         } ;
                GPl => case <g,n> of {
                         <Masc,Sg> => "juaj" ;
                         <Fem,Sg>  => "juaj" ;
                         <Masc,Pl> => "tuaj" ;
                         <Fem,Pl>  => "tuaja"
                       }
              } ;
        P3 => case a.gn of {
                GSg Masc => case g of {Masc => "i tij" ; Fem => "e tij"} ;
                GSg Fem  => case g of {Masc => "i saj" ; Fem => "e saj"} ;
                GPl      => case g of {Masc => "i tyre" ; Fem => "e tyre"}
              }
      } ;

}
