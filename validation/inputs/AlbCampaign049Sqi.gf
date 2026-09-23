concrete AlbCampaign049Sqi of AlbCampaign049 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0481 = {s = (S.mkQS S.pastTense (S.mkQCl S.who_IP L.come_V)).s} ;
    C0482 = {s = (S.mkQS S.futureTense (S.mkQCl S.who_IP L.come_V)).s} ;
    C0483 = {s = (S.mkQS S.negativePol (S.mkQCl S.who_IP L.come_V)).s} ;
    C0484 = {s = (S.mkQS S.pastTense (S.mkQCl St.where_IAdv (S.mkCl S.she_NP L.live_V))).s} ;
    C0485 = {s = (S.mkQS S.futureTense (S.mkQCl St.why_IAdv (S.mkCl S.he_NP L.come_V))).s} ;
    C0486 = {s = (S.mkRS S.negativePol (S.mkRCl S.which_RP L.come_V)).s ! (S.he_NP).a} ;
    C0487 = {s = (S.mkRS S.pastTense (S.mkRCl S.which_RP L.come_V)).s ! (S.he_NP).a} ;
    C0488 = {s = (S.mkNP S.theSg_Det (S.mkCN L.book_N (S.mkRS S.negativePol (S.mkRCl S.which_RP S.i_NP L.read_V2)))).s ! Nom} ;
    C0489 = {s = (S.mkNP S.theSg_Det (S.mkCN L.city_N (S.mkRS S.pastTense (S.mkRCl S.which_RP S.she_NP L.know_V2)))).s ! Nom} ;
    C0490 = {s = (S.mkNP S.theSg_Det (S.mkCN L.friend_N (S.mkRS S.futureTense (S.mkRCl S.which_RP S.we_NP L.love_V2)))).s ! Nom} ;
} ;
