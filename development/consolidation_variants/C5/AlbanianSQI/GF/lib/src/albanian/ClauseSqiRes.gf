-- Shared Albanian clause/VP realization kernel.
-- C5 final architecture: clitic roles remain typed until this module flattens
-- them exactly once.  po and non-clitic preverbal material are separate slots.
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
    clitics = sl.clitics ;
    progressive = sl.progressive ;
    preClitic = sl.preClitic ;
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
    clitics = emptyClitics ;
    progressive = False ;
    preClitic = [] ;
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
    clitics = vp.clitics ;
    progressive = vp.progressive ;
    preClitic = vp.preClitic ;
    post = vp.post ;
    c2 = c
  } ;

  appendVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => vp.post ! a ++ x ! a
  } ;

  prependVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => x ! a ++ vp.post ! a
  } ;

  appendAccClitic : VP -> Agr -> VP = \vp,a -> vp ** {
    clitics = putAccClitic vp.clitics a
  } ;

  appendDatClitic : VP -> Agr -> VP = \vp,a -> vp ** {
    clitics = putDatClitic vp.clitics a
  } ;

  appendReflClitic : VP -> VP = \vp -> vp ** {
    clitics = putReflClitic vp.clitics
  } ;

  progressiveVP : VP -> VP = \vp -> vp ** {progressive=True} ;

  addPreCliticMaterial : VP -> Str -> VP = \vp,x -> vp ** {
    preClitic = vp.preClitic ++ x
  } ;

  ordinaryPrefix : VP -> Str = \vp ->
    vp.preClitic ++ case vp.progressive of {True => "po" ; False => []} ++
    flattenClitics vp.clitics ;

  -- Positive të contracts only when the clitic cluster is immediately after
  -- të.  If another preverbal slot intervenes, të stays independent.
  subjPrefix : VP -> Str = \vp -> case <vp.preClitic : Str> of {
    "" => case vp.progressive of {
      False => teWithClitics vp.clitics ;
      True  => "të" ++ "po" ++ flattenClitics vp.clitics
    } ;
    _ => "të" ++ vp.preClitic ++
         case vp.progressive of {True => "po" ; False => []} ++
         flattenClitics vp.clitics
  } ;

  negSubjPrefix : VP -> Str = \vp ->
    "të" ++ "mos" ++ vp.preClitic ++
    case vp.progressive of {True => "po" ; False => []} ++
    flattenClitics vp.clitics ;

  realizeVP : VP -> ParamX.Tense -> Anteriority -> Polarity -> Agr -> Str =
    \vp,t,ant,pol,a -> case <ant,t> of {
      <Simul,ParamX.Fut> => negation pol ++ "do" ++
        subjPrefix vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;

      <Simul,ParamX.Cond> => negation pol ++ "do" ++
        subjPrefix vp ++ vp.indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;

      <Simul,_> => negation pol ++ ordinaryPrefix vp ++
        vp.indicative ! sqiTense t ! agrNumber a ! a.p ++ vp.post ! a ;

      <Anter,ParamX.Fut> => negation pol ++ "do" ++
        subjPrefix vp ++ haveSubj ! agrNumber a ! a.p ++
        vp.participle ++ vp.post ! a ;

      <Anter,ParamX.Cond> => negation pol ++ "do" ++
        subjPrefix vp ++ haveAux ! ParamX.Past ! agrNumber a ! a.p ++
        vp.participle ++ vp.post ! a ;

      <Anter,_> => negation pol ++ ordinaryPrefix vp ++
        haveAux ! t ! agrNumber a ! a.p ++ vp.participle ++ vp.post ! a
    } ;

  realizeSubjVP : VP -> Polarity -> Agr -> Str = \vp,pol,a -> case pol of {
    Pos => subjPrefix vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;
    Neg => negSubjPrefix vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeSubjAntVP : VP -> Anteriority -> Polarity -> Agr -> Str =
    \vp,ant,pol,a -> case ant of {
      Simul => realizeSubjVP vp pol a ;
      Anter => case pol of {
        Pos => subjPrefix vp ++ haveSubj ! agrNumber a ! a.p ++
          vp.participle ++ vp.post ! a ;
        Neg => negSubjPrefix vp ++ haveSubj ! agrNumber a ! a.p ++
          vp.participle ++ vp.post ! a
      }
    } ;

  -- The reference licenses both pro- and enclisis in the positive imperative.
  -- Core RGL chooses the deterministic proclitic variant; negative imperatives
  -- are necessarily mos + clitic + verb.
  realizeImpVP : VP -> Polarity -> Number -> Str = \vp,pol,n ->
    let a : Agr = {gn = case n of {Sg => GSg Masc ; Pl => GPl Masc} ; p = P2}
    in case pol of {
      Pos => ordinaryPrefix vp ++ vp.imperative ! n ++ vp.post ! a ;
      Neg => "mos" ++ vp.preClitic ++ flattenClitics vp.clitics ++
             vp.imperative ! n ++ vp.post ! a
    } ;

  realizePartVP : VP -> Agr -> Str = \vp,a ->
    ordinaryPrefix vp ++ vp.participle ++ vp.post ! a ;

  realizeGerundVP : VP -> Agr -> Str = \vp,a ->
    "duke" ++ vp.preClitic ++ flattenClitics vp.clitics ++
    vp.participle ++ vp.post ! a ;

  realizeInfVP : VP -> Agr -> Str = \vp,a ->
    subjPrefix vp ++ vp.participle ++ vp.post ! a ;

  mkClause : Str -> Agr -> VP -> ParamX.Tense -> Anteriority -> Polarity -> Str =
    \subj,a,vp,t,ant,pol -> subj ++ realizeVP vp t ant pol a ;
}
