concrete AlbCampaign021Sqi of AlbCampaign021 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0201 = {s = adjForm (L.good_A) Masc Sg} ;
    C0202 = {s = adjForm (L.good_A) Fem Sg} ;
    C0203 = {s = adjForm (L.good_A) Masc Pl} ;
    C0204 = {s = adjForm (L.good_A) Fem Pl} ;
    C0205 = {s = adjForm (L.good_A) Masc Sg} ;
    C0206 = {s = adjForm (L.good_A) Fem Sg} ;
    C0207 = {s = adjForm (L.good_A) Masc Sg} ;
    C0208 = {s = adjForm (L.good_A) Fem Sg} ;
    C0209 = {s = adjForm (L.good_A) Masc Pl} ;
    C0210 = {s = adjForm (L.good_A) Fem Pl} ;
    ADJNYJ1 = {s = nyje ! Indef ! Nom ! Fem ! Pl} ;
    ADJNYJ2 = {s = nyje ! Indef ! Gen ! Fem ! Sg} ;
    ADJNYJ3 = {s = realizeAdj (L.good_A) Indef Gen Fem Sg} ;
    ADJNYJ4 = {s = realizeAdj (P.unartA L.good_A) Indef Gen Fem Sg} ;
} ;
