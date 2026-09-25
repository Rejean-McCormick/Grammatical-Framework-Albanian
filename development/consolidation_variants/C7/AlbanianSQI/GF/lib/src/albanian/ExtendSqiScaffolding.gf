-- Non-VPS extension helpers that preserve Albanian rich categories.
resource ExtendSqiScaffolding =
  open Prelude, Predef, (P = ParamX), GrammarSqi, CatSqi, CommonX,
       ExtendSqiHelpers, ClauseSqiRes, (R = ResSqi) in {

oper
  sc_CompListBoundary : Type = {init,last : R.Agr => Str} ;
  sc_ImpListBoundary  : Type = {init,last : P.Polarity => P.Number => Str} ;

  sc_BaseComp : Comp -> Comp -> sc_CompListBoundary = \x,y -> {
    init=x.s ; last=y.s
  } ;
  sc_ConsComp : Comp -> sc_CompListBoundary -> sc_CompListBoundary = \x,xs -> {
    init=\\a =>x.s!a ++ "," ++ xs.init!a ; last=xs.last
  } ;
  sc_ConjComp : Conj -> sc_CompListBoundary -> Comp = \c,xs -> lin Comp {
    s=\\a =>xs.init!a ++ c.s ++ xs.last!a
  } ;

  sc_BaseImp : Imp -> Imp -> sc_ImpListBoundary = \x,y -> {
    init=x.s ; last=y.s
  } ;
  sc_ConsImp : Imp -> sc_ImpListBoundary -> sc_ImpListBoundary = \x,xs -> {
    init=\\p,n =>x.s!p!n ++ "," ++ xs.init!p!n ; last=xs.last
  } ;
  sc_ConjImp : Conj -> sc_ImpListBoundary -> Imp = \c,xs -> lin Imp {
    s=\\p,n =>xs.init!p!n ++ c.s ++ xs.last!p!n
  } ;

  sc_GenNP : NP -> Quant = \np -> lin Quant {
    s=\\c,g,n =>R.link_clitic!R.Indef!c!g!n ++ np.s!R.Ablat ;
    spec=R.Def ;
    placement=R.PostNominal
  } ;

  sc_GenIP : IP -> IQuant = \ip -> lin IQuant {
    s=\\_,_,_ =>"i" ++ ip.s!R.Dat
  } ;

  sc_GenRP : Num -> CN -> RP = \num,cn -> lin RP {
    s=\\c,gn =>R.link_clitic!R.Indef!c!cn.g!num.n ++ cn.s!R.Indef!R.Ablat!num.n
  } ;

  sc_GenModNP : Num -> NP -> CN -> NP = \num,np,cn -> lin NP {
    s=\\c =>cn.s!R.Def!c!num.n ++ R.link_clitic!R.Def!c!cn.g!num.n ++ np.s!R.Ablat ;
    acc_clit=[] ; dat_clit=[] ; a=R.agrgP3 cn.g num.n ; isPron=False
  } ;

  sc_GenModIP : Num -> IP -> CN -> IP = \num,ip,cn -> lin IP {
    s=\\c =>cn.s!R.Def!c!num.n ++ R.link_clitic!R.Def!c!cn.g!num.n ++ ip.s!R.Dat ;
    a=R.agrgP3 cn.g num.n
  } ;

  sc_PiedPipingQuestSlash : IP -> ClSlash -> QCl = \ip,slash -> lin QCl {
    s=\\t,a,p =>frontGovernedIP slash.c2 ip.s (slash.s!t!a!p)
  } ;

  sc_PiedPipingRelSlash : RP -> ClSlash -> RCl = \rp,slash -> lin RCl {
    s=\\agr,t,a,p =>frontGovernedRP slash.c2 rp.s agr.gn (slash.s!t!a!p)
  } ;

  -- The abstract API names these operations after English stranding, but the
  -- supplied Albanian evidence does not license canonical postposed
  -- prepositions.  Preserve API coverage while neutralizing to pied-piping.
  sc_StrandQuestSlash : IP -> ClSlash -> QCl = \ip,slash -> lin QCl {
    s=\\t,a,p =>frontGovernedIP slash.c2 ip.s (slash.s!t!a!p)
  } ;

  sc_StrandRelSlash : RP -> ClSlash -> RCl = \rp,slash -> lin RCl {
    s=\\agr,t,a,p =>frontGovernedRP slash.c2 rp.s agr.gn (slash.s!t!a!p)
  } ;

  -- EmptyRelSlash has no RP argument in the shared abstract API.  The current
  -- Albanian Agr/RP representation also loses plural head gender, while the
  -- supplied standard-language evidence requires gender-sensitive cili/e
  -- forms.  Preserve the historical realization as an explicitly uncertified
  -- compatibility path until that cross-workstream representation question is
  -- resolved; do not treat it as canonical Albanian stranding.
  sc_EmptyRelSlash : ClSlash -> RCl = \slash -> lin RCl {
    s=\\_,t,a,p =>markRelativeClause (slash.s!t!a!p) ++ slash.c2.s
  } ;

  sc_ProDrop : Pron -> Pron = \pro -> lin Pron {
    s=\\_ =>[] ; acc_clit=pro.acc_clit ; dat_clit=pro.dat_clit ; a=pro.a ; isPron=True
  } ;

  sc_AdAdV : AdA -> AdV -> AdV = \a,v -> lin AdV {s=a.s ++ v.s} ;
  sc_PositAdVAdj : A -> AdV = \a -> lin AdV {s=adjSurfaceNomMascSg a} ;
  sc_IAdvAdv : Adv -> IAdv = \adv -> lin IAdv {s=adv.s} ;

  sc_CompS : S -> Comp = \s -> lin Comp {s=\\_ =>embedIndicative s.s} ;
  sc_CompQS : QS -> Comp = \qs -> lin Comp {s=\\_ =>qs.s} ;
  sc_CompVP : Ant -> Pol -> VP -> Comp = \ant,pol,vp -> lin Comp {
    s=\\a =>realizeSubjAntVP vp ant.a pol.p a
  } ;

  sc_UttAccIP : IP -> Utt = \ip -> lin Utt {s=ip.s!R.Acc} ;
  sc_UttDatIP : IP -> Utt = \ip -> lin Utt {s=ip.s!R.Dat} ;
  sc_UttAccNP : NP -> Utt = \np -> lin Utt {s=np.s!R.Acc} ;
  sc_UttDatNP : NP -> Utt = \np -> lin Utt {s=np.s!R.Dat} ;
  sc_UttAdV : AdV -> Utt = \adv -> lin Utt {s=adv.s} ;
  sc_UttVPShort : VP -> Utt = \vp -> lin Utt {s=realizeImpVP vp P.Pos P.Sg} ;

  sc_ComplBareVS : VS -> S -> R.VP = \vs,s -> appendVP (emptyVP vs) (\\_ =>s.s) ;
  sc_SlashBareV2S : V2S -> S -> R.VPSlash = \v2s,s ->
    slashFromVP
      (appendVP (emptyVP (lin Verb v2s)) (\\_ =>s.s))
      v2s.c2 ;

  sc_ComplDirectVS : VS -> Utt -> R.VP = \vs,utt ->
    appendVP (emptyVP vs) (\\_ =>":" ++ utt.s) ;
  sc_ComplDirectVQ : VQ -> Utt -> R.VP = \vq,utt ->
    appendVP (emptyVP vq) (\\_ =>":" ++ utt.s) ;

  sc_FrontComplDirectVS : NP -> VS -> Utt -> Cl = \np,vs,utt ->
    PredVP np (sc_ComplDirectVS vs utt) ;
  sc_FrontComplDirectVQ : NP -> VQ -> Utt -> Cl = \np,vq,utt ->
    PredVP np (sc_ComplDirectVQ vq utt) ;

  sc_PredIAdvVP : IAdv -> VP -> QCl = \iadv,vp -> lin QCl {
    s=\\t,a,p =>frontWh iadv.s (realizeVP vp t a p fallbackAgr)
  } ;

  sc_ApposNP : NP -> NP -> NP = \np1,np2 -> lin NP {
    s=\\c =>np1.s!c ++ SOFT_BIND ++ "," ++ np2.s!c ;
    acc_clit=[] ; dat_clit=[] ; a=np1.a ; isPron=False
  } ;

  sc_ComplGenVV : VV -> Ant -> Pol -> R.VP -> R.VP = \vv,ant,pol,vp ->
    appendVP (emptyVP vv) (\\a =>realizeSubjAntVP vp ant.a pol.p a) ;

  sc_CompoundN : N -> N -> N = \modifier,head -> lin N {
    s=\\sp,c,n =>modifier.s!R.Indef!R.Nom!P.Sg ++ head.s!sp!c!n ;
    g=head.g
  } ;

  sc_GerundCN : VP -> CN = \vp -> lin CN {
    s=\\_,_,_ =>realizeGerundVP vp agrMascSg ; g=R.Masc
  } ;
  sc_GerundNP : VP -> NP = \vp -> lin NP {
    s=\\_ =>realizeGerundVP vp agrMascSg ; acc_clit=[] ; dat_clit=[] ; a=agrMascSg ; isPron=False
  } ;
  sc_GerundAdv : VP -> Adv = \vp -> lin Adv {s=realizeGerundVP vp agrMascSg} ;

  sc_UncontractedNeg : Pol = lin Pol {s=[] ; p=P.Neg} ;
  sc_TPastSimple : Tense = lin Tense {s=[] ; t=P.Past} ;

  sc_ComplSlashPartLast : R.VPSlash -> NP -> R.VP = \sl,np ->
    appendVP (vpFromSlash sl) (\\_ =>sl.c2.s ++ np.s!sl.c2.c) ;

  sc_DetNPMasc : Det -> NP = \det -> lin NP {
    s=\\c =>det.s!c!R.Masc ; acc_clit=[] ; dat_clit=[] ;
    a=R.agrgP3 R.Masc det.n ; isPron=False
  } ;
  sc_DetNPFem : Det -> NP = \det -> lin NP {
    s=\\c =>det.s!c!R.Fem ; acc_clit=[] ; dat_clit=[] ;
    a=R.agrgP3 R.Fem det.n ; isPron=False
  } ;

  sc_UseComp_estar : Comp -> VP = UseComp ;
  sc_UseComp_ser : Comp -> VP = UseComp ;

  sc_SubjRelNP : NP -> RS -> NP = \np,rs -> np ** {
    s=\\c =>np.s!c ++ rs.s!np.a
  } ;
  sc_SubjunctRelCN : CN -> RS -> CN = \cn,rs -> cn ** {
    s=\\sp,c,n =>cn.s!sp!c!n ++ rs.s!(R.agrgP3 cn.g n)
  } ;

}
