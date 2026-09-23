concrete AlbCampaign001Sqi of AlbCampaign001 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0001 = {s = (L.book_N).s ! Indef ! Nom ! Sg} ;
    C0002 = {s = (L.book_N).s ! Def ! Nom ! Sg} ;
    C0003 = {s = (L.book_N).s ! Indef ! Acc ! Sg} ;
    C0004 = {s = (L.book_N).s ! Def ! Acc ! Sg} ;
    C0005 = {s = (L.book_N).s ! Indef ! Dat ! Sg} ;
    C0006 = {s = (L.book_N).s ! Def ! Dat ! Sg} ;
    C0007 = {s = (L.book_N).s ! Indef ! Ablat ! Sg} ;
    C0008 = {s = (L.book_N).s ! Def ! Ablat ! Sg} ;
    C0009 = {s = (L.book_N).s ! Indef ! Nom ! Pl} ;
    C0010 = {s = (L.book_N).s ! Def ! Acc ! Pl} ;
} ;
