concrete IdiomSqi of Idiom = CatSqi ** open Prelude, ParamX, ResSqi, ClauseSqiRes in {
  oper
    defaultAgr : Agr = {gn=GSg Masc;p=P3} ;
    p1plAgr : Agr = {gn=GPl;p=P1} ;

    subjVP : VP -> Agr -> Str = \vp,a -> realizeSubjVP vp Pos a ;

    existWord : ParamX.Tense -> Anteriority -> Agr -> Str = \t,ant,a ->
      case ant of {
        Simul => case t of {
          ParamX.Pres => "ka" ; ParamX.Past => "pati" ;
          ParamX.Fut => "do të ketë" ; ParamX.Cond => "do të kishte"
        } ;
        Anter => haveAux!t!agrNumber a!a.p ++ "pasur"
      } ;

  lin
    ImpersCl vp = {s=\\t,a,p=>realizeVP vp t a p defaultAgr} ;
    GenericCl vp = {s=\\t,a,p=>"njeriu" ++ realizeVP vp t a p defaultAgr} ;

    CleftNP np rs = {
      s=\\_,_,_=>"është" ++ np.s!Nom ++ rs.s!np.a
    } ;
    CleftAdv adv s = {s=\\_,_,_=>"është" ++ adv.s ++ "që" ++ s.s} ;

    ExistNP np = {
      s=\\t,a,p=>negation p ++ existWord t a np.a ++ np.s!Acc
    } ;
    ExistIP ip = {
      s=\\t,a,p=>ip.s!Acc ++ negation p ++ existWord t a ip.a
    } ;
    ExistNPAdv np adv = {
      s=\\t,a,p=>(ExistNP np).s!t!a!p ++ adv.s
    } ;
    ExistIPAdv ip adv = {
      s=\\t,a,p=>(ExistIP ip).s!t!a!p ++ adv.s
    } ;

    ProgrVP vp = vp ** {cl=\\a=>"po" ++ vp.cl!a} ;

    ImpPl1 vp = {s="le" ++ subjVP vp p1plAgr} ;
    ImpP3 np vp = {s="le" ++ np.s!Nom ++ subjVP vp np.a} ;

    SelfAdvVP vp = vp ** {post=\\a=>vp.post!a ++ "vetë"} ;
    SelfAdVVP vp = vp ** {cl=\\a=>"vetë" ++ vp.cl!a} ;
    SelfNP np = np ** {s=\\c=>np.s!c ++ "vetë"} ;
}
