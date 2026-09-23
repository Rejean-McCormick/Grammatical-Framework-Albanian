concrete AlbCampaign043Sqi of AlbCampaign043 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0421 = {s = (S.mkS (S.mkAdv St.when_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS (S.mkCl S.i_NP L.live_V))).s} ;
    C0422 = {s = (S.mkS (S.mkAdv St.because_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS (S.mkCl S.i_NP L.live_V))).s} ;
    C0423 = {s = (S.mkS (S.mkAdv St.although_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS (S.mkCl S.i_NP L.go_V))).s} ;
    C0424 = {s = (S.mkS (S.mkAdv St.if_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS (S.mkCl S.i_NP L.go_V))).s} ;
    C0425 = {s = (S.mkS (S.mkAdv St.when_Subj (S.mkS (S.mkCl S.he_NP L.live_V))) (S.mkS (S.mkCl S.she_NP L.come_V))).s} ;
    C0426 = {s = (S.mkS (S.mkAdv St.because_Subj (S.mkS (S.mkCl S.he_NP L.live_V))) (S.mkS (S.mkCl S.she_NP L.come_V))).s} ;
    C0427 = {s = (S.mkS (S.mkAdv St.when_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS S.negativePol (S.mkCl S.i_NP L.go_V))).s} ;
    C0428 = {s = (S.mkS (S.mkAdv St.when_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS S.pastTense (S.mkCl S.i_NP L.go_V))).s} ;
    C0429 = {s = (S.mkS (S.mkAdv St.if_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS S.futureTense (S.mkCl S.i_NP L.go_V))).s} ;
    C0430 = {s = (S.mkS (S.mkAdv St.if_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS S.conditionalTense (S.mkCl S.i_NP L.go_V))).s} ;
} ;
