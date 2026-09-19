-- Backward-compatible Extra API implemented on the same rich Albanian core.
--# -path=.:../common:../abstract
concrete ExtraSqi of ExtraSqiAbs = CatSqi **
  open Prelude, ParamX, ResSqi, GrammarSqi, ClauseSqiRes,
       ExtendSqiHelpers, ExtendSqiScaffolding, ExtendSqiAPCN,
       ExtendSqiVPBridge, ExtendSqiRNP, (NS=NounSqi), (AS=AdverbSqi) in {

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

  MkVPI vp = {s=\a=>realizeSubjVP vp Pos a} ;
  BaseVPI x y = {first=x.s;last=y.s} ;
  ConsVPI x xs = {first=\a=>x.s!a ++ "," ++ xs.first!a;last=xs.last} ;
  ConjVPI c xs = {s=\a=>xs.first!a ++ c.s ++ xs.last!a} ;
  ComplVPIVV vv x = appendVP (emptyVP vv) (\a=>x.s!a) ;

  MkVPS t p vp = {s=\a=>realizeVP vp t.t t.a p.p a} ;
  BaseVPS x y = {first=x.s;last=y.s} ;
  ConsVPS x xs = {first=\a=>x.s!a ++ "," ++ xs.first!a;last=xs.last} ;
  ConjVPS c xs = {s=\a=>xs.first!a ++ c.s ++ xs.last!a} ;
  PredVPS np x = {s=np.s!Nom ++ x.s!np.a} ;

  ProDrop = sc_ProDrop ;
  ICompAP = apcn_ICompAP ;
  IAdvAdv = sc_IAdvAdv ;
  CompIQuant = apcn_CompIQuant ;
  PrepCN prep cn = AS.PrepNP prep (NS.MassNP cn) ;

  FocObj np cl = {s=\t,a,p=>np.s!Acc ++ cl.s!t!a!p} ;
  FocAdv adv cl = {s=\t,a,p=>adv.s ++ cl.s!t!a!p} ;
  FocAdV adv cl = {s=\t,a,p=>adv.s ++ cl.s!t!a!p} ;
  FocAP ap np = {s=\_,_,_=>ap.s!Indef!Nom!agrGender np.a!agrNumber np.a ++ np.s!Nom} ;
  FocNeg cl = {s=\t,a,_=>cl.s!t!a!Neg} ;
  FocVP vp np = {s=\t,a,p=>realizeVP vp t a p np.a ++ np.s!Nom} ;
  FocVV vv vp np = {s=\t,a,p=>
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
  ReflPron = rnp_ReflPron ;
  ReflPoss = rnp_ReflPoss ;
  PredetRNP = rnp_PredetRNP ;
  ConjRNP = rnp_ConjRNP ;
  Base_rr_RNP = rnp_Base_rr_RNP ;
  Base_nr_RNP = rnp_Base_nr_RNP ;
  Base_rn_RNP = rnp_Base_rn_RNP ;
  Cons_rr_RNP = rnp_Cons_rr_RNP ;
  Cons_nr_RNP = rnp_Cons_nr_RNP ;

}
