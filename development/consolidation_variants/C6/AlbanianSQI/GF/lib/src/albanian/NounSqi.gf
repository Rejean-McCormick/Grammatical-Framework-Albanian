concrete NounSqi of Noun = CatSqi ** open MorphoSqi, ResSqi, Prelude in {

  flags optimize = all_subs ;

  oper
    noAcc : Str = [] ;
    noDat : Str = [] ;

    positiveA : Adj -> Case -> Gender -> Number -> Str = \a,c,g,n ->
      realizeAdj a Indef c g n ;


    possSg : Str -> Str -> Str -> Case -> Str = \nom,acc,obl,c -> case c of {
      Nom => nom ; Acc => acc ; Gen => obl ; Dat => obl ; Ablat => obl
    } ;

    possPl : Str -> Str -> Case -> Str = \direct,obl,c -> case c of {
      Nom => direct ; Acc => direct ; Gen => obl ; Dat => obl ; Ablat => obl
    } ;

    -- Possessive morphology is selected from the possessor agreement and the
    -- possessed noun's case/gender/number.  Position is handled separately by
    -- Quant.placement so ordinary possessives remain post-nominal.
    possessiveForm : Agr -> Case -> Gender -> Number -> Str = \a,c,g,n ->
      case a.p of {
        P1 => case a.n of {
          Sg => case <g,n> of {
            <Masc,Sg> => possSg "im" "tim" "tim" c ;
            <Fem,Sg>  => possSg "mie" "time" "sime" c ;
            <Masc,Pl> => nyje ! Def ! c ! Masc ! Pl ++ "mi" ;
            <Fem,Pl>  => nyje ! Def ! c ! Fem ! Pl ++ "mia"
          } ;
          Pl => case <g,n> of {
            <Masc,Sg> => possSg "ynë" "tonë" "tonë" c ;
            <Fem,Sg>  => possSg "jonë" "tonë" "sonë" c ;
            <Masc,Pl> => possPl "tanë" "tanë" c ;
            <Fem,Pl>  => possPl "tona" "tona" c
          }
        } ;
        P2 => case a.n of {
          Sg => case <g,n> of {
            <Masc,Sg> => possSg "yt" "tët" "tët" c ;
            <Fem,Sg>  => possSg "jote" "tënde" "sate" c ;
            <Masc,Pl> => nyje ! Def ! c ! Masc ! Pl ++ "tu" ;
            <Fem,Pl>  => nyje ! Def ! c ! Fem ! Pl ++ "tua"
          } ;
          Pl => case <g,n> of {
            <Masc,Sg> => possSg "juaj" "tuaj" "tuaj" c ;
            <Fem,Sg>  => possSg "juaj" "tuaj" "suaj" c ;
            <Masc,Pl> => possPl "tuaj" "tuaj" c ;
            <Fem,Pl>  => possPl "tuaja" "tuaja" c
          }
        } ;
        P3 => case <a.n,a.g> of {
          <Sg,Masc> => nyje ! Def ! c ! g ! n ++ "tij" ;
          <Sg,Fem>  => nyje ! Def ! c ! g ! n ++ "saj" ;
          <Pl,_>    => nyje ! Def ! c ! g ! n ++ "tyre"
        }
      } ;

  lin
    DetCN det cn = {
      s = \\c => case det.placement of {
        PreNominal => det.s ! c ! (cn.g ! det.n) ++ cnForm cn det.spec c det.n ;
        PostNominal => cnForm cn det.spec c det.n ++ det.s ! c ! (cn.g ! det.n)
      } ;
      acc_clit = noAcc ; dat_clit = noDat ;
      a = agrgP3 (cn.g ! det.n) det.n ; isPron = False
    } ;

    UsePN pn = {
      s = pn.s ; acc_clit = noAcc ; dat_clit = noDat ;
      a = pn.a ; isPron = False
    } ;

    UsePron p = p ;

    PredetNP pred np = np ** {s = \\c => pred.s ++ np.s ! c} ;

    PPartNP np v2 = np ** {s = \\c => np.s ! c ++ v2.participle} ;

    AdvNP np adv = np ** {s = \\c => np.s ! c ++ adv.s} ;
    ExtAdvNP np adv = np ** {s = \\c => np.s ! c ++ SOFT_BIND ++ "," ++ adv.s} ;

    RelNP np rs = np ** {s = \\c => np.s ! c ++ rs.s ! np.a} ;

    DetNP det = {
      s = \\c => det.s ! c ! headlessNominalFallbackGender ; acc_clit=noAcc; dat_clit=noDat ;
      a = headlessNominalFallbackAgr det.n ; isPron = False
    } ;

    DetQuant quant num = {
      s = \\c,g => quant.s ! c ! g ! num.n ++ num.s ;
      n = num.n ; spec = quant.spec ; placement = quant.placement
    } ;

    DetQuantOrd quant num ord = {
      s = \\c,g => quant.s ! c ! g ! num.n ++ num.s ++ ord.s ! c ! g ! num.n ;
      n = num.n ; spec = quant.spec ; placement = quant.placement
    } ;

    NumSg = {s=[]; n=Sg} ;
    NumPl = {s=[]; n=Pl} ;
    NumCard card = {s=card.s; n=card.n} ;
    NumDigits digits = {s=digits.s; n=digits.n} ;
    NumDecimal decimal = {s=decimal.s; n=decimal.n} ;
    NumNumeral numeral = {s=numeral.s; n=Pl} ;
    AdNum adn card = {s=adn.s ++ card.s; n=card.n} ;

    -- Coverage fallbacks only.  The supplied systematic numeral/ordinal lesson
    -- is Geg, while the canonical target is Standard Albanian.  Keep these
    -- historical realizations visible but UN-CERTIFIED until Standard/Tosk
    -- evidence resolves ordinal morphology and superlative/nyje interaction.
    OrdDigits digits = {s = \\_,_,_ => "i" ++ digits.s} ;
    OrdNumeral numeral = {s = \\_,_,_ => "i" ++ numeral.s} ;
    OrdSuperl a = {s = \\c,g,n => "më" ++ positiveA a c g n} ;
    OrdNumeralSuperl numeral a = {
      s = \\c,g,n => "i" ++ numeral.s ++ "më" ++ positiveA a c g n
    } ;

    IndefArt = {s = \\_,_ => table {Sg => "një" ; Pl => []}; spec=Indef; placement=PreNominal} ;
    DefArt = {s = \\_,_,_ => []; spec=Def; placement=PreNominal} ;

    MassNP cn = {
      s=\\c=>cnForm cn Indef c Sg; acc_clit=noAcc; dat_clit=noDat;
      a=agrgP3 (cn.g ! Sg) Sg; isPron=False
    } ;

    PossPron p = {s=\\c,g,n=>possessiveForm p.a c g n; spec=Def; placement=PostNominal} ;

    UseN n = useNoun n ;
    UseN2 n = {
      s = \\sp,c,num => nounForm n sp c num ;
      g = n.g
    } ;

    ComplN2 n2 np = {
      s=\\sp,c,n=>nounForm n2 sp c n ++ n2.c2.s ++ np.s!n2.c2.c;
      g=n2.g
    } ;

    ComplN3 n3 np = {
      s=\\sp,c,n=>nounForm n3 sp c n ++ n3.c2.s ++ np.s!n3.c2.c;
      g=n3.g; c2=n3.c3
    } ;

    Use2N3 n3 = n3 ;
    Use3N3 n3 = n3 ** {c2=n3.c3} ;

    AdjCN ap cn = {
      s=\\sp,c,n=>cnForm cn sp c n ++ ap.s!sp!c!(cn.g ! n)!n; g=cn.g
    } ;
    RelCN cn rs = {
      s=\\sp,c,n=>cnForm cn sp c n ++ rs.s!(agrgP3 (cn.g ! n) n); g=cn.g
    } ;
    AdvCN cn adv = cn ** {s=\\sp,c,n=>cnForm cn sp c n ++ adv.s} ;
    SentCN cn sc = cn ** {s=\\sp,c,n=>cnForm cn sp c n ++ sc.s} ;
    ApposCN cn np = cn ** {s=\\sp,c,n=>cnForm cn sp c n ++ np.s!c} ;

    PossNP cn np = cn ** {
      s=\\sp,c,n=>cnForm cn sp c n ++ nyje ! sp ! c ! (cn.g ! n) ! n ++ np.s!Gen
    } ;
    PartNP cn np = cn ** {s=\\sp,c,n=>cnForm cn sp c n ++ "prej" ++ np.s!Ablat} ;

    CountNP det np = {
      s=\\c=>det.s!c!headlessNominalFallbackGender ++ "prej" ++ np.s!Ablat;
      acc_clit=noAcc; dat_clit=noDat; a=headlessNominalFallbackAgr det.n; isPron=False
    } ;

    DetDAP det = {s=det.s; n=det.n} ;
    AdjDAP dap ap = {
      s=\\c,g=>dap.s!c!g ++ ap.s!Indef!c!g!dap.n; n=dap.n
    } ;

    QuantityNP decimal mu = {
      s=\\_=>case mu.isPre of {True=>mu.s++decimal.s; False=>decimal.s++mu.s};
      acc_clit=noAcc; dat_clit=noDat; a=headlessNominalFallbackAgr decimal.n; isPron=False
    } ;
}
