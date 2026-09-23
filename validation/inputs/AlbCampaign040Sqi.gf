concrete AlbCampaign040Sqi of AlbCampaign040 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0391 = {s = (S.mkQS (S.mkQCl S.who_IP L.come_V)).s} ;
    C0392 = {s = (S.mkQS (S.mkQCl S.who_IP L.live_V)).s} ;
    C0393 = {s = (S.mkQS (S.mkQCl S.who_IP L.love_V2 S.he_NP)).s} ;
    C0394 = {s = (S.mkQS (S.mkQCl S.who_IP S.she_NP L.love_V2)).s} ;
    C0395 = {s = (S.mkQS (S.mkQCl S.who_IP S.he_NP L.know_V2)).s} ;
    C0396 = {s = (S.mkQS (S.mkQCl St.where_IAdv (S.mkCl S.she_NP L.live_V))).s} ;
    C0397 = {s = (S.mkQS (S.mkQCl St.why_IAdv (S.mkCl S.he_NP L.come_V))).s} ;
    C0398 = {s = (S.mkQS (S.mkQCl St.when_IAdv (S.mkCl S.she_NP L.come_V))).s} ;
    C0399 = {s = (S.mkQS (S.mkQCl St.with_Prep S.who_IP (S.mkCl S.she_NP L.live_V))).s} ;
    C0400 = {s = (S.mkQS (S.mkQCl (S.mkIP St.which_IQuant L.city_N))).s} ;
} ;
