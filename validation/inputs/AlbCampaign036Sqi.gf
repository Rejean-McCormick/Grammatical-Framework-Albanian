concrete AlbCampaign036Sqi of AlbCampaign036 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0351 = {s = (S.mkS (S.mkCl S.i_NP L.give_V3 S.it_NP S.he_NP)).s} ;
    C0352 = {s = (S.mkS (S.mkCl S.i_NP L.give_V3 S.it_NP S.she_NP)).s} ;
    C0353 = {s = (S.mkS (S.mkCl S.i_NP L.give_V3 S.he_NP S.it_NP)).s} ;
    C0354 = {s = (S.mkS (S.mkCl S.i_NP L.send_V3 S.it_NP S.they_NP)).s} ;
    C0355 = {s = (S.mkS (S.mkCl S.i_NP L.sell_V3 S.it_NP S.he_NP)).s} ;
    C0356 = {s = (S.mkS S.negativePol (S.mkCl S.i_NP L.give_V3 S.it_NP S.he_NP)).s} ;
    C0357 = {s = (S.mkS S.pastTense (S.mkCl S.i_NP L.give_V3 S.it_NP S.he_NP)).s} ;
    C0358 = {s = (S.mkS S.futureTense (S.mkCl S.i_NP L.give_V3 S.it_NP S.she_NP)).s} ;
    C0359 = {s = (S.mkS S.conditionalTense (S.mkCl S.i_NP L.send_V3 S.it_NP S.they_NP)).s} ;
    C0360 = {s = (S.mkS S.pastTense S.negativePol (S.mkCl S.i_NP L.sell_V3 S.it_NP S.he_NP)).s} ;
} ;
