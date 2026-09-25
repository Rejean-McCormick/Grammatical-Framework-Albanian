concrete NounSqi of Noun = CatSqi ** open MorphoSqi, ResSqi, Prelude in {

  flags optimize = all_subs ;

  oper
    positiveA : Adj -> Case -> Gender -> Number -> Str = \a,c,g,n ->
      case a.clit of {
        True  => link_clitic ! Indef ! c ! g ! n ++ adjForm a c g n ;
        False => adjForm a c g n
      } ;

    nominalComplement : Compl -> Species -> Case -> Gender -> Number -> NP -> Str =
      \compl,sp,c,g,n,np -> case compl.kind of {
        OrdinaryCompl => compl.s ++ np.s ! compl.c ;
        GenitiveCompl => nyje ! sp ! c ! g ! n ++ np.s ! Gen
      } ;

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
        P1 => case a.gn of {
          GSg _ => case <g,n> of {
            <Masc,Sg> => possSg "im" "tim" "tim" c ;
            <Fem,Sg>  => possSg "ime" "time" "sime" c ;
            <Masc,Pl> => possPl "e mi" "të mi" c ;
            <Fem,Pl>  => possPl "e mia" "të mia" c
          } ;
          GPl _ => case <g,n> of {
            <Masc,Sg> => possSg "ynë" "tonë" "tonë" c ;
            <Fem,Sg>  => possSg "jonë" "tonë" "sonë" c ;
            <Masc,Pl> => possPl "tanë" "tanë" c ;
            <Fem,Pl>  => possPl "tona" "tona" c
          }
        } ;
        P2 => case a.gn of {
          GSg _ => case <g,n> of {
            <Masc,Sg> => possSg "yt" "tënd" "tënd" c ;
            <Fem,Sg>  => possSg "jote" "tënde" "sate" c ;
            <Masc,Pl> => possPl "e tu" "të tu" c ;
            <Fem,Pl>  => possPl "e tua" "të tua" c
          } ;
          GPl _ => case <g,n> of {
            <Masc,Sg> => possSg "juaj" "tuaj" "tuaj" c ;
            <Fem,Sg>  => possSg "juaj" "tuaj" "suaj" c ;
            <Masc,Pl> => possPl "tuaj" "tuaj" c ;
            <Fem,Pl>  => possPl "tuaja" "tuaja" c
          }
        } ;
        P3 => case a.gn of {
          GSg Masc => case <g,n> of {
            <Masc,Sg> => possSg "i tij" "e tij" "të tij" c ;
            <Fem,Sg>  => possSg "e tij" "e tij" "së tij" c ;
            <Masc,Pl> => possPl "e tij" "të tij" c ;
            <Fem,Pl>  => possPl "e tij" "të tij" c
          } ;
          GSg Fem => case <g,n> of {
            <Masc,Sg> => possSg "i saj" "e saj" "të saj" c ;
            <Fem,Sg>  => possSg "e saj" "e saj" "së saj" c ;
            <Masc,Pl> => possPl "e saj" "të saj" c ;
            <Fem,Pl>  => possPl "e saj" "të saj" c
          } ;
          GPl _ => case <g,n> of {
            <Masc,Sg> => possSg "i tyre" "e tyre" "të tyre" c ;
            <Fem,Sg>  => possSg "e tyre" "e tyre" "së tyre" c ;
            <Masc,Pl> => possPl "e tyre" "të tyre" c ;
            <Fem,Pl>  => possPl "e tyre" "të tyre" c
          }
        }
      } ;

  lin
    DetCN det cn = {
      s = \\c => case det.placement of {
        PreNominal => det.s ! c ! cn.g ++ nounForm cn det.spec c det.n ;
        PostNominal => nounForm cn det.spec c det.n ++ det.s ! c ! cn.g
      } ;
      a = agrgP3 cn.g det.n ; isPron = False
    } ;

    UsePN pn = {
      s = pn.s ;
      a = pn.a ; isPron = False
    } ;

    UsePron p = p ;

    PredetNP pred np = np ** {s = \\c => pred.s ++ np.s ! c} ;

    PPartNP np v2 = np ** {s = \\c => np.s ! c ++ v2.participle} ;

    AdvNP np adv = np ** {s = \\c => np.s ! c ++ adv.s} ;
    ExtAdvNP np adv = np ** {s = \\c => np.s ! c ++ SOFT_BIND ++ "," ++ adv.s} ;

    RelNP np rs = np ** {s = \\c => np.s ! c ++ rs.s ! np.a} ;

    DetNP det = {
      s = \\c => det.s ! c ! Masc ;
      a = agrgP3 Masc det.n ; isPron = False
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

    OrdDigits digits = {s = \\_,_,_ => "i" ++ digits.s} ;
    OrdNumeral numeral = {s = \\_,_,_ => "i" ++ numeral.s} ;
    OrdSuperl a = {s = \\c,g,n => "më" ++ positiveA a c g n} ;
    OrdNumeralSuperl numeral a = {
      s = \\c,g,n => "i" ++ numeral.s ++ "më" ++ positiveA a c g n
    } ;

    IndefArt = {s = \\_,_ => table {Sg => "një" ; Pl => []}; spec=Indef; placement=PreNominal} ;
    DefArt = {s = \\_,_,_ => []; spec=Def; placement=PreNominal} ;

    MassNP cn = {
      s=\\c=>nounForm cn Indef c Sg;
      a=agrgP3 cn.g Sg; isPron=False
    } ;

    PossPron p = {s=\\c,g,n=>possessiveForm p.a c g n; spec=Def; placement=PostNominal} ;

    UseN n = n ;
    UseN2 n = n ;

    ComplN2 n2 np = {
      s=\\sp,c,n=>nounForm n2 sp c n ++ nominalComplement n2.c2 sp c n2.g n np;
      g=n2.g
    } ;

    ComplN3 n3 np = {
      s=\\sp,c,n=>nounForm n3 sp c n ++ nominalComplement n3.c2 sp c n3.g n np;
      g=n3.g; c2=n3.c3
    } ;

    Use2N3 n3 = n3 ;
    Use3N3 n3 = n3 ** {c2=n3.c3} ;

    AdjCN ap cn = {
      s=\\sp,c,n=>nounForm cn sp c n ++ ap.s!sp!c!cn.g!n; g=cn.g
    } ;
    RelCN cn rs = {
      s=\\sp,c,n=>nounForm cn sp c n ++ rs.s!(agrgP3 cn.g n); g=cn.g
    } ;
    AdvCN cn adv = cn ** {s=\\sp,c,n=>nounForm cn sp c n ++ adv.s} ;
    SentCN cn sc = cn ** {s=\\sp,c,n=>nounForm cn sp c n ++ sc.s} ;
    ApposCN cn np = cn ** {s=\\sp,c,n=>nounForm cn sp c n ++ np.s!c} ;

    PossNP cn np = cn ** {
      s=\\sp,c,n=>nounForm cn sp c n ++ nyje ! sp ! c ! cn.g ! n ++ np.s!Gen
    } ;
    PartNP cn np = cn ** {s=\\sp,c,n=>nounForm cn sp c n ++ "prej" ++ np.s!Ablat} ;

    CountNP det np = {
      s=\\c=>det.s!c!Masc ++ "prej" ++ np.s!Ablat; a=agrgP3 Masc det.n; isPron=False
    } ;

    DetDAP det = {s=det.s; n=det.n} ;
    AdjDAP dap ap = {
      s=\\c,g=>dap.s!c!g ++ ap.s!Indef!c!g!dap.n; n=dap.n
    } ;

    QuantityNP decimal mu = {
      s=\\_=>case mu.isPre of {True=>mu.s++decimal.s; False=>decimal.s++mu.s}; a=agrgP3 Masc decimal.n; isPron=False
    } ;
}
