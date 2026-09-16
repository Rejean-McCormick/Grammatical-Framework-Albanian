-- FILE: SentenceSqi.gf
concrete SentenceSqi of Sentence = CatSqi ** open ResSqi, Prelude in {

  oper
    sentenceSep : Str = " " ;

  lin
    PredVP np vp       = {s = np.s ! Nom ++ sentenceSep ++ vp.s} ;
    PredSCVP sc vp     = {s = sc.s ++ sentenceSep ++ vp.s} ;

    ImpVP vp           = {s = vp.s} ;

    AdvS adv s         = {s = adv.s ++ sentenceSep ++ s.s} ;
    ExtAdvS adv s      = {s = adv.s ++ sentenceSep ++ s.s} ;

    RelS s rs          = {s = s.s ++ sentenceSep ++ rs.s} ;

    SlashPrep cl prep  = {s = cl.s ++ sentenceSep ++ prep.s} ;
    SlashVP np vpslash = {s = np.s ! Nom ++ sentenceSep ++ vpslash.s} ;

    AdvSlash clslash adv = {s = clslash.s ++ sentenceSep ++ adv.s} ;

    EmbedS s           = {s = s.s} ;
    EmbedQS qs         = {s = qs.s} ;
    EmbedVP vp         = {s = vp.s} ;

    UseCl temp pol cl     = {s = cl.s} ;
    UseQCl temp pol qcl   = {s = qcl.s} ;
    UseRCl temp pol rcl   = {s = rcl.s} ;
    UseSlash temp pol clsl = {s = clsl.s} ;

    SlashVS np vs sslash = {s = np.s ! Nom ++ sentenceSep ++ sslash.s} ;

    AdvImp adv imp        = {s = adv.s ++ sentenceSep ++ imp.s} ;
    SSubjS s subj s2      = {s = s.s ++ sentenceSep ++ subj.s ++ sentenceSep ++ s2.s} ;

}