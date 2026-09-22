-- Shared Albanian clause/VP realization kernel.
-- This resource is intentionally below Sentence/Question/Relative/Extend so
-- every consumer uses the same tense, polarity, agreement and clitic rules.
resource ClauseSqiRes =
  open Prelude, ParamX, ResSqi in {

oper
  defaultAgr : Agr = {gn = GSg Masc ; p = P3} ;

  vpFromSlash : VPSlash -> VP = \sl -> {
    indicative = sl.indicative ;
    subjunctive = sl.subjunctive ;
    imperative = sl.imperative ;
    participle = sl.participle ;
    pres_optative = sl.pres_optative ;
    perf_optative = sl.perf_optative ;
    pres_admirative = sl.pres_admirative ;
    imperf_admirative = sl.imperf_admirative ;
    cl = sl.cl ;
    subjcl = sl.subjcl ;
    post = sl.post
  } ;

  emptyVP : Verb -> VP = \v -> {
    indicative = v.Indicative ;
    subjunctive = v.Subjunctive ;
    imperative = v.Imperative ;
    participle = v.participle ;
    pres_optative = v.pres_optative ;
    perf_optative = v.perf_optative ;
    pres_admirative = v.pres_admirative ;
    imperf_admirative = v.imperf_admirative ;
    cl = [] ;
    subjcl = "të" ;
    post = \\_ => []
  } ;

  slashFromVP : VP -> Compl -> VPSlash = \vp,c -> {
    indicative = vp.indicative ;
    subjunctive = vp.subjunctive ;
    imperative = vp.imperative ;
    participle = vp.participle ;
    pres_optative = vp.pres_optative ;
    perf_optative = vp.perf_optative ;
    pres_admirative = vp.pres_admirative ;
    imperf_admirative = vp.imperf_admirative ;
    cl = vp.cl ;
    subjcl = vp.subjcl ;
    post = vp.post ;
    c2 = c
  } ;

  appendVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => vp.post ! a ++ x ! a
  } ;

  prependVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => x ! a ++ vp.post ! a
  } ;

  appendClitic : VP -> Str -> Str -> VP = \vp,x,sx -> vp ** {
    cl = vp.cl ++ x ;
    subjcl = sx
  } ;

  -- Main finite realization.  Public ParamX tense is mapped to Albanian
  -- morphology only here; ResSqi.Tense never leaks into public RGL tables.
  realizeVP : VP -> ParamX.Tense -> Anteriority -> Polarity -> Agr -> Str =
    \vp,t,ant,pol,a -> case <ant,t> of {
      <Simul,ParamX.Fut> => negation pol ++ "do" ++
        vp.subjcl ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;

      <Simul,ParamX.Cond> => negation pol ++ "do" ++
        vp.subjcl ++
        vp.indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;

      <Simul,_> => negation pol ++ vp.cl ++
        vp.indicative ! sqiTense t ! agrNumber a ! a.p ++ vp.post ! a ;

      <Anter,ParamX.Fut> => negation pol ++ "do" ++
        vp.subjcl ++
        haveSubj ! agrNumber a ! a.p ++
        vp.participle ++ vp.post ! a ;

      <Anter,ParamX.Cond> => negation pol ++ "do" ++
        vp.subjcl ++
        haveAux ! ParamX.Past ! agrNumber a ! a.p ++
        vp.participle ++ vp.post ! a ;

      <Anter,_> => negation pol ++ vp.cl ++
        haveAux ! t ! agrNumber a ! a.p ++ vp.participle ++ vp.post ! a
    } ;

  -- Standard-Albanian finite complement introduced by të.  Negative
  -- subjunctives use të mos; positive forms contract të with e/i/u clitics.
  realizeSubjVP : VP -> Polarity -> Agr -> Str = \vp,pol,a -> case pol of {
    Pos => vp.subjcl ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;
    Neg => "të" ++ "mos" ++ vp.cl ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeSubjAntVP : VP -> Anteriority -> Polarity -> Agr -> Str =
    \vp,ant,pol,a -> case ant of {
      Simul => realizeSubjVP vp pol a ;
      Anter => case pol of {
        Pos => vp.subjcl ++
          haveSubj ! agrNumber a ! a.p ++ vp.participle ++ vp.post ! a ;
        Neg => "të" ++ "mos" ++ vp.cl ++
          haveSubj ! agrNumber a ! a.p ++ vp.participle ++ vp.post ! a
      }
    } ;

  realizeImpVP : VP -> Polarity -> Number -> Str = \vp,pol,n ->
    let a : Agr = {gn = case n of {Sg => GSg Masc ; Pl => GPl} ; p = P2}
    in case pol of {
      Pos => vp.cl ++ vp.imperative ! n ++ vp.post ! a ;
      Neg => "mos" ++ vp.cl ++ vp.imperative ! n ++ vp.post ! a
    } ;

  realizePartVP : VP -> Agr -> Str = \vp,a ->
    vp.cl ++ vp.participle ++ vp.post ! a ;

  realizeGerundVP : VP -> Agr -> Str = \vp,a ->
    "duke" ++ vp.cl ++ vp.participle ++ vp.post ! a ;

  mkClause : Str -> Agr -> VP -> ParamX.Tense -> Anteriority -> Polarity -> Str =
    \subj,a,vp,t,ant,pol -> subj ++ realizeVP vp t ant pol a ;

}
