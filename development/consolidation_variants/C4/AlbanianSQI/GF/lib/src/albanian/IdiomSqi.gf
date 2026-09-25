concrete IdiomSqi of Idiom = CatSqi ** open Prelude, ParamX, ResSqi, ClauseSqiRes, (I=IrregSqi) in {
  oper
    defaultAgr : Agr = {gn=GSg Masc;p=P3} ;
    p1plAgr : Agr = {gn=GPl;p=P1} ;

    subjVP : VP -> Agr -> Str = \vp,a -> realizeSubjVP vp Pos a ;
    cleftCop : VP = emptyVP (lin Verb I.jam_V) ;



  lin
    ImpersCl vp = {s=\\t,a,p=>realizeVP vp t a p defaultAgr} ;
    GenericCl vp = {s=\\t,a,p=>"njeriu" ++ realizeVP vp t a p defaultAgr} ;

    CleftNP np rs = {
      s=\\t,a,p=>realizeVP cleftCop t a p np.a ++ np.s!Nom ++ rs.s!np.a
    } ;
    CleftAdv adv s = {
      s=\\t,a,p=>realizeVP cleftCop t a p defaultAgr ++ adv.s ++ "që" ++ s.s
    } ;

    ExistNP np = {
      s=\\t,a,p=>realizeExist t a p ++ np.s!Acc
    } ;
    ExistIP ip = {
      s=\\t,a,p=>ip.s!Acc ++ realizeExist t a p
    } ;
    ExistNPAdv np adv = {
      s=\\t,a,p=>(ExistNP np).s!t!a!p ++ adv.s
    } ;
    ExistIPAdv ip adv = {
      s=\\t,a,p=>(ExistIP ip).s!t!a!p ++ adv.s
    } ;

    ProgrVP vp = vp ** {progressivity=Progressive} ;

    ImpPl1 vp = {s="le" ++ subjVP vp p1plAgr} ;
    ImpP3 np vp = {s="le" ++ np.s!Nom ++ subjVP vp np.a} ;

    SelfAdvVP vp = vp ** {post=\\a=>vp.post!a ++ "vetë"} ;
    SelfAdVVP vp = vp ** {cl="vetë" ++ vp.cl ; subjcl="të" ++ "vetë" ++ vp.cl} ;
    SelfNP np = np ** {s=\\c=>np.s!c ++ "vetë"} ;
}
