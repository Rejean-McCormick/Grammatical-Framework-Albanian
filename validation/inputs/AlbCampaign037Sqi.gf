concrete AlbCampaign037Sqi of AlbCampaign037 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0361 = {s = (S.mkS (S.mkCl S.he_NP (S.reflexiveVP L.love_V2))).s} ;
    C0362 = {s = (S.mkS (S.mkCl S.she_NP (S.reflexiveVP L.see_V2))).s} ;
    C0363 = {s = (S.mkS (S.mkCl S.he_NP (S.passiveVP L.love_V2))).s} ;
    C0364 = {s = (S.mkS (S.mkCl S.he_NP (S.passiveVP L.love_V2 S.she_NP))).s} ;
    C0365 = {s = (S.mkS (S.mkCl S.i_NP (S.progressiveVP (S.mkVP L.come_V)))).s} ;
    C0366 = {s = (S.mkS (S.mkCl S.i_NP (S.progressiveVP (S.mkVP L.read_V2 (S.mkNP S.theSg_Det L.book_N))))).s} ;
    C0367 = {s = (S.mkS S.negativePol (S.mkCl S.he_NP (S.reflexiveVP L.love_V2))).s} ;
    C0368 = {s = (S.mkS S.pastTense (S.mkCl S.he_NP (S.passiveVP L.love_V2))).s} ;
    C0369 = {s = (S.mkS S.futureTense (S.mkCl S.i_NP (S.progressiveVP (S.mkVP L.come_V)))).s} ;
    C0370 = {s = (S.mkS S.negativePol (S.mkCl S.i_NP (S.progressiveVP (S.mkVP L.come_V)))).s} ;
} ;
