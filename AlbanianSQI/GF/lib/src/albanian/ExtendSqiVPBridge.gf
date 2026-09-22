-- Bridges between rich Albanian VP/VPSlash values and extension categories.
resource ExtendSqiVPBridge =
  open Prelude, GrammarSqi, CatSqi, ClauseSqiRes,
       (R = ResSqi), (P = ParamX), (PS = ParadigmsSqi),
       ExtendSqiHelpers, (NS = NounSqi), (AS = AdverbSqi), (I = IrregSqi) in {

oper
  vp_agentAdv : NP -> Adv = \np ->
    AS.PrepNP (PS.mkPrep "nga" R.Ablat) np ;

  vp_PresPartAP : VP -> AP = \vp -> lin AP {
    s=\\_,_,_,_ =>realizeGerundVP vp agrMascSg
  } ;

  vp_EmbedPresPart : VP -> SC = \vp -> lin SC {
    s=realizeGerundVP vp agrMascSg
  } ;

  vp_EmbedSSlash : SSlash -> SC = \sslash -> lin SC {
    s="çfarë" ++ sslash.s
  } ;

  vp_PastPartAP : VPSlash -> AP = \sl -> lin AP {
    s=\\_,_,g,n =>sl.participle ++ sl.post!(R.agrgP3 g n)
  } ;

  vp_PastPartAgentAP : VPSlash -> NP -> AP = \sl,np -> lin AP {
    s=\\_,_,g,n =>sl.participle ++ sl.post!(R.agrgP3 g n) ++ (vp_agentAdv np).s
  } ;

  vp_PassVPSlash : VPSlash -> VP = \sl ->
    appendVP (emptyVP (lin Verb I.jam_V))
      (\\a =>sl.participle ++ sl.post!a) ;

  vp_PassAgentVPSlash : VPSlash -> NP -> VP = \sl,np ->
    appendVP (vp_PassVPSlash sl) (\\_ => (vp_agentAdv np).s) ;

  vp_NominalizeVPSlashNP : VPSlash -> NP -> NP = \sl,np ->
    let vp : VP = ComplSlash sl np
    in lin NP {
      s=\\_ =>realizeGerundVP vp agrMascSg ;
      acc_clit=[] ; dat_clit=[] ; a=agrMascSg ; isPron=False
    } ;

  vp_ProgrVPSlash : VPSlash -> VPSlash = \sl -> sl ** {
    cl="po" ++ sl.cl ;
    subjcl="të" ++ "po" ++ sl.cl
  } ;

  vp_A2VPSlash : A2 -> VPSlash = \a2 ->
    slashFromVP
      (appendVP (emptyVP (lin Verb I.jam_V)) (CompAP (UseA2 a2)).s)
      a2.c2 ;

  vp_N2VPSlash : N2 -> VPSlash = \n2 ->
    slashFromVP
      (appendVP (emptyVP (lin Verb I.jam_V)) (CompCN (UseN2 n2)).s)
      n2.c2 ;

  vp_AdvIsNP : Adv -> NP -> Cl = \adv,np ->
    PredVP np (UseComp (CompAdv adv)) ;

  vp_AdvIsNPAP : Adv -> NP -> AP -> Cl = \adv,np,ap ->
    PredVP np (AdvVP (UseComp (CompAP ap)) adv) ;

  -- për të + participle is the productive Standard-Albanian purpose form.
  vp_PurposeVP : VP -> Adv = \vp -> lin Adv {
    s="për" ++ vp.subjcl ++
      vp.participle ++ vp.post!agrMascSg
  } ;

  vp_WithoutVP : VP -> Adv = \vp -> lin Adv {
    s="pa" ++ vp.cl ++ vp.participle ++ vp.post!agrMascSg
  } ;

  vp_ByVP : VP -> Adv = \vp -> lin Adv {
    s=realizeGerundVP vp agrMascSg
  } ;

  vp_InOrderToVP : VP -> Adv = \vp -> lin Adv {
    s="që" ++ realizeSubjVP vp P.Pos agrMascSg
  } ;

  vp_CompoundAP : N -> A -> AP = \n,a ->
    AdvAP (PositA a) (AS.PrepNP (PS.mkPrep "nga" R.Ablat) (NS.MassNP (UseN n))) ;

}
