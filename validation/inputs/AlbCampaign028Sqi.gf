concrete AlbCampaign028Sqi of AlbCampaign028 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0271 = {s = (S.mkS (S.mkCl S.i_NP L.give_V3 (S.mkNP S.theSg_Det L.book_N) S.he_NP)).s} ;
    C0272 = {s = (S.mkS (S.mkCl S.i_NP L.give_V3 (S.mkNP S.aSg_Det L.apple_N) S.she_NP)).s} ;
    C0273 = {s = (S.mkS (S.mkCl S.she_NP L.send_V3 (S.mkNP S.theSg_Det L.book_N) S.he_NP)).s} ;
    C0274 = {s = (S.mkS (S.mkCl S.he_NP L.sell_V3 (S.mkNP S.theSg_Det L.house_N) S.she_NP)).s} ;
    C0275 = {s = (S.mkS (S.mkCl S.i_NP L.add_V3 (S.mkNP S.theSg_Det L.book_N) (S.mkNP S.theSg_Det L.city_N))).s} ;
    C0276 = {s = (S.mkS (S.mkCl S.i_NP L.talk_V3 S.he_NP S.she_NP)).s} ;
    C0277 = {s = (S.mkS (S.mkCl S.we_NP L.give_V3 (S.mkNP S.theSg_Det L.book_N) (S.mkNP L.john_PN))).s} ;
    C0278 = {s = (S.mkS (S.mkCl S.they_NP L.send_V3 (S.mkNP S.aSg_Det L.apple_N) (S.mkNP L.paris_PN))).s} ;
    C0279 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP L.give_V3 (S.mkNP S.theSg_Det L.book_N) S.he_NP)).s} ;
    C0280 = {s = (S.mkS S.negativePol (S.mkCl S.i_NP L.give_V3 (S.mkNP S.theSg_Det L.book_N) S.he_NP)).s} ;
} ;
