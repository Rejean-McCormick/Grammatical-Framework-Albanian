concrete AlbCampaign039Sqi of AlbCampaign039 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0381 = {s = (S.mkQS (S.mkCl S.she_NP L.come_V)).s} ;
    C0382 = {s = (S.mkQS (S.mkCl S.he_NP L.live_V)).s} ;
    C0383 = {s = (S.mkQS S.pastTense (S.mkQCl (S.mkCl S.she_NP L.come_V))).s} ;
    C0384 = {s = (S.mkQS S.futureTense (S.mkQCl (S.mkCl S.she_NP L.come_V))).s} ;
    C0385 = {s = (S.mkQS S.conditionalTense (S.mkQCl (S.mkCl S.she_NP L.come_V))).s} ;
    C0386 = {s = (S.mkQS S.negativePol (S.mkQCl (S.mkCl S.she_NP L.come_V))).s} ;
    C0387 = {s = (S.mkQS (S.mkCl S.he_NP L.read_V2 (S.mkNP S.theSg_Det L.book_N))).s} ;
    C0388 = {s = (S.mkQS (S.mkCl S.she_NP L.love_V2 S.he_NP)).s} ;
    C0389 = {s = (S.mkQS S.pastTense (S.mkQCl (S.mkCl S.he_NP L.give_V3 S.it_NP S.she_NP))).s} ;
    C0390 = {s = (S.mkQS (S.mkCl (S.mkNP L.john_PN) L.live_V)).s} ;
} ;
