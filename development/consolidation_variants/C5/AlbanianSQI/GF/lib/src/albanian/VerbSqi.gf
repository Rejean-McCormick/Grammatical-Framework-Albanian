-- Albanian verb syntax with deferred realization.
concrete VerbSqi of Verb = CatSqi **
  open Prelude, ParamX, ResSqi, (I = IrregSqi) in {

  oper
    emptyAgrStr : Agr => Str = \\_ => [] ;

    baseVP : Verb -> VP = \v -> lin VP {
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
      post = emptyAgrStr
    } ;

    baseSlash : Verb -> Compl -> VPSlash = \v,c -> lin VPSlash {
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
      post = emptyAgrStr ;
      c2 = c
    } ;

    slashToVP : VPSlash -> VP = \sl -> lin VP {
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

    addPost : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
      post = \\a => vp.post ! a ++ x ! a
    } ;

    addPostSlash : VPSlash -> (Agr => Str) -> VPSlash = \vp,x -> vp ** {
      post = \\a => vp.post ! a ++ x ! a
    } ;

    addAcc : VP -> Agr -> VP = \vp,a -> vp ** {
      clitics = putAccClitic vp.clitics a
    } ;

    addDat : VP -> Agr -> VP = \vp,a -> vp ** {
      clitics = putDatClitic vp.clitics a
    } ;

    addRefl : VP -> VP = \vp -> vp ** {
      clitics = putReflClitic vp.clitics
    } ;

    addAccSlash : VPSlash -> Agr -> VPSlash = \vp,a -> vp ** {
      clitics = putAccClitic vp.clitics a
    } ;

    addDatSlash : VPSlash -> Agr -> VPSlash = \vp,a -> vp ** {
      clitics = putDatClitic vp.clitics a
    } ;


    vpiStr : VP -> Agr -> Str = \vp,a ->
      realizeSubjVP vp Pos a ;

    slashVpiStr : VPSlash -> Agr -> Str = \vp,a ->
      realizeSubjVP (slashToVP vp) Pos a ;

    NPRec : Type = {
      s : Case => Str ;
      a : Agr ;
      isPron : Bool
    } ;

    saturateVPArg : VP -> Compl -> NPRec -> VP = \vp,compl,np ->
      case <np.isPron,compl.c> of {
        <True,Acc> => addAcc vp np.a ;
        <True,Dat> => addDat vp np.a ;
        <False,Dat> => addPost (addDat vp np.a) (\_ => compl.s ++ np.s ! Dat) ;
        _ => addPost vp (\_ => compl.s ++ np.s ! compl.c)
      } ;

    saturateSlash : VPSlash -> NPRec -> VP = \sl,np ->
      saturateVPArg (slashToVP sl) sl.c2 np ;

    saturateRemainingSlashArg : VPSlash -> Compl -> NPRec -> VPSlash = \sl,compl,np ->
      case <np.isPron,compl.c> of {
        <True,Acc> => addAccSlash sl np.a ;
        <True,Dat> => addDatSlash sl np.a ;
        <False,Dat> => addPostSlash (addDatSlash sl np.a) (\_ => compl.s ++ np.s ! Dat) ;
        _ => addPostSlash sl (\_ => compl.s ++ np.s ! compl.c)
      } ;


  lin
    UseV v = baseVP v ;

    UseCopula = baseVP (lin Verb I.jam_V) ;

    UseComp c = addPost (baseVP (lin Verb I.jam_V)) c.s ;

    CompNP np = {s = \\_ => np.s ! Nom} ;
    CompAP ap = {s = \\a => ap.s ! Indef ! Nom ! agrGender a ! agrNumber a} ;
    CompCN cn = {s = \\a => nounForm cn Indef Nom (agrNumber a)} ;
    CompAdv adv = {s = \\_ => adv.s} ;

    AdvVP vp adv = addPost vp (\\_ => adv.s) ;
    ExtAdvVP vp adv = addPost vp (\\_ => SOFT_BIND ++ "," ++ adv.s) ;
    AdVVP adv vp = vp ** {post = \\a => adv.s ++ vp.post ! a} ;

    AdvVPSlash sl adv = addPostSlash sl (\\_ => adv.s) ;
    AdVVPSlash adv sl = sl ** {post = \\a => adv.s ++ sl.post ! a} ;

    ComplSlash sl np = saturateSlash sl np ;

    ReflVP sl = addRefl (slashToVP sl) ;

    PassV2 v2 = addPost (baseVP (lin Verb I.jam_V)) (\\_ => v2.participle) ;

    ComplVV vv vp = addPost (baseVP vv) (\\a => vpiStr vp a) ;
    ComplVS vs s = addPost (baseVP vs) (\\_ => "që" ++ s.s) ;
    ComplVQ vq qs = addPost (baseVP vq) (\\_ => qs.s) ;
    ComplVA va ap = addPost (baseVP va)
      (\\a => ap.s ! Indef ! Nom ! agrGender a ! agrNumber a) ;

    SlashV2a v2 = baseSlash (lin Verb v2) v2.c2 ;

    SlashV2V v2v vp = addPostSlash (baseSlash (lin Verb v2v) v2v.c2)
      (\\a => v2v.c3.s ++ vpiStr vp a) ;

    SlashV2S v2s s = addPostSlash (baseSlash (lin Verb v2s) v2s.c2)
      (\\_ => v2s.c3.s ++ "që" ++ s.s) ;

    SlashV2Q v2q qs = addPostSlash (baseSlash (lin Verb v2q) v2q.c2)
      (\\_ => v2q.c3.s ++ qs.s) ;

    SlashV2A v2a ap = addPostSlash (baseSlash (lin Verb v2a) v2a.c2)
      (\\a => v2a.c3.s ++ ap.s ! Indef ! Nom ! agrGender a ! agrNumber a) ;

    Slash2V3 v3 np = saturateRemainingSlashArg
      (baseSlash (lin Verb v3) v3.c3) v3.c2 np ;

    Slash3V3 v3 np = saturateRemainingSlashArg
      (baseSlash (lin Verb v3) v3.c2) v3.c3 np ;

    SlashVV vv sl = lin VPSlash {
      indicative = vv.Indicative ;
      subjunctive = vv.Subjunctive ;
      imperative = vv.Imperative ;
      participle = vv.participle ;
      pres_optative = vv.pres_optative ;
      perf_optative = vv.perf_optative ;
      pres_admirative = vv.pres_admirative ;
      imperf_admirative = vv.imperf_admirative ;
      clitics = emptyClitics ;
      progressive = False ;
      preClitic = [] ;
      post = \\a => slashVpiStr sl a ;
      c2 = sl.c2
    } ;

    SlashV2VNP v2v np sl = lin VPSlash {
      indicative = v2v.Indicative ;
      subjunctive = v2v.Subjunctive ;
      imperative = v2v.Imperative ;
      participle = v2v.participle ;
      pres_optative = v2v.pres_optative ;
      perf_optative = v2v.perf_optative ;
      pres_admirative = v2v.pres_admirative ;
      imperf_admirative = v2v.imperf_admirative ;
      clitics = emptyClitics ;
      progressive = False ;
      preClitic = [] ;
      post = \\a => v2v.c2.s ++ np.s ! v2v.c2.c ++
                     v2v.c3.s ++ slashVpiStr sl a ;
      c2 = sl.c2
    } ;

    VPSlashPrep vp prep = lin VPSlash {
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
      c2 = prep
    } ;
}
