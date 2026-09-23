concrete AlbCampaign038Sqi of AlbCampaign038 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0371 = {s = (S.mkS (S.mkCl S.i_NP St.want_VV (S.mkVP L.come_V))).s} ;
    C0372 = {s = (S.mkS (S.mkCl S.i_NP St.want_VV (S.mkVP L.read_V2 (S.mkNP S.theSg_Det L.book_N)))).s} ;
    C0373 = {s = (S.mkS (S.mkCl S.he_NP St.want_VV (S.mkVP L.live_V))).s} ;
    C0374 = {s = (S.mkS S.negativePol (S.mkCl S.i_NP St.want_VV (S.mkVP L.come_V))).s} ;
    C0375 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP St.want_VV (S.mkVP L.come_V))).s} ;
    C0376 = {s = (S.mkS (S.mkCl S.i_NP L.say_VS (S.mkS (S.mkCl S.she_NP L.live_V)))).s} ;
    C0377 = {s = (S.mkS (S.mkCl S.i_NP L.know_VQ (S.mkQS (S.mkQCl S.who_IP L.come_V)))).s} ;
    C0378 = {s = (S.mkS (S.mkCl S.i_NP L.answer_V2S S.he_NP (S.mkS (S.mkCl S.she_NP L.live_V)))).s} ;
    C0379 = {s = (S.mkS (S.mkCl S.i_NP L.ask_V2Q S.he_NP (S.mkQS (S.mkQCl S.who_IP L.come_V)))).s} ;
    C0380 = {s = (S.mkS (S.mkCl S.i_NP L.beg_V2V S.he_NP (S.mkVP L.come_V))).s} ;
} ;
