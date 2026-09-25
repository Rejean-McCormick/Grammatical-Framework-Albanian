-- Albanian verb syntax with deferred realization and typed complement transport.
concrete VerbSqi of Verb = CatSqi **
  open Prelude, ParamX, ResSqi, (I = IrregSqi) in {

  oper
    emptyAgrStr : Agr => Str = \\_ => [] ;
    emptyGapStr : Agr => Agr => Str = \\_,_ => [] ;

    baseVP : Verb -> VP = \v -> lin VP {
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
      cl = [] ;
      subjcl = "të" ;
      post = emptyAgrStr ;
      c2 = c ;
      gapPost = emptyGapStr
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
      cl = sl.cl ;
      subjcl = sl.subjcl ;
      post = sl.post
    } ;

    addPost : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
      post = \\a => vp.post ! a ++ x ! a
    } ;

    -- addPostSlash means "material before the still-unresolved gap".
    addPostSlash : VPSlash -> (Agr => Str) -> VPSlash = \vp,x -> vp ** {
      post = \\a => vp.post ! a ++ x ! a
    } ;

    addGapPostSlash : VPSlash -> (Agr => Agr => Str) -> VPSlash = \vp,x -> vp ** {
      gapPost = \\subj,obj => vp.gapPost ! subj ! obj ++ x ! subj ! obj
    } ;

    addClitic : VP -> Str -> Str -> VP = \vp,x,sx -> vp ** {
      cl = vp.cl ++ x ;
      subjcl = sx
    } ;

    addCliticSlash : VPSlash -> Str -> Str -> VPSlash = \vp,x,sx -> vp ** {
      cl = vp.cl ++ x ;
      subjcl = sx
    } ;

    vpiStr : VP -> Agr -> Str = \vp,a ->
      vp.subjcl ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;

    -- Prefix of an embedded unresolved slash.  Material after its gap is kept
    -- separately and is only realized once the missing argument is known.
    slashVpiPrefix : VPSlash -> Agr -> Str = \vp,a ->
      vp.subjcl ++ vp.subjunctive ! agrNumber a ! a.p ++ vp.post ! a ;

    NPRec : Type = {
      s : Case => Str ;
      acc_clit, dat_clit : Str ;
      a : Agr ;
      isPron : Bool
    } ;

    -- Saturation is the single boundary where an unresolved complement becomes
    -- an NP.  Object agreement is then available for V2A/V2V tails.
    saturateSlash : VPSlash -> NPRec -> VP = \sl,np ->
      let c : Case = sl.c2.c ;
          tail : Agr => Str = \\subj => sl.gapPost ! subj ! np.a
      in case <np.isPron,c> of {
        <True,Acc> => addPost
          (addClitic (slashToVP sl) np.acc_clit (subjAccCliticAgr np.a)) tail ;
        <True,Dat> => addPost
          (addClitic (slashToVP sl) np.dat_clit (subjDatCliticAgr np.a)) tail ;
        <False,Dat> => addPost
          (addPost
            (addClitic (slashToVP sl) (datCliticAgr np.a) (subjDatCliticAgr np.a))
            (\\_ => sl.c2.s ++ np.s ! c)) tail ;
        _ => addPost
          (addPost (slashToVP sl) (\\_ => sl.c2.s ++ np.s ! c)) tail
      } ;

    -- A supplied V3 argument may require a weak dative clitic even while the
    -- other argument remains a slash.  Keep the clitic before the finite verb
    -- and its overt realization in the appropriate side of the gap.
    fixedObjectClitic : VPSlash -> Compl -> NPRec -> VPSlash = \sl,c,np ->
      case <np.isPron,c.c> of {
        <True,Acc> => addCliticSlash sl np.acc_clit (subjAccCliticAgr np.a) ;
        <True,Dat> => addCliticSlash sl np.dat_clit (subjDatCliticAgr np.a) ;
        <False,Dat> => addCliticSlash sl (datCliticAgr np.a) (subjDatCliticAgr np.a) ;
        _ => sl
      } ;

    fixedObjectSurface : Compl -> NPRec -> Str = \c,np ->
      case <np.isPron,c.c> of {
        <True,Acc> => [] ;
        <True,Dat> => [] ;
        _ => c.s ++ np.s ! c.c
      } ;

  lin
    UseV v = baseVP v ;

    UseCopula = baseVP (lin Verb I.jam_V) ;

    UseComp c = addPost (baseVP (lin Verb I.jam_V)) c.s ;

    CompNP np = {s = \\_ => np.s ! Nom} ;
    CompAP ap = {s = \\a => ap.s ! Indef ! Nom ! agrGender a ! agrNumber a} ;
    CompCN cn = {s = \\a => cn.s ! Indef ! Nom ! agrNumber a} ;
    CompAdv adv = {s = \\_ => adv.s} ;

    AdvVP vp adv = addPost vp (\\_ => adv.s) ;
    ExtAdvVP vp adv = addPost vp (\\_ => SOFT_BIND ++ "," ++ adv.s) ;
    AdVVP adv vp = vp ** {post = \\a => adv.s ++ vp.post ! a} ;

    -- Ordinary adverbials follow the missing object; AdV keeps the established
    -- preverbal/early VP behavior and therefore stays before the gap.
    AdvVPSlash sl adv = addGapPostSlash sl (\\_,_ => adv.s) ;
    AdVVPSlash adv sl = sl ** {post = \\a => adv.s ++ sl.post ! a} ;

    ComplSlash sl np = saturateSlash sl np ;

    -- The reflexive missing object is controlled by the subject.
    ReflVP sl = addPost
      (addClitic (slashToVP sl) "u" "t'u")
      (\\a => sl.gapPost ! a ! a) ;

    PassV2 v2 = addPost (baseVP (lin Verb I.jam_V)) (\\_ => v2.participle) ;

    -- Standard Albanian finite verbal complementation is finite/subjunctive;
    -- VV control uses the matrix subject, while VS uses its lexical complementizer.
    ComplVV vv vp = addPost (baseVP vv) (\\a => vpiStr vp a) ;
    ComplVS vs s = addPost (baseVP (lin Verb vs)) (\\_ => vs.scomp ++ s.s) ;
    ComplVQ vq qs = addPost (baseVP vq) (\\_ => qs.s) ;
    ComplVA va ap = addPost (baseVP va)
      (\\a => ap.s ! Indef ! Nom ! agrGender a ! agrNumber a) ;

    SlashV2a v2 = baseSlash (lin Verb v2) v2.c2 ;

    -- Object-control: the unresolved object, not the matrix subject, controls
    -- the embedded subjunctive.
    SlashV2V v2v vp = addGapPostSlash (baseSlash (lin Verb v2v) v2v.c2)
      (\\_,obj => v2v.c3.s ++ vpiStr vp obj) ;

    SlashV2S v2s s = addGapPostSlash (baseSlash (lin Verb v2s) v2s.c2)
      (\\_,_ => v2s.c3.s ++ v2s.scomp ++ s.s) ;

    SlashV2Q v2q qs = addGapPostSlash (baseSlash (lin Verb v2q) v2q.c2)
      (\\_,_ => v2q.c3.s ++ qs.s) ;

    -- Object-oriented secondary predication.  Albanian secondary adjectives
    -- agree with the object; object case is accusative at this realization
    -- boundary (e lyeva të kuq / të kuqe), not matrix-subject nominative.
    SlashV2A v2a ap = addGapPostSlash (baseSlash (lin Verb v2a) v2a.c2)
      (\\_,obj => v2a.c3.s ++
        ap.s ! Indef ! Acc ! agrGender obj ! agrNumber obj) ;

    -- Slash2V3 supplies c2 and leaves c3 unresolved: fixed c2 precedes the gap.
    Slash2V3 v3 np =
      slashFromVP (saturateSlash (baseSlash (lin Verb v3) v3.c2) np) v3.c3 ;

    -- Slash3V3 leaves c2 unresolved and supplies c3: fixed c3 is after the gap.
    Slash3V3 v3 np =
      let sl0 : VPSlash = fixedObjectClitic (baseSlash (lin Verb v3) v3.c2) v3.c3 np
      in addGapPostSlash sl0 (\\_,_ => fixedObjectSurface v3.c3 np) ;

    -- Subject-control VV over an embedded unresolved object.
    SlashVV vv sl = lin VPSlash {
      indicative = vv.Indicative ;
      subjunctive = vv.Subjunctive ;
      imperative = vv.Imperative ;
      participle = vv.participle ;
      pres_optative = vv.pres_optative ;
      perf_optative = vv.perf_optative ;
      pres_admirative = vv.pres_admirative ;
      imperf_admirative = vv.imperf_admirative ;
      cl = [] ;
      subjcl = "të" ;
      post = \\subj => slashVpiPrefix sl subj ;
      c2 = sl.c2 ;
      gapPost = \\subj,obj => sl.gapPost ! subj ! obj
    } ;

    -- The overt V2V object controls the embedded subject.  Its case/clitic
    -- behavior is saturated before the inner slash is transported outward.
    SlashV2VNP v2v np sl =
      let outer : VP = saturateSlash (baseSlash (lin Verb v2v) v2v.c2) np
      in lin VPSlash {
        indicative = outer.indicative ;
        subjunctive = outer.subjunctive ;
        imperative = outer.imperative ;
        participle = outer.participle ;
        pres_optative = outer.pres_optative ;
        perf_optative = outer.perf_optative ;
        pres_admirative = outer.pres_admirative ;
        imperf_admirative = outer.imperf_admirative ;
        cl = outer.cl ;
        subjcl = outer.subjcl ;
        post = \\subj => outer.post ! subj ++ v2v.c3.s ++ slashVpiPrefix sl np.a ;
        c2 = sl.c2 ;
        gapPost = \\_,obj => sl.gapPost ! np.a ! obj
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
      cl = vp.cl ;
      subjcl = vp.subjcl ;
      post = vp.post ;
      c2 = prep ;
      gapPost = emptyGapStr
    } ;
}
