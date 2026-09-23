concrete AlbCampaign041Sqi of AlbCampaign041 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0401 = {s = (S.mkRS (S.mkRCl S.which_RP L.come_V)).s ! (S.i_NP).a} ;
    C0402 = {s = (S.mkRS (S.mkRCl S.which_RP L.live_V)).s ! (S.he_NP).a} ;
    C0403 = {s = (S.mkRS (S.mkRCl S.which_RP L.love_V2 S.he_NP)).s ! (S.she_NP).a} ;
    C0404 = {s = (S.mkRS (S.mkRCl S.which_RP L.give_V3 S.it_NP S.he_NP)).s ! (S.he_NP).a} ;
    C0405 = {s = (S.mkRS (S.mkRCl S.which_RP L.say_VS (S.mkS (S.mkCl S.she_NP L.come_V)))).s ! (S.he_NP).a} ;
    C0406 = {s = (S.mkRS (S.mkRCl S.which_RP L.wonder_VQ (S.mkQS (S.mkQCl (S.mkCl S.she_NP L.come_V))))).s ! (S.he_NP).a} ;
    C0407 = {s = (S.mkRS (S.mkRCl S.which_RP L.become_VA L.good_A)).s ! (S.he_NP).a} ;
    C0408 = {s = (S.mkRS (S.mkRCl S.which_RP L.paint_V2A S.it_NP L.red_A)).s ! (S.he_NP).a} ;
    C0409 = {s = (S.mkRS (S.mkRCl S.which_RP L.good_A)).s ! (S.he_NP).a} ;
    C0410 = {s = (S.mkRS (S.mkRCl S.which_RP (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.city_N)))).s ! (S.he_NP).a} ;
} ;
