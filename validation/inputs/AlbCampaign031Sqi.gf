concrete AlbCampaign031Sqi of AlbCampaign031 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0301 = {s = (S.mkS (S.mkCl S.he_NP L.good_A)).s} ;
    C0302 = {s = (S.mkS (S.mkCl S.she_NP L.beautiful_A)).s} ;
    C0303 = {s = (S.mkS (S.mkCl S.he_NP L.man_N)).s} ;
    C0304 = {s = (S.mkS (S.mkCl S.she_NP L.doctor_N)).s} ;
    C0305 = {s = (S.mkS (S.mkCl (S.mkNP L.john_PN) (S.mkNP S.theSg_Det L.man_N))).s} ;
    C0306 = {s = (S.mkS (S.mkCl (S.mkNP L.paris_PN) L.city_N)).s} ;
    C0307 = {s = (S.mkS (S.mkCl S.he_NP (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.house_N)))).s} ;
    C0308 = {s = (S.mkS (S.mkCl S.she_NP (S.mkAdv St.with_Prep (S.mkNP L.john_PN)))).s} ;
    C0309 = {s = (S.mkS S.negativePol (S.mkCl S.he_NP L.good_A)).s} ;
    C0310 = {s = (S.mkS S.pastTense (S.mkCl S.she_NP L.doctor_N)).s} ;
} ;
