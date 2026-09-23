concrete AlbCampaign046Sqi of AlbCampaign046 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0451 = {s = (S.mkS (S.mkCl L.house_N)).s} ;
    C0452 = {s = (S.mkS (S.mkCl L.city_N)).s} ;
    C0453 = {s = (S.mkS (S.mkCl (S.mkNP S.theSg_Det L.book_N))).s} ;
    C0454 = {s = (S.mkImp L.come_V).s ! Pos ! Sg} ;
    C0455 = {s = (S.mkImp L.come_V).s ! Pos ! Pl} ;
    C0456 = {s = (S.mkImp L.read_V2 S.it_NP).s ! Pos ! Sg} ;
    C0457 = {s = (S.mkImp L.come_V).s ! Neg ! Sg} ;
    C0458 = {s = (S.mkAP L.big_A S.he_NP).s ! Indef ! Nom ! Masc ! Sg} ;
    C0459 = {s = (S.reflAP L.married_A2).s ! Indef ! Nom ! Masc ! Sg} ;
    C0460 = {s = (S.mkNP St.only_Predet S.he_NP).s ! Nom} ;
} ;
