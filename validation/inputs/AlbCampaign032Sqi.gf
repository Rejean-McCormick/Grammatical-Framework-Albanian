concrete AlbCampaign032Sqi of AlbCampaign032 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0311 = {s = (S.mkS (S.mkCl S.i_NP (S.mkVP (S.mkVP L.come_V) (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.house_N))))).s} ;
    C0312 = {s = (S.mkS (S.mkCl S.he_NP (S.mkVP (S.mkVP L.live_V) (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.city_N))))).s} ;
    C0313 = {s = (S.mkS (S.mkCl S.i_NP (S.mkVP St.always_AdV (S.mkVP L.come_V)))).s} ;
    C0314 = {s = (S.mkS (S.mkCl S.he_NP (S.mkAP St.very_AdA L.good_A))).s} ;
    C0315 = {s = (S.mkS (S.mkCl S.she_NP (S.mkAP St.very_AdA L.beautiful_A))).s} ;
    C0316 = {s = (S.mkNP S.theSg_Det (S.mkCN L.book_N (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.house_N)))).s ! Nom} ;
    C0317 = {s = (S.mkNP (S.mkNP L.john_PN) (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.city_N))).s ! Nom} ;
    C0318 = {s = (S.mkS (S.mkCl S.i_NP (S.mkVP (S.mkVP L.come_V) (S.mkAdv St.with_Prep S.he_NP)))).s} ;
    C0319 = {s = (S.mkS S.negativePol (S.mkCl S.he_NP (S.mkVP (S.mkVP L.live_V) (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.city_N))))).s} ;
    C0320 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP (S.mkVP (S.mkVP L.come_V) (S.mkAdv St.with_Prep S.she_NP)))).s} ;
} ;
