concrete NounSqi of Noun = CatSqi ** open MorphoSqi, ResSqi, Prelude in {

  flags optimize = all_subs ;

  oper
    noAcc : Str = [] ;
    noDat : Str = [] ;

    positiveA : Adj -> Case -> Gender -> Number -> Str = \a,c,g,n ->
      case a.clit of {
        True  => link_clitic ! Indef ! c ! g ! n ++ a.s ! c ! g ! n ;
        False => a.s ! c ! g ! n
      } ;

    genitiveLink : Gender -> Number -> Str = \g,n -> case n of {
      Pl => "e" ;
      Sg => case g of {Masc => "i" ; Fem => "e"}
    } ;

    possessiveForm : Agr -> Gender -> Number -> Str = \a,g,n ->
      case a.p of {
        P1 => case a.gn of {
          GSg _ => case <g,n> of {
            <Masc,Sg> => "im" ; <Fem,Sg> => "ime" ;
            <Masc,Pl> => "e mi" ; <Fem,Pl> => "e mia"
          } ;
          GPl => case <g,n> of {
            <Masc,Sg> => "ynë" ; <Fem,Sg> => "jonë" ;
            <Masc,Pl> => "tanë" ; <Fem,Pl> => "tona"
          }
        } ;
        P2 => case a.gn of {
          GSg _ => case <g,n> of {
            <Masc,Sg> => "yt" ; <Fem,Sg> => "jote" ;
            <Masc,Pl> => "e tu" ; <Fem,Pl> => "e tua"
          } ;
          GPl => case <g,n> of {
            <Masc,Sg> => "juaj" ; <Fem,Sg> => "juaj" ;
            <Masc,Pl> => "tuaj" ; <Fem,Pl> => "tuaja"
          }
        } ;
        P3 => case a.gn of {
          GSg Masc => case g of {Masc => "i tij" ; Fem => "e tij"} ;
          GSg Fem  => case g of {Masc => "i saj" ; Fem => "e saj"} ;
          GPl      => case g of {Masc => "i tyre" ; Fem => "e tyre"}
        }
      } ;

  lin
    DetCN det cn = {
      s = \\c => det.s ! c ! cn.g ++ cn.s ! det.spec ! c ! det.n ;
      acc_clit = noAcc ; dat_clit = noDat ;
      a = agrgP3 cn.g det.n ; isPron = False
    } ;

    UsePN pn = {
      s = \\_ => pn.s ; acc_clit = noAcc ; dat_clit = noDat ;
      a = agrgP3 Masc Sg ; isPron = False
    } ;

    UsePron p = p ;

    PredetNP pred np = np ** {s = \\c => pred.s ++ np.s ! c} ;

    PPartNP np v2 = np ** {s = \\c => np.s ! c ++ v2.participle} ;

    AdvNP np adv = np ** {s = \\c => np.s ! c ++ adv.s} ;
    ExtAdvNP np adv = np ** {s = \\c => np.s ! c ++ SOFT_BIND ++ "," ++ adv.s} ;

    RelNP np rs = np ** {s = \\c => np.s ! c ++ rs.s ! np.a} ;

    DetNP det = {
      s = \\c => det.s ! c ! Masc ; acc_clit=noAcc; dat_clit=noDat ;
      a = agrgP3 Masc det.n ; isPron = False
    } ;

    DetQuant quant num = {
      s = \\c,g => quant.s ! c ! g ! num.n ++ num.s ;
      n = num.n ; spec = quant.spec
    } ;

    DetQuantOrd quant num ord = {
      s = \\c,g => quant.s ! c ! g ! num.n ++ num.s ++ ord.s ! c ! g ! num.n ;
      n = num.n ; spec = quant.spec
    } ;

    NumSg = {s=[]; n=Sg} ;
    NumPl = {s=[]; n=Pl} ;
    NumCard card = {s=card.s; n=card.n} ;
    NumDigits digits = {s=digits.s; n=digits.n} ;
    NumDecimal decimal = {s=decimal.s; n=decimal.n} ;
    NumNumeral numeral = {s=numeral.s; n=Pl} ;
    AdNum adn card = {s=adn.s ++ card.s; n=card.n} ;

    OrdDigits digits = {s = \\_,_,_ => "i" ++ digits.s} ;
    OrdNumeral numeral = {s = \\_,_,_ => "i" ++ numeral.s} ;
    OrdSuperl a = {s = \\c,g,n => "më" ++ positiveA a c g n} ;
    OrdNumeralSuperl numeral a = {
      s = \\c,g,n => "i" ++ numeral.s ++ "më" ++ positiveA a c g n
    } ;

    IndefArt = {s = \\_,_ => table {Sg => "një" ; Pl => []}; spec=Indef} ;
    DefArt = {s = \\_,_,_ => []; spec=Def} ;

    MassNP cn = {
      s=\\c=>cn.s!Indef!c!Sg; acc_clit=noAcc; dat_clit=noDat;
      a=agrgP3 cn.g Sg; isPron=False
    } ;

    PossPron p = {s=\\_,g,n=>possessiveForm p.a g n; spec=Def} ;

    UseN n = n ;
    UseN2 n = n ;

    ComplN2 n2 np = {
      s=\\sp,c,n=>n2.s!sp!c!n ++ n2.c2.s ++ np.s!n2.c2.c;
      g=n2.g
    } ;

    ComplN3 n3 np = {
      s=\\sp,c,n=>n3.s!sp!c!n ++ n3.c2.s ++ np.s!n3.c2.c;
      g=n3.g; c2=n3.c3
    } ;

    Use2N3 n3 = n3 ;
    Use3N3 n3 = n3 ** {c2=n3.c3} ;

    AdjCN ap cn = {
      s=\\sp,c,n=>cn.s!sp!c!n ++ ap.s!sp!c!cn.g!n; g=cn.g
    } ;
    RelCN cn rs = {
      s=\\sp,c,n=>cn.s!sp!c!n ++ rs.s!(agrgP3 cn.g n); g=cn.g
    } ;
    AdvCN cn adv = cn ** {s=\\sp,c,n=>cn.s!sp!c!n ++ adv.s} ;
    SentCN cn sc = cn ** {s=\\sp,c,n=>cn.s!sp!c!n ++ sc.s} ;
    ApposCN cn np = cn ** {s=\\sp,c,n=>cn.s!sp!c!n ++ np.s!c} ;

    PossNP cn np = cn ** {
      s=\\sp,c,n=>cn.s!sp!c!n ++ genitiveLink cn.g n ++ np.s!Dat
    } ;
    PartNP cn np = cn ** {s=\\sp,c,n=>cn.s!sp!c!n ++ "prej" ++ np.s!Ablat} ;

    CountNP det np = {
      s=\\c=>det.s!c!Masc ++ "prej" ++ np.s!Ablat;
      acc_clit=noAcc; dat_clit=noDat; a=agrgP3 Masc det.n; isPron=False
    } ;

    DetDAP det = {s=det.s; n=det.n} ;
    AdjDAP dap ap = {
      s=\\c,g=>dap.s!c!g ++ ap.s!Indef!c!g!dap.n; n=dap.n
    } ;

    QuantityNP decimal mu = {
      s=\\_=>case mu.isPre of {True=>mu.s++decimal.s; False=>decimal.s++mu.s};
      acc_clit=noAcc; dat_clit=noDat; a=agrgP3 Masc decimal.n; isPron=False
    } ;
}
