concrete AlbClauseFinalSqi of AlbClauseFinal =
  open Prelude, ResSqi, (L = LexiconSqi), (S = SyntaxSqi), (St = StructuralSqi) in {
  lincat Probe = {s : Str} ;
  lin
    C7F001 = {s = (S.mkS (S.mkCl S.she_NP L.love_V2 S.he_NP)).s} ;
    C7F002 = {s = (S.mkS S.negativePol (S.mkCl S.she_NP L.love_V2 S.he_NP)).s} ;
    C7F003 = {s = (S.mkS S.futureTense S.negativePol (S.mkCl S.she_NP L.come_V)).s} ;
    C7F004 = {s = (S.mkQS (S.mkCl S.she_NP L.come_V)).s} ;
    C7F005 = {s = (S.mkQS (S.mkQCl S.who_IP L.come_V)).s} ;
    C7F006 = {s = (S.mkQS (S.mkQCl S.who_IP S.she_NP L.love_V2)).s} ;
    C7F007 = {s = (S.mkQS (S.mkQCl St.with_Prep S.who_IP (S.mkCl S.she_NP L.live_V))).s} ;
    C7F008 = {s = (S.mkRS (S.mkRCl S.which_RP L.come_V)).s ! (S.he_NP).a} ;
    C7F009 = {s = (S.mkRS (S.mkRCl S.which_RP S.she_NP L.love_V2)).s ! (S.he_NP).a} ;
    C7F010 = {s = (S.mkS (S.mkAdv St.because_Subj (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkS (S.mkCl S.i_NP L.live_V))).s} ;
    C7F011 = {s = (S.mkS (S.mkCl S.i_NP L.say_VS (S.mkS (S.mkCl S.she_NP L.live_V)))).s} ;
    C7F012 = {s = (S.mkAP (S.mkAP L.good_A) (S.mkS (S.mkCl S.she_NP L.come_V))).s ! Indef ! Nom ! Fem ! Sg} ;
    C7F013 = {s = (S.mkAP (S.mkAP L.good_A) (S.mkVP L.come_V)).s ! Indef ! Nom ! Fem ! Sg} ;
    C7F014 = {s = (S.mkS (S.mkCl (S.mkSC (S.mkS (S.mkCl S.she_NP L.come_V))) (S.mkVP L.good_A))).s} ;
    C7F015 = {s = (S.mkRS (S.mkRCl S.which_RP (S.mkClSlash (S.mkCl S.she_NP L.live_V) St.with_Prep))).s ! (S.he_NP).a} ;
    C7F016 = {s = (S.mkS (S.mkCl (S.mkSC (S.mkQS (S.mkQCl (S.mkCl S.she_NP L.come_V)))) (S.mkVP L.good_A))).s} ;
    C7F017 = {s = (S.mkS (S.mkCl S.i_NP L.know_VQ (S.mkQS (S.mkQCl S.who_IP L.come_V)))).s} ;
    C7F018 = {s = (S.mkS (S.mkCl (S.mkNP L.john_PN) (S.mkVP (S.mkVP L.live_V) (S.mkAdv St.in_Prep (S.mkNP L.paris_PN))))).s} ;
} ;
