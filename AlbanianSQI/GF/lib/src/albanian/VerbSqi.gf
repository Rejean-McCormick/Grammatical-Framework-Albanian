-- Albanian verb syntax with deferred realization.
concrete VerbSqi of Verb = CatSqi **
  open Prelude, ParamX, ResSqi, (I = IrregSqi) in {

  oper
    emptyAgrStr : Agr => Str = \\_ => [] ;

    baseVP : Verb -> VP = \v -> lin VP {
      v = v ;
      cl = emptyAgrStr ;
      post = emptyAgrStr
    } ;

    baseSlash : Verb -> Compl -> VPSlash = \v,c -> lin VPSlash {
      v = v ;
      cl = emptyAgrStr ;
      post = emptyAgrStr ;
      c2 = c
    } ;

    slashToVP : VPSlash -> VP = \sl -> lin VP {
      v = sl.v ; cl = sl.cl ; post = sl.post
    } ;

    addPost : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
      post = \\a => vp.post ! a ++ x ! a
    } ;

    addPostSlash : VPSlash -> (Agr => Str) -> VPSlash = \vp,x -> vp ** {
      post = \\a => vp.post ! a ++ x ! a
    } ;

    addClitic : VP -> (Agr => Str) -> VP = \vp,x -> vp ** {
      cl = \\a => vp.cl ! a ++ x ! a
    } ;

    addCliticSlash : VPSlash -> (Agr => Str) -> VPSlash = \vp,x -> vp ** {
      cl = \\a => vp.cl ! a ++ x ! a
    } ;

    vpiStr : VP -> Agr -> Str = \vp,a ->
      teWithClitic (vp.cl ! a) ++ subjunctiveFinite vp.v a ++ vp.post ! a ;

    slashVpiStr : VPSlash -> Agr -> Str = \vp,a ->
      teWithClitic (vp.cl ! a) ++ subjunctiveFinite vp.v a ++ vp.post ! a ;

    saturateSlash : VPSlash -> NP -> VP = \sl,np ->
      let c : Case = sl.c2.c in
      case <np.isPron,c> of {
        <True,Acc> => addClitic (slashToVP sl) (\\_ => np.acc_clit) ;
        <True,Dat> => addClitic (slashToVP sl) (\\_ => np.dat_clit) ;
        <False,Dat> =>
          addPost
            (addClitic (slashToVP sl) (\\_ => datCliticAgr np.a))
            (\\_ => sl.c2.s ++ np.s ! c) ;
        _ => addPost (slashToVP sl) (\\_ => sl.c2.s ++ np.s ! c)
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

    AdvVPSlash sl adv = addPostSlash sl (\\_ => adv.s) ;
    AdVVPSlash adv sl = sl ** {post = \\a => adv.s ++ sl.post ! a} ;

    ComplSlash sl np = saturateSlash sl np ;

    ReflVP sl = addClitic (slashToVP sl) (\\_ => "u") ;

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

    Slash2V3 v3 np = addPostSlash (baseSlash (lin Verb v3) v3.c3)
      (\\_ => v3.c2.s ++ np.s ! v3.c2.c) ;

    Slash3V3 v3 np = addPostSlash (baseSlash (lin Verb v3) v3.c2)
      (\\_ => v3.c3.s ++ np.s ! v3.c3.c) ;

    SlashVV vv sl = lin VPSlash {
      v = vv ;
      cl = emptyAgrStr ;
      post = \\a => slashVpiStr sl a ;
      c2 = sl.c2
    } ;

    SlashV2VNP v2v np sl = lin VPSlash {
      v = lin Verb v2v ;
      cl = emptyAgrStr ;
      post = \\a => v2v.c2.s ++ np.s ! v2v.c2.c ++
                     v2v.c3.s ++ slashVpiStr sl a ;
      c2 = sl.c2
    } ;

    VPSlashPrep vp prep = lin VPSlash {
      v = vp.v ; cl = vp.cl ; post = vp.post ; c2 = prep
    } ;
}
