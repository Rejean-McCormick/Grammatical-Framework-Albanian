concrete AlbCampaign021Sqi of AlbCampaign021 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0201 = {s = (L.good_A).s ! Nom ! Masc ! Sg} ;
    C0202 = {s = (L.good_A).s ! Nom ! Fem ! Sg} ;
    C0203 = {s = (L.good_A).s ! Nom ! Masc ! Pl} ;
    C0204 = {s = (L.good_A).s ! Nom ! Fem ! Pl} ;
    C0205 = {s = (L.good_A).s ! Acc ! Masc ! Sg} ;
    C0206 = {s = (L.good_A).s ! Acc ! Fem ! Sg} ;
    C0207 = {s = (L.good_A).s ! Dat ! Masc ! Sg} ;
    C0208 = {s = (L.good_A).s ! Dat ! Fem ! Sg} ;
    C0209 = {s = (L.good_A).s ! Ablat ! Masc ! Pl} ;
    C0210 = {s = (L.good_A).s ! Ablat ! Fem ! Pl} ;
} ;
