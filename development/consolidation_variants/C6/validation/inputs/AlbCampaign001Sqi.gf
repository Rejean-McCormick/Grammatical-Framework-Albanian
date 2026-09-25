concrete AlbCampaign001Sqi of AlbCampaign001 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  oper
    showGender : Gender -> Str = \g -> case g of {Masc => "Masc" ; Fem => "Fem"} ;
    simbolAmbig = P.mkNAmbig (P.mkN "simbol") Masc Fem ;

  lin
    C0001 = {s = nounForm (L.book_N) Indef Nom Sg} ;
    C0002 = {s = nounForm (L.book_N) Def Nom Sg} ;
    C0003 = {s = nounForm (L.book_N) Indef Acc Sg} ;
    C0004 = {s = nounForm (L.book_N) Def Acc Sg} ;
    C0005 = {s = nounForm (L.book_N) Indef Dat Sg} ;
    C0006 = {s = nounForm (L.book_N) Def Dat Sg} ;
    C0007 = {s = nounForm (L.book_N) Indef Ablat Sg} ;
    C0008 = {s = nounForm (L.book_N) Def Ablat Sg} ;
    C0009 = {s = nounForm (L.book_N) Indef Nom Pl} ;
    C0010 = {s = nounForm (L.book_N) Def Acc Pl} ;
    NOMGEN1 = {s = nounForm (L.book_N) Indef Gen Sg} ;
    NOMGEN2 = {s = nounForm (L.book_N) Def Gen Sg} ;
    NOMAGR1 = {s = showGender (simbolAmbig.g ! Sg)} ;
    NOMAGR2 = {s = showGender (simbolAmbig.g ! Pl)} ;
} ;
