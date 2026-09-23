concrete AlbCampaign030Sqi of AlbCampaign030 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0291 = {s = (S.mkS (S.mkCl S.i_NP L.answer_V2S S.he_NP (S.mkS (S.mkCl S.she_NP L.come_V)))).s} ;
    C0292 = {s = (S.mkS (S.mkCl S.i_NP L.ask_V2Q S.he_NP (S.mkQS (S.mkQCl (S.mkCl S.she_NP L.come_V))))).s} ;
    C0293 = {s = (S.mkS (S.mkCl S.i_NP L.beg_V2V S.he_NP (S.mkVP L.come_V))).s} ;
    C0294 = {s = (S.mkS (S.mkCl S.i_NP L.paint_V2A S.it_NP L.red_A)).s} ;
    C0295 = {s = (S.mkS (S.mkCl S.i_NP L.answer_V2S S.she_NP (S.mkS (S.mkCl S.he_NP L.live_V)))).s} ;
    C0296 = {s = (S.mkS (S.mkCl S.i_NP L.ask_V2Q S.she_NP (S.mkQS (S.mkQCl S.who_IP L.come_V)))).s} ;
    C0297 = {s = (S.mkS (S.mkCl S.i_NP L.beg_V2V S.she_NP (S.mkVP L.live_V))).s} ;
    C0298 = {s = (S.mkS (S.mkCl S.i_NP L.paint_V2A (S.mkNP S.theSg_Det L.book_N) L.black_A)).s} ;
    C0299 = {s = (S.mkS S.negativePol (S.mkCl S.i_NP L.ask_V2Q S.he_NP (S.mkQS (S.mkQCl (S.mkCl S.she_NP L.come_V))))).s} ;
    C0300 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP L.answer_V2S S.he_NP (S.mkS (S.mkCl S.she_NP L.come_V)))).s} ;
} ;
