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
  GenNP x1 = sc_GenNP (lin NP x1) ;
  GenIP x1 = sc_GenIP (lin IP x1) ;
  GenRP x1 x2 = sc_GenRP (lin Num x1) (lin CN x2) ;
  CompBareCN x1 = apcn_CompBareCN (lin CN x1) ;

  PiedPipingQuestSlash x1 x2 = sc_PiedPipingQuestSlash (lin IP x1) (lin ClSlash x2) ;
  PiedPipingRelSlash x1 x2 = sc_PiedPipingRelSlash (lin RP x1) (lin ClSlash x2) ;
  StrandQuestSlash x1 x2 = sc_StrandQuestSlash (lin IP x1) (lin ClSlash x2) ;
  StrandRelSlash x1 x2 = sc_StrandRelSlash (lin RP x1) (lin ClSlash x2) ;
  EmptyRelSlash x1 = sc_EmptyRelSlash (lin ClSlash x1) ;

  MkVPI x1 = lin VPI (vps_MkVPI (lin VP x1)) ;
  BaseVPI x1 x2 = lin ListVPI (vps_BaseVPI (lin VPI x1) (lin VPI x2)) ;
  ConsVPI x1 x2 = lin ListVPI (vps_ConsVPI (lin VPI x1) (lin ListVPI x2)) ;
  ConjVPI x1 x2 = lin VPI (vps_ConjVPI (lin Conj x1) (lin ListVPI x2)) ;
  ComplVPIVV x1 x2 = lin VP (vps_ComplVPIVV (lin VV x1) (lin VPI x2)) ;

  MkVPS x1 x2 x3 = lin VPS (vps_MkVPS (lin Temp x1) (lin Pol x2) (lin VP x3)) ;
  BaseVPS x1 x2 = lin ListVPS (vps_BaseVPS (lin VPS x1) (lin VPS x2)) ;
  ConsVPS x1 x2 = lin ListVPS (vps_ConsVPS (lin VPS x1) (lin ListVPS x2)) ;
  ConjVPS x1 x2 = lin VPS (vps_ConjVPS (lin Conj x1) (lin ListVPS x2)) ;
  PredVPS x1 x2 = vps_PredVPS (lin NP x1) (lin VPS x2) ;

  ProDrop x1 = sc_ProDrop (lin Pron x1) ;
  ICompAP x1 = apcn_ICompAP (lin AP x1) ;
  IAdvAdv x1 = sc_IAdvAdv (lin Adv x1) ;
  CompIQuant x1 = apcn_CompIQuant (lin IQuant x1) ;
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

  -- Albanian-specific TAM/mood surface.  These functions intentionally live
  -- in ExtraSqiAbs so common RGL TPast keeps its imperfect semantics.
  AlbAoristS p np vp = {s=np.s!Nom ++ realizeAoristVP vp p.p np.a} ;
  AlbAoristAnteriorS p np vp = {s=np.s!Nom ++ realizeAoristAnteriorVP vp p.p np.a} ;
  AlbOptativeS np vp = {s=np.s!Nom ++ realizeOptativeVP vp np.a} ;
  AlbPerfectOptativeS np vp = {s=np.s!Nom ++ realizePerfectOptativeVP vp np.a} ;
  AlbAdmirativeS np vp = {s=np.s!Nom ++ realizeAdmirativeVP vp np.a} ;
  AlbImperfectAdmirativeS np vp = {s=np.s!Nom ++ realizeImperfectAdmirativeVP vp np.a} ;
  AlbGerundAdv p vp = {s=realizeGerundPolVP vp p.p agrMascSg} ;
  AlbPurposeAdv p vp = {s=realizePurposeVP vp p.p agrMascSg} ;

  PartVP x1 = vp_PresPartAP (lin VP x1) ;
  EmbedPresPart x1 = vp_EmbedPresPart (lin VP x1) ;
  PassVPSlash x1 = lin VP (vp_PassVPSlash (lin VPSlash x1)) ;
  PassAgentVPSlash x1 x2 = lin VP (vp_PassAgentVPSlash (lin VPSlash x1) (lin NP x2)) ;
  PastPartAP x1 = vp_PastPartAP (lin VPSlash x1) ;
  PastPartAgentAP x1 x2 = vp_PastPartAgentAP (lin VPSlash x1) (lin NP x2) ;
  NominalizeVPSlashNP x1 x2 = vp_NominalizeVPSlashNP (lin VPSlash x1) (lin NP x2) ;

  ExistsNP np = ExistNP np ;
  PurposeVP x1 = vp_PurposeVP (lin VP x1) ;

  ComplBareVS x1 x2 = lin VP (sc_ComplBareVS (lin VS x1) (lin S x2)) ;
  SlashBareV2S x1 x2 = lin VPSlash (sc_SlashBareV2S (lin V2S x1) (lin S x2)) ;

  FrontExtPredVP np vp = PredVP np vp ;
  InvFrontExtPredVP np vp = PredVP np vp ;

  AdjAsCN x1 = apcn_AdjAsCN (lin AP x1) ;

  ReflRNP x1 x2 = lin VP (rnp_ReflRNP (lin VPSlash x1) (lin RNP x2)) ;
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
