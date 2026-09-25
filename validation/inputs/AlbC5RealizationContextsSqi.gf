concrete AlbC5RealizationContextsSqi of AlbC5RealizationContexts =
  open Prelude, ResSqi, ClauseSqiRes, (P = ParamX), (L = LexiconSqi), (S = SyntaxSqi) in {
  lincat Probe = {s : Str} ;
  oper
    a1 : Agr = {gn=GSg Masc; p=P1} ;
  lin
    C5C01 = {s = realizeVP (S.mkVP L.love_V2 S.it_NP) P.Pres Simul Pos a1} ;
    C5C02 = {s = realizeVP (S.mkVP L.love_V2 S.it_NP) P.Pres Simul Neg a1} ;
    C5C03 = {s = realizeVP (S.mkVP L.love_V2 S.it_NP) P.Pres Anter Pos a1} ;
    C5C04 = {s = realizeVP (S.mkVP L.give_V3 S.it_NP S.she_NP) P.Pres Simul Pos a1} ;
    C5C05 = {s = realizeVP (S.mkVP L.give_V3 S.it_NP S.she_NP) P.Fut Simul Pos a1} ;
    C5C06 = {s = realizeVP (S.mkVP L.give_V3 S.it_NP S.she_NP) P.Cond Simul Neg a1} ;
    C5C07 = {s = realizeSubjVP (S.mkVP L.love_V2 S.it_NP) Pos a1} ;
    C5C08 = {s = realizeSubjVP (S.mkVP L.love_V2 S.it_NP) Neg a1} ;
    C5C09 = {s = realizeVP (S.progressiveVP (S.mkVP L.love_V2 S.it_NP)) P.Pres Simul Pos a1} ;
    C5C10 = {s = realizeVP (S.progressiveVP (S.mkVP L.give_V3 S.it_NP S.she_NP)) P.Pres Simul Neg a1} ;
    C5C11 = {s = (S.mkImp L.read_V2 S.it_NP).s ! Pos ! Sg} ;
    C5C12 = {s = (S.mkImp L.read_V2 S.it_NP).s ! Neg ! Sg} ;
    C5C13 = {s = (S.mkImp L.give_V3 S.it_NP S.she_NP).s ! Pos ! Sg} ;
    C5C14 = {s = (S.mkImp L.give_V3 S.it_NP S.she_NP).s ! Neg ! Pl} ;
} ;
