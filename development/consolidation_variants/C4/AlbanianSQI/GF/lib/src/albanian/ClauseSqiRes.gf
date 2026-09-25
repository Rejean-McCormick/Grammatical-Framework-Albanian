-- Shared Albanian clause/VP realization kernel.
-- This resource is intentionally below Sentence/Question/Relative/Extend so
-- every consumer uses the same tense, polarity, agreement, voice and particle
-- rules.  It is the unique finite realization boundary for do/të/po/nuk/mos
-- and perfect auxiliaries.
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
    post = sl.post ;
    morphVoice = sl.morphVoice ;
    voiceUse = sl.voiceUse ;
    progressivity = sl.progressivity
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
    post = \\_ => [] ;
    morphVoice = v.morphVoice ;
    voiceUse = PlainUse ;
    progressivity = NeutralProgressive
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
    morphVoice = vp.morphVoice ;
    voiceUse = vp.voiceUse ;
    progressivity = vp.progressivity ;
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

  -- Progressive po is a realization strategy, not a stored string prefix.
  -- Source evidence supports present and imperfect uses.  Future,
  -- conditional, anterior and marked-voice combinations remain deliberately
  -- ungenerated instead of mechanically producing *do të po ...*.
  realizeProgressive : VP -> ParamX.Tense -> Agr -> Str = \vp,t,a ->
    case <vp.voiceUse,t> of {
      <PlainUse,ParamX.Pres> => "po" ++ vp.cl ++
        vp.indicative ! Pres ! agrNumber a ! a.p ++ vp.post ! a ;
      <PlainUse,ParamX.Past> => "po" ++ vp.cl ++
        vp.indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;
      _ => nonExist
    } ;

  -- Main finite realization.  Common RGL TPast means imperfect here;
  -- Albanian aorist is exposed explicitly by realizeAoristVP below.
  realizeVP : VP -> ParamX.Tense -> Anteriority -> Polarity -> Agr -> Str =
    \vp,t,ant,pol,a -> case vp.progressivity of {
      Progressive => case ant of {
        Simul => case <vp.voiceUse,t> of {
          <PlainUse,ParamX.Pres> => negation pol ++ realizeProgressive vp t a ;
          <PlainUse,ParamX.Past> => negation pol ++ realizeProgressive vp t a ;
          _ => nonExist
        } ;
        Anter => nonExist
      } ;
      NeutralProgressive => case <ant,t> of {
        <Simul,ParamX.Fut> => negation pol ++ "do" ++
          vp.subjcl ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;

        <Simul,ParamX.Cond> => negation pol ++ "do" ++
          vp.subjcl ++
          vp.indicative ! Imperfect ! agrNumber a ! a.p ++ vp.post ! a ;

        <Simul,_> => negation pol ++ vp.cl ++
          vp.indicative ! sqiTense t ! agrNumber a ! a.p ++ vp.post ! a ;

        <Anter,ParamX.Fut> => negation pol ++ "do" ++
          vp.subjcl ++
          perfectSubj vp.morphVoice (agrNumber a) a.p ++
          vp.participle ++ vp.post ! a ;

        <Anter,ParamX.Cond> => negation pol ++ "do" ++
          vp.subjcl ++
          perfectAux vp.morphVoice ParamX.Past (agrNumber a) a.p ++
          vp.participle ++ vp.post ! a ;

        <Anter,_> => negation pol ++ vp.cl ++
          perfectAux vp.morphVoice t (agrNumber a) a.p ++
          vp.participle ++ vp.post ! a
      }
    } ;

  -- Existential kam is impersonal 3sg but follows the same public RGL TAM
  -- policy as ordinary finite clauses.  Keeping it here prevents IdiomSqi
  -- from becoming a second owner of do/të and perfect auxiliary sequencing.
  realizeExist : ParamX.Tense -> Anteriority -> Polarity -> Str = \t,ant,pol ->
    negation pol ++ case <ant,t> of {
      <Simul,ParamX.Pres> => "ka" ;
      <Simul,ParamX.Past> => "kishte" ;
      <Simul,ParamX.Fut> => "do" ++ "të" ++ "ketë" ;
      <Simul,ParamX.Cond> => "do" ++ "të" ++ "kishte" ;
      <Anter,ParamX.Pres> => "ka" ++ "pasur" ;
      <Anter,ParamX.Past> => "kishte" ++ "pasur" ;
      <Anter,ParamX.Fut> => "do" ++ "të" ++ "ketë" ++ "pasur" ;
      <Anter,ParamX.Cond> => "do" ++ "të" ++ "kishte" ++ "pasur"
    } ;

  -- Standard-Albanian finite complement introduced by të.  Negative
  -- subjunctives use të mos; positive forms contract të with e/i/u clitics.
  realizeSubjVP : VP -> Polarity -> Agr -> Str = \vp,pol,a ->
    case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case pol of {
        Pos => vp.subjcl ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;
        Neg => "të" ++ "mos" ++ vp.cl ++
          vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a
      }
    } ;

  realizeSubjAntVP : VP -> Anteriority -> Polarity -> Agr -> Str =
    \vp,ant,pol,a -> case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case ant of {
        Simul => realizeSubjVP vp pol a ;
        Anter => case pol of {
          Pos => vp.subjcl ++
            perfectSubj vp.morphVoice (agrNumber a) a.p ++
            vp.participle ++ vp.post ! a ;
          Neg => "të" ++ "mos" ++ vp.cl ++
            perfectSubj vp.morphVoice (agrNumber a) a.p ++
            vp.participle ++ vp.post ! a
        }
      }
    } ;

  realizeImpVP : VP -> Polarity -> Number -> Str = \vp,pol,n ->
    let a : Agr = {gn = case n of {Sg => GSg Masc ; Pl => GPl} ; p = P2}
    in case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case pol of {
        -- Preverbal weak clitics are one of the two licensed positive
        -- imperative placements; negative imperatives require mos + clitic.
        Pos => vp.cl ++ vp.imperative ! n ++ vp.post ! a ;
        Neg => "mos" ++ vp.cl ++ vp.imperative ! n ++ vp.post ! a
      }
    } ;

  realizePartVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => vp.cl ++ vp.participle ++ vp.post ! a
  } ;

  realizeGerundPolVP : VP -> Polarity -> Agr -> Str = \vp,pol,a ->
    case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case pol of {
        Pos => "duke" ++ vp.cl ++ vp.participle ++ vp.post ! a ;
        Neg => "duke" ++ "mos" ++ vp.cl ++ vp.participle ++ vp.post ! a
      }
    } ;

  realizeGerundVP : VP -> Agr -> Str = \vp,a -> realizeGerundPolVP vp Pos a ;

  realizePurposeVP : VP -> Polarity -> Agr -> Str = \vp,pol,a ->
    case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => case pol of {
        Pos => "për" ++ vp.subjcl ++ vp.participle ++ vp.post ! a ;
        Neg => "për" ++ "të" ++ "mos" ++ vp.cl ++ vp.participle ++ vp.post ! a
      }
    } ;

  -- Explicit Albanian aorist.  It remains outside common RGL TPast so the
  -- common abstract semantics are not overloaded.
  realizeAoristVP : VP -> Polarity -> Agr -> Str = \vp,pol,a ->
    case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => negation pol ++ vp.cl ++
        vp.indicative ! Aorist ! agrNumber a ! a.p ++ vp.post ! a
    } ;

  -- Explicit aorist-auxiliary anterior series: pata/qeshë + participle.
  -- The neutral common RGL TPast+AAnter remains kisha/isha + participle.
  realizeAoristAnteriorVP : VP -> Polarity -> Agr -> Str = \vp,pol,a ->
    case vp.progressivity of {
      Progressive => nonExist ;
      NeutralProgressive => negation pol ++ vp.cl ++
        aorAnteriorAux vp.morphVoice (agrNumber a) a.p ++
        vp.participle ++ vp.post ! a
    } ;

  realizeOptativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => vp.cl ++ vp.pres_optative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizePerfectOptativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => vp.cl ++ vp.perf_optative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeAdmirativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => vp.cl ++ vp.pres_admirative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  realizeImperfectAdmirativeVP : VP -> Agr -> Str = \vp,a -> case vp.progressivity of {
    Progressive => nonExist ;
    NeutralProgressive => vp.cl ++ vp.imperf_admirative ! agrNumber a ! a.p ++ vp.post ! a
  } ;

  mkClause : Str -> Agr -> VP -> ParamX.Tense -> Anteriority -> Polarity -> Str =
    \subj,a,vp,t,ant,pol -> subj ++ realizeVP vp t ant pol a ;

}
