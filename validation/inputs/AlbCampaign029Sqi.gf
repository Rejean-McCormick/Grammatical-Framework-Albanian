concrete AlbCampaign029Sqi of AlbCampaign029 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0281 = {s = (S.mkS (S.mkCl S.i_NP L.say_VS (S.mkS (S.mkCl S.she_NP L.come_V)))).s} ;
    C0282 = {s = (S.mkS (S.mkCl S.i_NP L.hope_VS (S.mkS (S.mkCl S.she_NP L.come_V)))).s} ;
    C0283 = {s = (S.mkS (S.mkCl S.i_NP L.fear_VS (S.mkS (S.mkCl S.she_NP L.come_V)))).s} ;
    C0284 = {s = (S.mkS (S.mkCl S.i_NP L.know_VQ (S.mkQS (S.mkQCl (S.mkCl S.she_NP L.come_V))))).s} ;
    C0285 = {s = (S.mkS (S.mkCl S.i_NP L.wonder_VQ (S.mkQS (S.mkQCl (S.mkCl S.she_NP L.come_V))))).s} ;
    C0286 = {s = (S.mkS (S.mkCl S.he_NP L.become_VA L.good_A)).s} ;
    C0287 = {s = (S.mkS (S.mkCl S.she_NP L.become_VA L.beautiful_A)).s} ;
    C0288 = {s = (S.mkS (S.mkCl S.she_NP L.married_A2 S.he_NP)).s} ;
    C0289 = {s = (S.mkS (S.mkCl S.i_NP L.say_VS (S.mkS S.negativePol (S.mkCl S.she_NP L.come_V)))).s} ;
    C0290 = {s = (S.mkS (S.mkCl S.i_NP L.know_VQ (S.mkQS (S.mkQCl S.who_IP L.come_V)))).s} ;
} ;
