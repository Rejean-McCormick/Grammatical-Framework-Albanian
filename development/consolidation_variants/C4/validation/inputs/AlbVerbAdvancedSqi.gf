concrete AlbVerbAdvancedSqi of AlbVerbAdvanced = GrammarSqi **
  open Prelude, (P=ParamX), (R=ResSqi), (C=ClauseSqiRes),
       (L=LexiconSqi), (I=IrregSqi), (S=SyntaxSqi), (D=ParadigmsSqi) in {
  lincat Probe = {s : Str} ;
  oper
    a3 : R.Agr = R.agrgP3 R.Masc P.Sg ;
    a3pl : R.Agr = R.agrgP3 R.Masc P.Pl ;
    vpCome : R.VP = lin VP (UseV L.come_V) ;
    vpBecome : R.VP = lin VP (UseV (lin V I.behem_V)) ;
    vpProgCome : R.VP = lin VP (ProgrVP (UseV L.come_V)) ;
    vpProgBecome : R.VP = lin VP (ProgrVP (UseV (lin V I.behem_V))) ;
    vpEatIt : R.VP = lin VP (ComplSlash (SlashV2a L.eat_V2) S.it_NP) ;
    vpPassWrite : R.VP = lin VP (PassV2 L.write_V2) ;
    vpReflWash : R.VP = lin VP (ReflVP (SlashV2a L.wash_V2)) ;
    vpWashNA : R.VP = lin VP (UseV (D.mkV "lahem")) ;
  lin
    V001 = {s = C.realizeVP vpCome P.Pres P.Simul P.Pos a3} ; -- active pres simul pos
    V002 = {s = C.realizeVP vpCome P.Pres P.Simul P.Neg a3} ; -- active pres simul neg
    V003 = {s = C.realizeVP vpCome P.Pres P.Anter P.Pos a3} ; -- active pres anter pos
    V004 = {s = C.realizeVP vpCome P.Pres P.Anter P.Neg a3} ; -- active pres anter neg
    V005 = {s = C.realizeVP vpCome P.Past P.Simul P.Pos a3} ; -- active past simul pos
    V006 = {s = C.realizeVP vpCome P.Past P.Simul P.Neg a3} ; -- active past simul neg
    V007 = {s = C.realizeVP vpCome P.Past P.Anter P.Pos a3} ; -- active past anter pos
    V008 = {s = C.realizeVP vpCome P.Past P.Anter P.Neg a3} ; -- active past anter neg
    V009 = {s = C.realizeVP vpCome P.Fut P.Simul P.Pos a3} ; -- active fut simul pos
    V010 = {s = C.realizeVP vpCome P.Fut P.Simul P.Neg a3} ; -- active fut simul neg
    V011 = {s = C.realizeVP vpCome P.Fut P.Anter P.Pos a3} ; -- active fut anter pos
    V012 = {s = C.realizeVP vpCome P.Fut P.Anter P.Neg a3} ; -- active fut anter neg
    V013 = {s = C.realizeVP vpCome P.Cond P.Simul P.Pos a3} ; -- active cond simul pos
    V014 = {s = C.realizeVP vpCome P.Cond P.Simul P.Neg a3} ; -- active cond simul neg
    V015 = {s = C.realizeVP vpCome P.Cond P.Anter P.Pos a3} ; -- active cond anter pos
    V016 = {s = C.realizeVP vpCome P.Cond P.Anter P.Neg a3} ; -- active cond anter neg
    V017 = {s = C.realizeVP vpBecome P.Pres P.Simul P.Pos a3} ; -- nonactive pres simul pos
    V018 = {s = C.realizeVP vpBecome P.Pres P.Simul P.Neg a3} ; -- nonactive pres simul neg
    V019 = {s = C.realizeVP vpBecome P.Pres P.Anter P.Pos a3} ; -- nonactive pres anter pos
    V020 = {s = C.realizeVP vpBecome P.Pres P.Anter P.Neg a3} ; -- nonactive pres anter neg
    V021 = {s = C.realizeVP vpBecome P.Past P.Simul P.Pos a3} ; -- nonactive past simul pos
    V022 = {s = C.realizeVP vpBecome P.Past P.Simul P.Neg a3} ; -- nonactive past simul neg
    V023 = {s = C.realizeVP vpBecome P.Past P.Anter P.Pos a3} ; -- nonactive past anter pos
    V024 = {s = C.realizeVP vpBecome P.Past P.Anter P.Neg a3} ; -- nonactive past anter neg
    V025 = {s = C.realizeVP vpBecome P.Fut P.Simul P.Pos a3} ; -- nonactive fut simul pos
    V026 = {s = C.realizeVP vpBecome P.Fut P.Simul P.Neg a3} ; -- nonactive fut simul neg
    V027 = {s = C.realizeVP vpBecome P.Fut P.Anter P.Pos a3} ; -- nonactive fut anter pos
    V028 = {s = C.realizeVP vpBecome P.Fut P.Anter P.Neg a3} ; -- nonactive fut anter neg
    V029 = {s = C.realizeVP vpBecome P.Cond P.Simul P.Pos a3} ; -- nonactive cond simul pos
    V030 = {s = C.realizeVP vpBecome P.Cond P.Simul P.Neg a3} ; -- nonactive cond simul neg
    V031 = {s = C.realizeVP vpBecome P.Cond P.Anter P.Pos a3} ; -- nonactive cond anter pos
    V032 = {s = C.realizeVP vpBecome P.Cond P.Anter P.Neg a3} ; -- nonactive cond anter neg
    V033 = {s = C.realizeVP vpProgCome P.Pres P.Simul P.Pos a3} ; -- progressive active pres pos
    V034 = {s = C.realizeVP vpProgCome P.Pres P.Simul P.Neg a3} ; -- progressive active pres neg
    V035 = {s = C.realizeVP vpProgCome P.Past P.Simul P.Pos a3} ; -- progressive active past pos
    V036 = {s = C.realizeVP vpProgCome P.Past P.Simul P.Neg a3} ; -- progressive active past neg
    V037 = {s = C.realizeVP vpProgBecome P.Pres P.Simul P.Pos a3} ; -- progressive nonactive pres pos
    V038 = {s = C.realizeVP vpProgBecome P.Pres P.Simul P.Neg a3} ; -- progressive nonactive pres neg
    V039 = {s = C.realizeVP vpProgBecome P.Past P.Simul P.Pos a3} ; -- progressive nonactive past pos
    V040 = {s = C.realizeVP vpProgBecome P.Past P.Simul P.Neg a3} ; -- progressive nonactive past neg
    V041 = {s = C.realizeSubjAntVP vpCome P.Simul P.Pos a3} ; -- subjunctive active simul pos
    V042 = {s = C.realizeSubjAntVP vpCome P.Simul P.Neg a3} ; -- subjunctive active simul neg
    V043 = {s = C.realizeSubjAntVP vpCome P.Anter P.Pos a3} ; -- subjunctive active anter pos
    V044 = {s = C.realizeSubjAntVP vpCome P.Anter P.Neg a3} ; -- subjunctive active anter neg
    V045 = {s = C.realizeSubjAntVP vpBecome P.Simul P.Pos a3} ; -- subjunctive nonactive simul pos
    V046 = {s = C.realizeSubjAntVP vpBecome P.Simul P.Neg a3} ; -- subjunctive nonactive simul neg
    V047 = {s = C.realizeSubjAntVP vpBecome P.Anter P.Pos a3} ; -- subjunctive nonactive anter pos
    V048 = {s = C.realizeSubjAntVP vpBecome P.Anter P.Neg a3} ; -- subjunctive nonactive anter neg
    V049 = {s = C.realizeImpVP vpCome P.Pos P.Sg} ; -- imperative active pos
    V050 = {s = C.realizeImpVP vpCome P.Neg P.Sg} ; -- imperative active neg
    V051 = {s = C.realizeImpVP vpBecome P.Pos P.Sg} ; -- imperative nonactive pos
    V052 = {s = C.realizeImpVP vpBecome P.Neg P.Sg} ; -- imperative nonactive neg
    V053 = {s = C.realizeAoristVP vpCome P.Pos a3} ; -- aorist active pos
    V054 = {s = C.realizeAoristAnteriorVP vpCome P.Pos a3} ; -- aorist-anterior active pos
    V055 = {s = C.realizeAoristVP vpCome P.Neg a3} ; -- aorist active neg
    V056 = {s = C.realizeAoristAnteriorVP vpCome P.Neg a3} ; -- aorist-anterior active neg
    V057 = {s = C.realizeAoristVP vpBecome P.Pos a3} ; -- aorist nonactive pos
    V058 = {s = C.realizeAoristAnteriorVP vpBecome P.Pos a3} ; -- aorist-anterior nonactive pos
    V059 = {s = C.realizeAoristVP vpBecome P.Neg a3} ; -- aorist nonactive neg
    V060 = {s = C.realizeAoristAnteriorVP vpBecome P.Neg a3} ; -- aorist-anterior nonactive neg
    V061 = {s = C.realizeOptativeVP vpCome a3} ; -- optative active
    V062 = {s = C.realizePerfectOptativeVP vpCome a3} ; -- perfect-optative active
    V063 = {s = C.realizeAdmirativeVP vpCome a3} ; -- admirative active
    V064 = {s = C.realizeImperfectAdmirativeVP vpCome a3} ; -- imperfect-admirative active
    V065 = {s = C.realizeOptativeVP vpBecome a3} ; -- optative nonactive
    V066 = {s = C.realizePerfectOptativeVP vpBecome a3} ; -- perfect-optative nonactive
    V067 = {s = C.realizeAdmirativeVP vpBecome a3} ; -- admirative nonactive
    V068 = {s = C.realizeImperfectAdmirativeVP vpBecome a3} ; -- imperfect-admirative nonactive
    V069 = {s = C.realizeVP vpEatIt P.Pres P.Simul P.Pos a3} ; -- clitic present
    V070 = {s = C.realizeVP vpEatIt P.Pres P.Anter P.Pos a3} ; -- clitic present perfect
    V071 = {s = C.realizeVP vpEatIt P.Fut P.Simul P.Pos a3} ; -- clitic future
    V072 = {s = C.realizeVP vpEatIt P.Fut P.Simul P.Neg a3} ; -- clitic future negative
    V073 = {s = C.realizeVP vpEatIt P.Fut P.Anter P.Pos a3} ; -- clitic future anterior
    V074 = {s = C.realizeSubjVP vpEatIt P.Pos a3} ; -- clitic subjunctive
    V075 = {s = C.realizeSubjVP vpEatIt P.Neg a3} ; -- clitic subjunctive negative
    V076 = {s = C.realizeImpVP vpEatIt P.Pos P.Sg} ; -- clitic imperative
    V077 = {s = C.realizeImpVP vpEatIt P.Neg P.Sg} ; -- clitic imperative negative
    V078 = {s = C.realizePurposeVP vpEatIt P.Pos a3} ; -- purpose
    V079 = {s = C.realizePurposeVP vpEatIt P.Neg a3} ; -- purpose negative
    V080 = {s = C.realizeGerundPolVP vpEatIt P.Pos a3} ; -- gerund
    V081 = {s = C.realizeGerundPolVP vpEatIt P.Neg a3} ; -- gerund negative
    V082 = {s = C.realizeVP vpPassWrite P.Pres P.Simul P.Pos a3} ; -- analytic passive present
    V083 = {s = C.realizeVP vpPassWrite P.Past P.Simul P.Pos a3} ; -- analytic passive past
    V084 = {s = C.realizeVP vpPassWrite P.Fut P.Simul P.Pos a3} ; -- analytic passive future
    V085 = {s = C.realizeVP vpPassWrite P.Cond P.Simul P.Pos a3} ; -- analytic passive conditional
    V086 = {s = C.realizeVP vpPassWrite P.Pres P.Anter P.Pos a3} ; -- analytic passive anterior
    V087 = {s = C.realizeVP vpReflWash P.Pres P.Simul P.Pos a3} ; -- reflexive present
    V088 = {s = C.realizeVP vpReflWash P.Past P.Simul P.Pos a3} ; -- reflexive past
    V089 = {s = C.realizeVP vpReflWash P.Fut P.Simul P.Pos a3} ; -- reflexive future
    V090 = {s = C.realizeExist P.Pres P.Simul P.Pos} ; -- existential pres
    V091 = {s = C.realizeExist P.Past P.Simul P.Pos} ; -- existential past/imperfect
    V092 = {s = C.realizeExist P.Fut P.Simul P.Pos} ; -- existential future
    V093 = {s = C.realizeExist P.Cond P.Simul P.Pos} ; -- existential conditional
    V094 = {s = C.realizeExist P.Pres P.Anter P.Pos} ; -- existential perfect
    V095 = {s = C.realizeExist P.Past P.Anter P.Pos} ; -- existential pluperfect
    V096 = {s = C.realizeExist P.Fut P.Anter P.Pos} ; -- existential future perfect
    V097 = {s = C.realizeExist P.Cond P.Anter P.Neg} ; -- existential conditional perfect negative
    V098 = {s = C.realizeVP vpWashNA P.Pres P.Simul P.Pos a3pl} ; -- nonactive reciprocal-capable surface
}
