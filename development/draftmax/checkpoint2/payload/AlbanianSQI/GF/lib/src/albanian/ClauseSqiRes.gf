-- Shared Albanian clause/VP realization kernel.
-- This resource is intentionally below Sentence/Question/Relative/Extend so
-- every consumer uses the same tense, polarity, agreement, voice and clitic rules.
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
    preverb = sl.preverb ;
    voice = sl.voice ;
    voiceUse = sl.voiceUse ;
    perfAux = sl.perfAux ;
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
    clitics = emptyCliticCluster ;
    preverb = [] ;
    voice = v.voice ;
    voiceUse = v.voiceUse ;
    perfAux = v.perfAux ;
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
    preverb = vp.preverb ;
    voice = vp.voice ;
    voiceUse = vp.voiceUse ;
    perfAux = vp.perfAux ;
    post = vp.post ;
    c2 = c
  } ;

  appendVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => vp.post ! a ++ x ! a
  } ;

  prependVP : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
    post = \\a => x ! a ++ vp.post ! a
  } ;

  addAccCliticVP : VP -> Str -> VP = \vp,x -> vp ** {
    clitics = setAccClitic vp.clitics x
  } ;

  addDatCliticVP : VP -> Str -> VP = \vp,x -> vp ** {
    clitics = setDatClitic vp.clitics x
  } ;

  addReflCliticVP : VP -> Str -> VP = \vp,x -> vp ** {
    clitics = setReflClitic vp.clitics x
  } ;

  -- Compatibility shim for checkpoint-1 clients.  New code must use one of
  -- the role-specific operations above; sx is deliberately ignored because
  -- të-contraction is now owned by the realization boundary.
  appendClitic : VP -> Str -> Str -> VP = \vp,x,sx -> vp ** {
    clitics = appendLegacyClitic vp.clitics x
  } ;

  addPreverbVP : VP -> Str -> VP = \vp,x -> vp ** {
    preverb = x ++ vp.preverb
  } ;

  markNonActiveVP : VP -> VP = \vp -> vp ** {
    voice=NonActiveVoice ; voiceUse=PlainVoice ; perfAux=AuxJam
  } ;
  markPassiveVP : VP -> VP = \vp -> vp ** {
    voice=NonActiveVoice ; voiceUse=PassiveVoice ; perfAux=AuxJam
  } ;
  markReflexiveVP : VP -> VP = \vp -> vp ** {
    voice=NonActiveVoice ; voiceUse=ReflexiveVoice ; perfAux=AuxJam
  } ;

  -- Plain finite heads keep a preverb such as po/vetë outside the weak
  -- pronoun cluster.  In the simple aorist a non-active VP contributes u to
  -- the typed cluster so dative+u fusion can be handled centrally.
  finiteHead : VP -> Tense -> Str = \vp,t ->
    vp.preverb ++ flattenClitics (addVoiceClitic vp.voice t vp.clitics) ;

  -- Positive subjunctive/future places clitics after të.  Contraction is
  -- possible only when no intervening preverbal particle is present.
  subjHead : VP -> Str = \vp -> case vp.preverb of {
    [] => teWithClitics vp.clitics ;
    x  => "të" ++ x ++ flattenClitics vp.clitics
  } ;

  negSubjHead : VP -> Str = \vp ->
    "të" ++ "mos" ++ vp.preverb ++ flattenClitics vp.clitics ;

  impHead : VP -> Polarity -> Str = \vp,pol -> case pol of {
    Pos => vp.preverb ++ flattenClitics vp.clitics ;
    Neg => "mos" ++ vp.preverb ++ flattenClitics vp.clitics
  } ;

  -- Main finite realization. Public ParamX tense is mapped to Albanian
  -- morphology only here; ResSqi.Tense never leaks into public RGL tables.
  realizeVP : VP -> ParamX.Tense -> Anteriority -> Polarity -> Agr -> Str =
    \vp,t,ant,pol,a -> case <ant,t> of {
      <Simul,ParamX.Fut> => negation pol ++ "do" ++
        subjHead vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;

      <Simul,ParamX.Cond> => negation pol ++ "do" ++
        subjHead vp ++
        vp.indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;

      <Simul,_> => negation pol ++ finiteHead vp (sqiTense t) ++
        vp.indicative ! sqiTense t ! agrNumber a ! a.p ++ vp.post ! a ;

      <Anter,ParamX.Fut> => negation pol ++ "do" ++
        subjHead vp ++
        perfectAuxSubj vp.perfAux (agrNumber a) a.p ++
        vp.participle ++ vp.post ! a ;

      <Anter,ParamX.Cond> => negation pol ++ "do" ++
        subjHead vp ++
        perfectAuxFinite vp.perfAux ParamX.Past (agrNumber a) a.p ++
        vp.participle ++ vp.post ! a ;

      <Anter,_> => negation pol ++ vp.preverb ++ flattenClitics vp.clitics ++
        perfectAuxFinite vp.perfAux t (agrNumber a) a.p ++
        vp.participle ++ vp.post ! a
    } ;

  -- Standard-Albanian finite complement introduced by të. Negative
  -- subjunctives use të mos; positive forms centralize të-contraction.
  realizeSubjVP : VP -> Polarity -> Agr -> Str = \vp,pol,a -> case pol of {
    Pos => subjHead vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;
    Neg => negSubjHead vp ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeSubjAntVP : VP -> Anteriority -> Polarity -> Agr -> Str =
    \vp,ant,pol,a -> case ant of {
      Simul => realizeSubjVP vp pol a ;
      Anter => case pol of {
        Pos => subjHead vp ++
          perfectAuxSubj vp.perfAux (agrNumber a) a.p ++ vp.participle ++ vp.post ! a ;
        Neg => negSubjHead vp ++
          perfectAuxSubj vp.perfAux (agrNumber a) a.p ++ vp.participle ++ vp.post ! a
      }
    } ;

  -- Albanian permits proclitic weak pronouns with positive imperatives and
  -- requires them after mos in negative imperatives.  We use the universally
  -- valid proclitic order here; enclitic plural placement before -ni requires
  -- morphology-aware segmentation and is intentionally not guessed.
  realizeImpVP : VP -> Polarity -> Number -> Str = \vp,pol,n ->
    let a : Agr = {gn = case n of {Sg => GSg Masc ; Pl => GPl Masc} ; p = P2}
    in impHead vp pol ++ vp.imperative ! n ++ vp.post ! a ;

  realizePartVP : VP -> Agr -> Str = \vp,a ->
    vp.preverb ++ flattenClitics vp.clitics ++ vp.participle ++ vp.post ! a ;

  realizeGerundVP : VP -> Agr -> Str = \vp,a ->
    "duke" ++ vp.preverb ++ flattenClitics vp.clitics ++ vp.participle ++ vp.post ! a ;

  mkClause : Str -> Agr -> VP -> ParamX.Tense -> Anteriority -> Polarity -> Str =
    \subj,a,vp,t,ant,pol -> subj ++ realizeVP vp t ant pol a ;

}
