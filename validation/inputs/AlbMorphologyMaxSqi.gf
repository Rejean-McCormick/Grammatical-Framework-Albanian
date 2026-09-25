concrete AlbMorphologyMaxSqi of AlbMorphologyMax =
  open Prelude, ResSqi, (P = ParadigmsSqi), (L = LexiconSqi), (I = IrregSqi) in {

  lincat Probe = {s : Str} ;

  oper
    genderName : Gender -> Str = \g -> case g of {Masc => "Masc" ; Fem => "Fem"} ;
    voiceName : MorphVoice -> Str = \v -> case v of {ActiveMorph => "Active" ; NonActiveMorph => "NonActive"} ;
    auxName : PerfectAux -> Str = \a -> case a of {AuxKam => "kam" ; AuxJam => "jam"} ;

    ambigSymbol : N = P.mkNAmbig (P.mkN "simbol") P.masculine P.feminine ;
    strictMal : N = P.reg3N "mal" "male" "mali" ;
    strictMadh : A = P.reg3A "madh" "mëdhenj" "madhe" ;
    strictWrite : V = P.reg4V "shkruaj" "shkrova" "shkruar" "shkruaja" ;
    productiveNonActive : V = P.mkV "bazohem" ;
    productiveActive : V = P.mkV "shkruaj" ;
    legacyDi : V = P.irregV "di" "di" "di" "dimë" "dini" "dinë" "di" "dini" "ditur" ;
    legacyPi : V = P.irregV "pi" "pi" "pi" "pimë" "pini" "pinë" "pi" "pini" "pirë" ;

  lin
    -- Dat/Gen are distinct grammatical keys but segmentally syncretic in N.
    MX001 = {s = (L.book_N).s ! Def ! Dat ! Sg} ;
    MX002 = {s = (L.book_N).s ! Def ! Gen ! Sg} ;

    -- Ambigeneric agreement metadata survives Number.
    MX003 = {s = genderName (ambigSymbol.g ! Sg)} ;
    MX004 = {s = genderName (ambigSymbol.g ! Pl)} ;

    -- Strict principal-parts ladder: positive cases.
    MX005 = {s = strictMal.s ! Def ! Nom ! Sg} ;
    MX006 = {s = strictMadh.s ! Nom ! Fem ! Sg} ;
    MX007 = {s = strictWrite.participle} ;
    MX008 = {s = strictWrite.Indicative ! Aorist ! Sg ! P1} ;
    MX009 = {s = strictWrite.Indicative ! Imperfect ! Sg ! P1} ;

    -- Productive non-active class metadata and perfect auxiliary selection.
    MX010 = {s = voiceName productiveNonActive.morphVoice} ;
    MX011 = {s = auxName (selectPerfectAux productiveNonActive.morphVoice productiveNonActive.perfectAux)} ;
    MX012 = {s = auxName (selectPerfectAux productiveActive.morphVoice productiveActive.perfectAux)} ;

    -- Exact irregular non-active constructor.
    MX013 = {s = voiceName (I.behem_V).morphVoice} ;

    -- Centralized nyje service and exact full noun Gen projection.
    MX014 = {s = nyje ! Def ! Gen ! Masc ! Sg} ;
    MX015 = {s = (L.book_N).s ! Indef ! Gen ! Pl} ;

    -- Typed adjective article behavior replaces Bool clit metadata.
    MX016 = {s = case strictMadh.cls of {Articulated => "Articulated" ; Unarticulated => "Unarticulated"}} ;
    MX017 = {s = case (P.unartA strictMadh).cls of {Articulated => "Articulated" ; Unarticulated => "Unarticulated"}} ;

    -- Gen is public in ParadigmsSqi government API.
    MX018 = {s = case P.genitive of {Gen => "Gen" ; _ => "unexpected"}} ;

    -- Compact irregV remains source-compatible for the two currently direct
    -- lexical callers whose subjunctive P2/P3 were historically exceptional.
    MX019 = {s = legacyDi.Subjunctive ! Sg ! P2} ;
    MX020 = {s = legacyPi.Subjunctive ! Sg ! P3} ;
}
