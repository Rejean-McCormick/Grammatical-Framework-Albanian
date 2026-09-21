-- Backward-compatible Extra API implemented on the same rich Albanian core.
--# -path=.:../common:../abstract
concrete ExtraSqi of ExtraSqiAbs = CatSqi **
  open Prelude, ParamX, ResSqi, GrammarSqi, ClauseSqiRes,
       ExtendSqiHelpers, ExtendSqiScaffolding, ExtendSqiAPCN,
       ExtendSqiVPBridge, ExtendSqiVPS, ExtendSqiRNP, (NS=NounSqi), (AS=AdverbSqi) in {

lincat
  VPI = {s : Agr => Str} ;
  [VPI] = {first,last : Agr => Str} ;
  VPS = {s : Agr => Str} ;
  [VPS] = {first,last : Agr => Str} ;
  Foc = {s : ParamX.Tense => Anteriority => Polarity => Str} ;
  RNP = {s : Agr => Case => Str ; isPron : Bool} ;
  RNPList = {first,last : Agr => Case => Str} ;

lin
  GenNP = sc_GenNP ;
  GenIP = sc_GenIP ;
  GenRP = sc_GenRP ;
  CompBareCN = apcn_CompBareCN ;

  PiedPipingQuestSlash = sc_PiedPipingQuestSlash ;
  PiedPipingRelSlash = sc_PiedPipingRelSlash ;
  StrandQuestSlash = sc_StrandQuestSlash ;
  StrandRelSlash = sc_StrandRelSlash ;
  EmptyRelSlash = sc_EmptyRelSlash ;

  MkVPI x1 = lin VPI (vps_MkVPI (lin VP x1)) ;
  BaseVPI x1 x2 = lin ListVPI (vps_BaseVPI (lin VPI x1) (lin VPI x2)) ;
  ConsVPI x1 x2 = lin ListVPI (vps_ConsVPI (lin VPI x1) (lin ListVPI x2)) ;
  ConjVPI x1 x2 = lin VPI (vps_ConjVPI (lin Conj x1) (lin ListVPI x2)) ;
  ComplVPIVV x1 x2 = vps_ComplVPIVV (lin VV x1) (lin VPI x2) ;

  MkVPS x1 x2 x3 = lin VPS (vps_MkVPS (lin Temp x1) (lin Pol x2) (lin VP x3)) ;
  BaseVPS x1 x2 = lin ListVPS (vps_BaseVPS (lin VPS x1) (lin VPS x2)) ;
  ConsVPS x1 x2 = lin ListVPS (vps_ConsVPS (lin VPS x1) (lin ListVPS x2)) ;
  ConjVPS x1 x2 = lin VPS (vps_ConjVPS (lin Conj x1) (lin ListVPS x2)) ;
  PredVPS x1 x2 = vps_PredVPS (lin NP x1) (lin VPS x2) ;

  ProDrop = sc_ProDrop ;
  ICompAP = apcn_ICompAP ;
  IAdvAdv = sc_IAdvAdv ;
  CompIQuant = apcn_CompIQuant ;
  PrepCN prep cn = AS.PrepNP prep (NS.MassNP cn) ;

  FocObj np cl = {s=\\t,a,p =>np.s!Acc ++ cl.s!t!a!p} ;
  FocAdv adv cl = {s=\\t,a,p =>adv.s ++ cl.s!t!a!p} ;
  FocAdV adv cl = {s=\\t,a,p =>adv.s ++ cl.s!t!a!p} ;
  FocAP ap np = {s=\\_,_,_ =>ap.s!Indef!Nom!agrGender np.a!agrNumber np.a ++ np.s!Nom} ;
  FocNeg cl = {s=\\t,a,_ =>cl.s!t!a!Neg} ;
  FocVP vp np = {s=\\t,a,p =>realizeVP vp t a p np.a ++ np.s!Nom} ;
  FocVV vv vp np = {s=\\t,a,p =>
    (PredVP np (ComplVV vv vp)).s!t!a!p
  } ;
  UseFoc t p foc = {s=foc.s!t.t!t.a!p.p} ;

  PartVP = vp_PresPartAP ;
  EmbedPresPart = vp_EmbedPresPart ;
  PassVPSlash = vp_PassVPSlash ;
  PassAgentVPSlash = vp_PassAgentVPSlash ;
  PastPartAP = vp_PastPartAP ;
  PastPartAgentAP = vp_PastPartAgentAP ;
  NominalizeVPSlashNP = vp_NominalizeVPSlashNP ;

  ExistsNP np = ExistNP np ;
  PurposeVP = vp_PurposeVP ;

  ComplBareVS = sc_ComplBareVS ;
  SlashBareV2S = sc_SlashBareV2S ;

  FrontExtPredVP np vp = PredVP np vp ;
  InvFrontExtPredVP np vp = PredVP np vp ;

  AdjAsCN = apcn_AdjAsCN ;

  ReflRNP = rnp_ReflRNP ;
  ReflPron = lin RNP rnp_ReflPron ;
  ReflPoss x1 x2 = lin RNP (rnp_ReflPoss (lin Num x1) (lin CN x2)) ;
  PredetRNP x1 x2 = lin RNP (rnp_PredetRNP (lin Predet x1) (lin RNP x2)) ;
  ConjRNP x1 x2 = lin RNP (rnp_ConjRNP (lin Conj x1) (lin RNPList x2)) ;
  Base_rr_RNP x1 x2 = lin RNPList (rnp_Base_rr_RNP (lin RNP x1) (lin RNP x2)) ;
  Base_nr_RNP x1 x2 = lin RNPList (rnp_Base_nr_RNP (lin NP x1) (lin RNP x2)) ;
  Base_rn_RNP x1 x2 = lin RNPList (rnp_Base_rn_RNP (lin RNP x1) (lin NP x2)) ;
  Cons_rr_RNP x1 x2 = lin RNPList (rnp_Cons_rr_RNP (lin RNP x1) (lin RNPList x2)) ;
  Cons_nr_RNP x1 x2 = lin RNPList (rnp_Cons_nr_RNP (lin NP x1) (lin RNPList x2)) ;

}
