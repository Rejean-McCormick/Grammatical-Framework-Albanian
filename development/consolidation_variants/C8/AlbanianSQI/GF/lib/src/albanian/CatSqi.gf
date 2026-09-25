concrete CatSqi of Cat = CommonX ** open ParamX, Prelude, ResSqi in {

  lincat
    N = Noun ;
    N2 = Noun ** {c2 : Compl} ;
    N3 = Noun ** {c2,c3 : Compl} ;

    A = Adj ;
    A2 = Adj ** {c2 : Compl} ;

    V, VA, VV, VQ = Verb ;
    -- Finite declarative complementizers are lexically selectable in Albanian
    -- (e.g. që vs se), so VS/V2S keep this metadata to the realization boundary.
    VS = Verb ** {scomp : Str} ;
    V2 = Verb ** {c2 : Compl} ;
    V2S = Verb ** {c2,c3 : Compl ; scomp : Str} ;
    V2Q, V3, V2A, V2V = Verb ** {c2,c3 : Compl} ;

    Prep = Compl ;

    Subj = {s : Str} ;
    Conj = {s : Str} ;

    Card = {s : Str ; n : Number} ;
    ACard = {s : Str} ;
    Predet = {s : Str} ;
    Ord = {s : Case => Gender => Number => Str} ;

    IComp = {s : Str} ;
    IDet = {s : Case => Gender => Str ; n : Number} ;
    IP = {s : Case => Str ; a : Agr} ;
    IQuant = {s : Case => Gender => Number => Str} ;

    S = {s : Str} ;
    QS = {s : Str} ;
    RS = {s : Agr => Str} ;
    SSlash = {s : Str ; c2 : Compl ; gapPost : Agr => Str} ;

    Cl = {s : ParamX.Tense => Anteriority => Polarity => Str} ;
    QCl = {s : ParamX.Tense => Anteriority => Polarity => Str} ;
    RCl = {s : Agr => ParamX.Tense => Anteriority => Polarity => Str} ;
    RP = {s : Case => GenNum => Str} ;
    ClSlash = {s : ParamX.Tense => Anteriority => Polarity => Str ; c2 : Compl ; gapPost : Agr => Str} ;

    -- Shared category shapes live in ResSqi, matching the standard RGL
    -- Cat/Res boundary and preventing lock-field loss through helper calls.
    VP = ResSqi.VP ;
    VPSlash = ResSqi.VPSlash ;

    Comp = {s : Agr => Str} ;
    DAP = {s : Case => Gender => Str ; n : Number} ;
    -- Name categories preserve nominal case and agreement instead of
    -- collapsing to an invariant string.  The one-string paradigms below
    -- remain backwards-compatible by filling every case with that string.
    GN = {s : Case => Str ; g : Gender} ;
    LN = {s : Case => Str ; a : Agr} ;
    PN = {s : Case => Str ; a : Agr} ;
    SN = {s : Gender => Case => Str ; p : Case => Str} ;

    Imp = {s : Polarity => Number => Str} ;

    Numeral = {s : Str} ;
    Digits = {s : Str ; n : Number ; tail : DTail} ;
    Decimal = {s : Str ; n : Number ; hasDot : Bool} ;

    AP = {s : Species => Case => Gender => Number => Str} ;
    CN = Noun ;
    Num = {s : Str ; n : Number} ;
    Quant = {s : Case => Gender => Number => Str ; spec : Species ; placement : DetPlacement} ;
    Det = {s : Case => Gender => Str ; spec : Species ; n : Number ; placement : DetPlacement} ;

    NP = {
      s : Case => Str ;
      acc_clit, dat_clit : Str ;
      a : Agr ;
      isPron : Bool
    } ;

    Pron = {
      s : Case => Str ;
      acc_clit, dat_clit : Str ;
      a : Agr ;
      isPron : Bool
    } ;

  linref
    A = \a -> case a.clit of {True => "i" ; False => []} ++ a.s ! Nom ! Masc ! Sg ;
    V = \v -> v.Indicative ! ResSqi.Pres ! Sg ! P3 ;
    N = \n -> n.s ! Indef ! Nom ! Sg ;
    NP = \np -> np.s ! Nom ;
}
