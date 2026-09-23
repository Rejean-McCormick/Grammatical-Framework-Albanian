concrete AlbCampaign042Sqi of AlbCampaign042 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0411 = {s = (S.mkRS (S.mkRCl S.which_RP S.i_NP L.love_V2)).s ! (S.he_NP).a} ;
    C0412 = {s = (S.mkRS (S.mkRCl S.which_RP S.she_NP L.know_V2)).s ! (S.he_NP).a} ;
    C0413 = {s = (S.mkRS (S.mkRCl S.which_RP S.we_NP L.hear_V2)).s ! (S.he_NP).a} ;
    C0414 = {s = (S.mkRS (S.mkRCl S.which_RP S.they_NP L.hate_V2)).s ! (S.he_NP).a} ;
    C0415 = {s = (S.mkRS (S.mkRCl S.which_RP S.he_NP L.find_V2)).s ! (S.he_NP).a} ;
    C0416 = {s = (S.mkNP S.theSg_Det (S.mkCN L.man_N (S.mkRS (S.mkRCl S.which_RP S.i_NP L.love_V2)))).s ! Nom} ;
    C0417 = {s = (S.mkNP S.theSg_Det (S.mkCN L.girl_N (S.mkRS (S.mkRCl S.which_RP S.he_NP L.know_V2)))).s ! Nom} ;
    C0418 = {s = (S.mkNP S.theSg_Det (S.mkCN L.book_N (S.mkRS (S.mkRCl S.which_RP S.i_NP L.read_V2)))).s ! Nom} ;
    C0419 = {s = (S.mkNP S.theSg_Det (S.mkCN L.city_N (S.mkRS (S.mkRCl S.which_RP S.she_NP L.know_V2)))).s ! Nom} ;
    C0420 = {s = (S.mkNP S.theSg_Det (S.mkCN L.friend_N (S.mkRS (S.mkRCl S.which_RP S.we_NP L.love_V2)))).s ! Nom} ;
} ;
