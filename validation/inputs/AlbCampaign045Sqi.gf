concrete AlbCampaign045Sqi of AlbCampaign045 =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (P = ParadigmsSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C0441 = {s = (S.mkCard "1").s} ;
    C0442 = {s = (S.mkCard "2").s} ;
    C0443 = {s = (S.mkCard "5").s} ;
    C0444 = {s = (S.mkCard "10").s} ;
    C0445 = {s = (S.mkCard "21").s} ;
    C0446 = {s = (S.mkNP (S.mkCard "1") L.book_N).s ! Nom} ;
    C0447 = {s = (S.mkNP (S.mkCard "2") L.book_N).s ! Nom} ;
    C0448 = {s = (S.mkNP (S.mkCard "5") L.book_N).s ! Nom} ;
    C0449 = {s = (S.mkNP (S.mkCard "10") L.house_N).s ! Nom} ;
    C0450 = {s = (S.mkNP (S.mkCard "21") L.city_N).s ! Nom} ;
} ;
