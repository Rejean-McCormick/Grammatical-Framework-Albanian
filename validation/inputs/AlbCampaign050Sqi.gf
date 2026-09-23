concrete AlbCampaign050Sqi of AlbCampaign050 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0491 = {s = (S.mkS (S.mkAdv St.if_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS S.futureTense (S.mkCl S.we_NP L.go_V))).s} ;
    C0492 = {s = (S.mkS (S.mkAdv St.when_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS S.futureTense (S.mkCl S.we_NP L.eat_V2 (S.mkNP S.aSg_Det L.apple_N)))).s} ;
    C0493 = {s = (S.mkS (S.mkAdv St.although_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS S.negativePol (S.mkCl S.he_NP L.go_V))).s} ;
    C0494 = {s = (S.mkS (S.mkAdv St.because_Subj (S.mkS S.pastTense (S.mkCl S.she_NP L.come_V))) (S.mkS S.pastTense (S.mkCl S.he_NP L.live_V))).s} ;
    C0495 = {s = (S.mkS (S.mkCl (S.mkNP St.and_Conj (S.mkNP L.john_PN) S.she_NP) L.come_V)).s} ;
    C0496 = {s = (S.mkS (S.mkCl (S.mkNP S.theSg_Det (S.mkCN (S.mkAP St.very_AdA L.good_A) L.man_N)) L.come_V)).s} ;
    C0497 = {s = (S.mkS (S.mkCl (S.mkNP S.theSg_Det (S.mkCN L.beautiful_A L.girl_N)) L.read_V2 (S.mkNP S.theSg_Det L.book_N))).s} ;
    C0498 = {s = (S.mkS (S.mkCl (S.mkNP S.theSg_Det (S.mkCN L.man_N (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.city_N)))) L.love_V2 S.she_NP)).s} ;
    C0499 = {s = (S.mkQS (S.mkQCl S.who_IP L.love_V2 (S.mkNP S.theSg_Det (S.mkCN L.beautiful_A L.girl_N)))).s} ;
    C0500 = {s = (S.mkS (S.mkCl (S.mkNP S.theSg_Det (S.mkCN L.man_N (S.mkRS (S.mkRCl S.which_RP L.love_V2 S.she_NP)))) L.come_V)).s} ;
} ;
