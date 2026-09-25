concrete AlbCampaign044Sqi of AlbCampaign044 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  oper
    fiveCasePN = P.mkPN "PN_NOM" "PN_ACC" "PN_GEN" "PN_DAT" "PN_ABL" Masc ;

  lin
    C0431 = {s = (L.john_PN).s ! Nom} ;
    C0432 = {s = (L.john_PN).s ! Acc} ;
    C0433 = {s = (L.paris_PN).s ! Nom} ;
    C0434 = {s = (L.paris_PN).s ! Dat} ;
    C0435 = {s = (S.mkAdv St.in_Prep (S.mkNP L.paris_PN)).s} ;
    C0436 = {s = (S.mkAdv St.from_Prep (S.mkNP L.paris_PN)).s} ;
    C0437 = {s = (S.mkAdv St.with_Prep (S.mkNP L.john_PN)).s} ;
    C0438 = {s = (S.mkAdv St.to_Prep (S.mkNP L.john_PN)).s} ;
    C0439 = {s = (S.mkAdv St.under_Prep (S.mkNP S.theSg_Det L.house_N)).s} ;
    C0440 = {s = (S.mkAdv St.without_Prep S.he_NP).s} ;
    PN5NOM = {s = fiveCasePN.s ! Nom} ;
    PN5ACC = {s = fiveCasePN.s ! Acc} ;
    PN5GEN = {s = fiveCasePN.s ! Gen} ;
    PN5DAT = {s = fiveCasePN.s ! Dat} ;
    PN5ABL = {s = fiveCasePN.s ! Ablat} ;
} ;
