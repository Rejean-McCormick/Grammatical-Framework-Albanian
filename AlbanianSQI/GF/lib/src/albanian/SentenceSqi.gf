concrete SentenceSqi of Sentence = CatSqi **
  open Prelude, ParamX, ResSqi, ClauseSqiRes in {

lin
  PredVP np vp = {
    s = \t,ant,pol => mkClause (np.s ! Nom) np.a vp t ant pol
  } ;

  PredSCVP sc vp = {
    s = \t,ant,pol => mkClause sc.s defaultAgr vp t ant pol
  } ;

  SlashVP np sl = {
    s = \t,ant,pol => mkClause (np.s ! Nom) np.a (vpFromSlash sl) t ant pol ;
    c2 = sl.c2
  } ;

  AdvSlash cl adv = cl ** {
    s = \t,ant,pol => cl.s ! t ! ant ! pol ++ adv.s
  } ;

  SlashPrep cl prep = {s = cl.s ; c2 = prep} ;

  SlashVS np vs sslash = {
    s = \t,ant,pol =>
      let vp : VP = appendVP (emptyVP vs) (\_ => "që" ++ sslash.s)
      in mkClause (np.s ! Nom) np.a vp t ant pol ;
    c2 = sslash.c2
  } ;

  ImpVP vp = {s = \pol,n => realizeImpVP vp pol n} ;
  AdvImp adv imp = {s = \pol,n => adv.s ++ imp.s ! pol ! n} ;

  EmbedS s = {s = "që" ++ s.s} ;
  EmbedQS qs = {s = qs.s} ;
  EmbedVP vp = {s = realizeSubjVP vp Pos defaultAgr} ;

  UseCl temp pol cl = {s = cl.s ! temp.t ! temp.a ! pol.p} ;
  UseQCl temp pol qcl = {s = qcl.s ! temp.t ! temp.a ! pol.p} ;
  UseRCl temp pol rcl = {s = \a => rcl.s ! a ! temp.t ! temp.a ! pol.p} ;
  UseSlash temp pol clsl = {
    s = clsl.s ! temp.t ! temp.a ! pol.p ;
    c2 = clsl.c2
  } ;

  AdvS adv s = {s = adv.s ++ s.s} ;
  ExtAdvS adv s = {s = adv.s ++ SOFT_BIND ++ "," ++ s.s} ;
  SSubjS s1 subj s2 = {s = s1.s ++ subj.s ++ s2.s} ;
  RelS s rs = {s = s.s ++ SOFT_BIND ++ "," ++ rs.s ! defaultAgr} ;
}
