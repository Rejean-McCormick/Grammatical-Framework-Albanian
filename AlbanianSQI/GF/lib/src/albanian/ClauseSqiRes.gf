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
    progressive = sl.progressive ; progressivity = sl.progressivity ;
    preClitic = sl.preClitic ;
    post = sl.post ; morphVoice=sl.morphVoice ; voiceUse=sl.voiceUse
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
    progressive = False ; progressivity = NeutralProgressive ;
    preClitic = [] ;
    post = \\_ => [] ; morphVoice=v.morphVoice ; voiceUse=PlainUse
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
    progressive = vp.progressive ; progressivity = vp.progressivity ;
    preClitic = vp.preClitic ;
    post = vp.post ; morphVoice=vp.morphVoice ; voiceUse=vp.voiceUse ;
    c2 = c ; gapPost=\_,_ => []
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

  progressiveVP : VP -> VP = \vp -> vp ** {progressive=True ; progressivity=Progressive} ;

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

  -- Progressive po is a typed realization strategy.  The supplied C4
  -- evidence licenses the neutral core strategy for present and imperfect;
  -- future/conditional/anterior/marked combinations remain deliberately
  -- ungenerated instead of producing mechanical *do të po* sequences.
  realizeProgressive : VP -> ParamX.Tense -> Polarity -> Agr -> Str = \vp,t,pol,a ->
    case <vp.voiceUse,t> of {
      <PlainUse,ParamX.Pres> => negation pol ++ vp.preClitic ++ "po" ++
        flattenClitics vp.clitics ++ vp.indicative ! Pres ! agrNumber a ! a.p ++ vp.post ! a ;
      <PlainUse,ParamX.Past> => negation pol ++ vp.preClitic ++ "po" ++
        flattenClitics vp.clitics ++ vp.indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;
      _ => nonExist
    } ;

  realizeVP : VP -> ParamX.Tense -> Anteriority -> Polarity -> Agr -> Str =
    \vp,t,ant,pol,a -> case vp.progressivity of {
      Progressive => case ant of {
        Simul => realizeProgressive vp t pol a ;
        Anter => nonExist
      } ;
      NeutralProgressive => case <ant,t> of {
        <Simul,ParamX.Fut> => negation pol ++ "do" ++
          subjPrefix vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;

        <Simul,ParamX.Cond> => negation pol ++ "do" ++
          subjPrefix vp ++ vp.indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;

        <Simul,_> => negation pol ++ ordinaryPrefix vp ++
          vp.indicative ! (case t of {ParamX.Past=>Imperfect; _=>sqiTense t}) ! agrNumber a ! a.p ++ vp.post ! a ;

        <Anter,ParamX.Fut> => negation pol ++ "do" ++
          subjPrefix vp ++ perfectSubj vp.morphVoice (agrNumber a) a.p ++
          vp.participle ++ vp.post ! a ;

        <Anter,ParamX.Cond> => negation pol ++ "do" ++
          subjPrefix vp ++ perfectAux vp.morphVoice ParamX.Past (agrNumber a) a.p ++
          vp.participle ++ vp.post ! a ;

        <Anter,_> => negation pol ++ ordinaryPrefix vp ++
          perfectAux vp.morphVoice t (agrNumber a) a.p ++ vp.participle ++ vp.post ! a
      }
    } ;

  realizeSubjVP : VP -> Polarity -> Agr -> Str = \vp,pol,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => case pol of {
      Pos => subjPrefix vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;
      Neg => negSubjPrefix vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a
    }
  } ;

  realizeSubjAntVP : VP -> Anteriority -> Polarity -> Agr -> Str =
    \vp,ant,pol,a -> case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case ant of {
        Simul => realizeSubjVP vp pol a ;
        Anter => case pol of {
          Pos => subjPrefix vp ++ perfectSubj vp.morphVoice (agrNumber a) a.p ++
            vp.participle ++ vp.post ! a ;
          Neg => negSubjPrefix vp ++ perfectSubj vp.morphVoice (agrNumber a) a.p ++
            vp.participle ++ vp.post ! a
        }
      }
    } ;

  -- The reference licenses both pro- and enclisis in the positive imperative.
  -- Core keeps deterministic proclisis.  Progressive imperatives are outside
  -- the certified neutral domain and are therefore not generated.
  realizeImpVP : VP -> Polarity -> Number -> Str = \vp,pol,n ->
    let a : Agr = {gn = case n of {Sg => GSg Masc ; Pl => GPl Masc} ; p = P2}
    in case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case pol of {
        Pos => ordinaryPrefix vp ++ vp.imperative ! n ++ vp.post ! a ;
        Neg => "mos" ++ vp.preClitic ++ flattenClitics vp.clitics ++
               vp.imperative ! n ++ vp.post ! a
      }
    } ;

  realizePartVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => ordinaryPrefix vp ++ vp.participle ++ vp.post ! a
  } ;

  realizeGerundPolVP : VP -> Polarity -> Agr -> Str = \vp,pol,a ->
    case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case pol of {
        Pos => "duke" ++ vp.preClitic ++ flattenClitics vp.clitics ++ vp.participle ++ vp.post ! a ;
        Neg => "duke" ++ "mos" ++ vp.preClitic ++ flattenClitics vp.clitics ++ vp.participle ++ vp.post ! a
      }
    } ;

  realizeGerundVP : VP -> Agr -> Str = \vp,a -> realizeGerundPolVP vp Pos a ;

  realizePurposeVP : VP -> Polarity -> Agr -> Str = \vp,pol,a ->
    case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case pol of {
        Pos => "për" ++ subjPrefix vp ++ vp.participle ++ vp.post ! a ;
        Neg => "për" ++ negSubjPrefix vp ++ vp.participle ++ vp.post ! a
      }
    } ;

  realizeInfVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => subjPrefix vp ++ vp.participle ++ vp.post ! a
  } ;

  -- Explicit Albanian aorist and marked moods remain outside common RGL
  -- Tense; ExtraSqi exposes them without overloading common TPast semantics.
  realizeAoristVP : VP -> Polarity -> Agr -> Str = \vp,pol,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => negation pol ++ ordinaryPrefix vp ++
      vp.indicative ! Aorist ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeAoristAnteriorVP : VP -> Polarity -> Agr -> Str = \vp,pol,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => negation pol ++ ordinaryPrefix vp ++
      aorAnteriorAux vp.morphVoice (agrNumber a) a.p ++ vp.participle ++ vp.post ! a
  } ;

  realizeOptativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => ordinaryPrefix vp ++ vp.pres_optative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizePerfectOptativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => ordinaryPrefix vp ++ vp.perf_optative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeAdmirativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => ordinaryPrefix vp ++ vp.pres_admirative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeImperfectAdmirativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => ordinaryPrefix vp ++ vp.imperf_admirative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  mkClause : Str -> Agr -> VP -> ParamX.Tense -> Anteriority -> Polarity -> Str =
    \subj,a,vp,t,ant,pol -> subj ++ realizeVP vp t ant pol a ;
}
