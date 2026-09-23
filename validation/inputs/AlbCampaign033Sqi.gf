concrete AlbCampaign033Sqi of AlbCampaign033 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0321 = {s = (S.mkS St.and_Conj (S.mkS (S.mkCl S.i_NP L.come_V)) (S.mkS (S.mkCl S.she_NP L.live_V))).s} ;
    C0322 = {s = (S.mkS St.or_Conj (S.mkS (S.mkCl S.i_NP L.come_V)) (S.mkS (S.mkCl S.she_NP L.live_V))).s} ;
    C0323 = {s = (S.mkNP St.and_Conj S.he_NP S.she_NP).s ! Nom} ;
    C0324 = {s = (S.mkNP St.or_Conj S.i_NP S.you_NP).s ! Nom} ;
    C0325 = {s = (S.mkAP St.and_Conj (S.mkAP L.good_A) (S.mkAP L.beautiful_A)).s ! Indef ! Nom ! Masc ! Sg} ;
    C0326 = {s = (S.mkAdv St.and_Conj (S.mkAdv St.in_Prep (S.mkNP S.theSg_Det L.house_N)) (S.mkAdv St.with_Prep S.he_NP)).s} ;
    C0327 = {s = (S.mkS St.and_Conj (S.mkS S.pastTense (S.mkCl S.i_NP L.come_V)) (S.mkS (S.mkCl S.she_NP L.live_V))).s} ;
    C0328 = {s = (S.mkS St.and_Conj (S.mkS S.negativePol (S.mkCl S.i_NP L.come_V)) (S.mkS (S.mkCl S.she_NP L.live_V))).s} ;
    C0329 = {s = (S.mkS St.and_Conj (S.mkS St.and_Conj (S.mkS (S.mkCl S.i_NP L.come_V)) (S.mkS (S.mkCl S.she_NP L.live_V))) (S.mkS (S.mkCl S.he_NP L.go_V))).s} ;
    C0330 = {s = (S.mkNP S.theSg_Det (S.mkCN L.big_A L.house_N)).s ! Nom} ;
} ;
