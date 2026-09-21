-- Shared Albanian clause/VP realization kernel.
-- This resource is intentionally below Sentence/Question/Relative/Extend so
-- every consumer uses the same tense, polarity, agreement and clitic rules.
resource ClauseSqiRes =
  open Prelude, ParamX, ResSqi, CatSqi in {

oper
  defaultAgr : Agr = {gn = GSg Masc ; p = P3} ;

  vpFromSlash : VPSlash -> VP = \sl -> lin VP {
    v = sl.v ;
    cl = sl.cl ;
    post = sl.post
  } ;

  emptyVP : Verb -> VP = \v -> lin VP {
    v = v ;
    cl = \\_ => [] ;
    post = \\_ => []
  } ;

  appendVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => vp.post ! a ++ x ! a
  } ;

  prependVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => x ! a ++ vp.post ! a
  } ;

  appendClitic : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    cl = \\a => vp.cl ! a ++ x ! a
  } ;

  -- Main finite realization.  Public ParamX tense is mapped to Albanian
  -- morphology only here; ResSqi.Tense never leaks into public RGL tables.
  realizeVP : VP -> ParamX.Tense -> Anteriority -> Polarity -> Agr -> Str =
    \vp,t,ant,pol,a -> case <ant,t> of {
      <Simul,ParamX.Fut> => negation pol ++ "do" ++
        teWithClitic (vp.cl ! a) ++ subjunctiveFinite vp.v a ++ vp.post ! a ;

      <Simul,ParamX.Cond> => negation pol ++ "do" ++
        teWithClitic (vp.cl ! a) ++
        vp.v.Indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;

      <Simul,_> => negation pol ++ vp.cl ! a ++
        vp.v.Indicative ! sqiTense t ! agrNumber a ! a.p ++ vp.post ! a ;

      <Anter,ParamX.Fut> => negation pol ++ "do" ++
        teWithClitic (vp.cl ! a) ++
        haveSubj ! agrNumber a ! a.p ++
        vp.v.participle ++ vp.post ! a ;

      <Anter,ParamX.Cond> => negation pol ++ "do" ++
        teWithClitic (vp.cl ! a) ++
        haveAux ! ParamX.Past ! agrNumber a ! a.p ++
        vp.v.participle ++ vp.post ! a ;

      <Anter,_> => negation pol ++ vp.cl ! a ++
        haveAux ! t ! agrNumber a ! a.p ++ vp.v.participle ++ vp.post ! a
    } ;

  -- Standard-Albanian finite complement introduced by të.  Negative
  -- subjunctives use të mos; positive forms contract të with e/i/u clitics.
  realizeSubjVP : VP -> Polarity -> Agr -> Str = \vp,pol,a -> case pol of {
    Pos => teWithClitic (vp.cl ! a) ++ subjunctiveFinite vp.v a ++ vp.post ! a ;
    Neg => "të" ++ "mos" ++ vp.cl ! a ++ subjunctiveFinite vp.v a ++ vp.post ! a
  } ;

  realizeSubjAntVP : VP -> Anteriority -> Polarity -> Agr -> Str =
    \vp,ant,pol,a -> case ant of {
      Simul => realizeSubjVP vp pol a ;
      Anter => case pol of {
        Pos => teWithClitic (vp.cl ! a) ++
          haveSubj ! agrNumber a ! a.p ++ vp.v.participle ++ vp.post ! a ;
        Neg => "të" ++ "mos" ++ vp.cl ! a ++
          haveSubj ! agrNumber a ! a.p ++ vp.v.participle ++ vp.post ! a
      }
    } ;

  realizeImpVP : VP -> Polarity -> Number -> Str = \vp,pol,n ->
    let a : Agr = {gn = case n of {Sg => GSg Masc ; Pl => GPl} ; p = P2}
    in case pol of {
      Pos => vp.cl ! a ++ vp.v.Imperative ! n ++ vp.post ! a ;
      Neg => "mos" ++ vp.cl ! a ++ vp.v.Imperative ! n ++ vp.post ! a
    } ;

  realizePartVP : VP -> Agr -> Str = \vp,a ->
    vp.cl ! a ++ vp.v.participle ++ vp.post ! a ;

  realizeGerundVP : VP -> Agr -> Str = \vp,a ->
    "duke" ++ vp.cl ! a ++ vp.v.participle ++ vp.post ! a ;

  mkClause : Str -> Agr -> VP -> ParamX.Tense -> Anteriority -> Polarity -> Str =
    \subj,a,vp,t,ant,pol -> subj ++ realizeVP vp t ant pol a ;

}
