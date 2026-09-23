concrete AlbCampaign048Sqi of AlbCampaign048 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0471 = {s = (S.mkS S.pastTense S.negativePol (S.mkCl S.i_NP L.love_V2 S.he_NP)).s} ;
    C0472 = {s = (S.mkS S.futureTense S.negativePol (S.mkCl S.she_NP L.read_V2 (S.mkNP S.theSg_Det L.book_N))).s} ;
    C0473 = {s = (S.mkS S.conditionalTense S.negativePol (S.mkCl S.he_NP L.give_V3 S.it_NP S.she_NP)).s} ;
    C0474 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP (S.progressiveVP (S.mkVP L.come_V)))).s} ;
    C0475 = {s = (S.mkS S.futureTense (S.mkCl S.he_NP (S.passiveVP L.love_V2))).s} ;
    C0476 = {s = (S.mkS S.negativePol (S.mkCl S.he_NP (S.passiveVP L.love_V2 S.she_NP))).s} ;
    C0477 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP L.say_VS (S.mkS S.negativePol (S.mkCl S.she_NP L.come_V)))).s} ;
    C0478 = {s = (S.mkS S.futureTense (S.mkCl S.i_NP L.know_VQ (S.mkQS (S.mkQCl S.who_IP L.come_V)))).s} ;
    C0479 = {s = (S.mkS S.negativePol (S.mkCl S.i_NP L.beg_V2V S.he_NP (S.mkVP L.come_V))).s} ;
    C0480 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP L.paint_V2A S.it_NP L.red_A)).s} ;
} ;
