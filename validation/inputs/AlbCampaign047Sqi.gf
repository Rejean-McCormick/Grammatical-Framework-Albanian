concrete AlbCampaign047Sqi of AlbCampaign047 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0461 = {s = (S.mkNP L.beer_N).s ! Nom} ;
    C0462 = {s = (S.mkNP S.theSg_Det (S.mkCN L.big_A L.house_N)).s ! Nom} ;
    C0463 = {s = (S.mkNP S.theSg_Det (S.mkCN L.beautiful_A L.city_N)).s ! Nom} ;
    C0464 = {s = (S.mkNP S.theSg_Det (S.mkCN L.house_N (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.city_N)))).s ! Nom} ;
    C0465 = {s = (S.mkNP (S.mkNP L.john_PN) (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.city_N))).s ! Nom} ;
    C0466 = {s = (S.mkNP St.i_Pron L.book_N).s ! Nom} ;
    C0467 = {s = (S.mkNP St.he_Pron L.house_N).s ! Nom} ;
    C0468 = {s = (S.mkNP St.someSg_Det L.house_N).s ! Nom} ;
    C0469 = {s = (S.mkNP St.many_Det L.book_N).s ! Nom} ;
    C0470 = {s = (S.mkNP St.every_Det L.city_N).s ! Nom} ;
} ;
