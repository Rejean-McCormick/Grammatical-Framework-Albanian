-- GF/lib/src/albanian/ExtendSqi.gf
--# -path=.:../common:../abstract

-- POLICY:
-- 1. ExtendFunctor is the default source of structure.
-- 2. ExtendSqi.gf remains a thin coordinator only.
-- 3. GF 3.12 ExtendFunctor does NOT provide lincats for the VPS/VPI/VPS2/VPI2
--    and list families; Albanian must own these explicitly.
-- 4. Keep that local ownership shallow and compatible with CatSqi's current
--    string-oriented VP layer; do not let GF insert default lincats.
-- 5. Companion modules own Albanian-specific subsystem logic.
-- 6. Rich-category safety is enforced in subsystem modules, not here.

concrete ExtendSqi of Extend =
  CatSqi ** ExtendFunctor -
  [
    -- =========================================================
    -- SCAFFOLDING SUBSYSTEM
    -- =========================================================
    GenNP, GenIP, GenRP, GenModNP, GenModIP,
    PiedPipingQuestSlash, PiedPipingRelSlash, StrandQuestSlash, StrandRelSlash, EmptyRelSlash,
    ProDrop, AdAdV, PositAdVAdj, IAdvAdv, CompS, CompQS, CompVP,
    UttAccIP, UttDatIP, UttAccNP, UttDatNP, UttAdV, UttVPShort,
    ComplBareVS, SlashBareV2S, ComplDirectVS, ComplDirectVQ, FrontComplDirectVS, FrontComplDirectVQ,
    PredIAdvVP, ApposNP, ComplGenVV, CompoundN,
    GerundCN, GerundNP, GerundAdv, UncontractedNeg, TPastSimple, ComplSlashPartLast,
    DetNPMasc, DetNPFem, UseComp_estar, UseComp_ser, SubjRelNP, SubjunctRelCN,

    -- =========================================================
    -- VP-SERIES SUBSYSTEM
    -- ExtendFunctor leaves these categories structurally incomplete.
    -- =========================================================
    VPS, ListVPS, VPI, ListVPI,
    VPS2, ListVPS2, VPI2, ListVPI2,
    MkVPS, BaseVPS, ConsVPS, ConjVPS, PredVPS, SQuestVPS, QuestVPS, RelVPS,
    MkVPI, BaseVPI, ConsVPI, ConjVPI, ComplVPIVV,
    MkVPS2, BaseVPS2, ConsVPS2, ConjVPS2, ComplVPS2, ReflVPS2,
    MkVPI2, BaseVPI2, ConsVPI2, ConjVPI2, ComplVPI2,

    -- =========================================================
    -- LEXICAL TAIL
    -- =========================================================
    ReflPossPron,
    iFem_Pron, youFem_Pron, weFem_Pron, youPlFem_Pron, theyFem_Pron, theyNeutr_Pron,
    youPolFem_Pron, youPolPl_Pron, youPolPlFem_Pron, UseDAP, UseDAPMasc, UseDAPFem,

    -- =========================================================
    -- EXISTENTIAL SUBSYSTEM
    -- =========================================================
    ExistS, ExistNPQS, ExistIPQS, ExistCN, ExistMassCN, ExistPluralCN, ExistsNP,

    -- =========================================================
    -- AP/CN CONVERSION SUBSYSTEM
    -- =========================================================
    ICompAP, CompBareCN, CompIQuant, PredAPVP, AdjAsCN, AdjAsNP, CardCNCard,

    -- =========================================================
    -- FOCUS / PREPOSITION SUBSYSTEM
    -- =========================================================
    FocusObj, FocusAdv, FocusAdV, FocusAP, PrepCN,

    -- =========================================================
    -- VP / VPSLASH BRIDGE SUBSYSTEM
    -- =========================================================
    PresPartAP, EmbedPresPart, EmbedSSlash, PastPartAP, PastPartAgentAP,
    PassVPSlash, PassAgentVPSlash, NominalizeVPSlashNP, ProgrVPSlash,
    A2VPSlash, N2VPSlash, AdvIsNP, AdvIsNPAP, PurposeVP, WithoutVP, ByVP, InOrderToVP, CompoundAP,

    -- =========================================================
    -- RNP SUBSYSTEM
    -- =========================================================
    ReflRNP, ReflPron, ReflPoss, PredetRNP, AdvRNP, AdvRVP, AdvRAP, ReflA2RNP,
    PossPronRNP, ConjRNP, Base_rr_RNP, Base_nr_RNP, Base_rn_RNP, Cons_rr_RNP, Cons_nr_RNP
  ]
  with
    (Grammar = GrammarSqi) **
  open Prelude,
       (R = ResSqi),
       (H = ExtendSqiHelpers),
       ExtendSqiScaffolding,
       ExtendSqiExistential,
       ExtendSqiAPCN,
       ExtendSqiFocusPrep,
       ExtendSqiVPBridge,
       ExtendSqiRNP,
       ExtendSqiLexicon
  in {

  lincat
    -- =========================================================
    -- VP-SERIES / CONJUNCTION LIST TYPES
    -- GF 3.12 otherwise inserts default lincats for these Extend families
    -- and then crashes in PMCFG generation.  CatSqi's VP layer is currently
    -- surface-string based, so keep these categories shallow but explicit.
    -- =========================================================
    VPS   = {s : Str} ;
    [VPS] = {init, last : Str} ;
    VPI   = {s : Str} ;
    [VPI] = {init, last : Str} ;

    VPS2   = {s : Str} ;
    [VPS2] = {init, last : Str} ;
    VPI2   = {s : Str} ;
    [VPI2] = {init, last : Str} ;

    [Comp] = {init, last : Str} ;
    [Imp]  = {init, last : Str} ;

  lin
    -- =========================================================
    -- VP-SERIES SUBSYSTEM
    -- Mirrors the shallow VPS/VPI behavior already used by ExtraSqi while
    -- completing the full Extend family, including VPS2/VPI2 and lists.
    -- =========================================================
    MkVPS t p vp = {s = vp.s} ;
    BaseVPS x y = {init = x.s ; last = y.s} ;
    ConsVPS x xs = {init = x.s ++ "," ++ H.wordSep ++ xs.init ; last = xs.last} ;
    ConjVPS c xs = {s = xs.init ++ H.wordSep ++ c.s ++ H.wordSep ++ xs.last} ;
    PredVPS np vps = {s = np.s ! R.Nom ++ H.wordSep ++ vps.s} ;
    SQuestVPS np vps = {s = np.s ! R.Nom ++ H.wordSep ++ vps.s} ;
    QuestVPS ip vps = {s = ip.s ++ H.wordSep ++ vps.s} ;
    RelVPS rp vps = {s = rp.s ++ H.wordSep ++ vps.s} ;

    MkVPI vp = {s = vp.s} ;
    BaseVPI x y = {init = x.s ; last = y.s} ;
    ConsVPI x xs = {init = x.s ++ "," ++ H.wordSep ++ xs.init ; last = xs.last} ;
    ConjVPI c xs = {s = xs.init ++ H.wordSep ++ c.s ++ H.wordSep ++ xs.last} ;
    ComplVPIVV vv vpi = {s = H.verbPres3sg vv ++ H.wordSep ++ vpi.s} ;

    MkVPS2 t p vps = {s = vps.s} ;
    BaseVPS2 x y = {init = x.s ; last = y.s} ;
    ConsVPS2 x xs = {init = x.s ++ "," ++ H.wordSep ++ xs.init ; last = xs.last} ;
    ConjVPS2 c xs = {s = xs.init ++ H.wordSep ++ c.s ++ H.wordSep ++ xs.last} ;
    ComplVPS2 vps np = {s = vps.s ++ H.wordSep ++ np.s ! R.Acc} ;
    ReflVPS2 vps rnp = {s = vps.s ++ H.wordSep ++ rnp.s ! R.Acc} ;

    MkVPI2 vps = {s = vps.s} ;
    BaseVPI2 x y = {init = x.s ; last = y.s} ;
    ConsVPI2 x xs = {init = x.s ++ "," ++ H.wordSep ++ xs.init ; last = xs.last} ;
    ConjVPI2 c xs = {s = xs.init ++ H.wordSep ++ c.s ++ H.wordSep ++ xs.last} ;
    ComplVPI2 vpi np = {s = vpi.s ++ H.wordSep ++ np.s ! R.Acc} ;

    BaseComp x y = {init = x.s ; last = y.s} ;
    ConsComp x xs = {init = x.s ++ "," ++ H.wordSep ++ xs.init ; last = xs.last} ;
    ConjComp c xs = {s = xs.init ++ H.wordSep ++ c.s ++ H.wordSep ++ xs.last} ;

    BaseImp x y = {init = x.s ; last = y.s} ;
    ConsImp x xs = {init = x.s ++ "," ++ H.wordSep ++ xs.init ; last = xs.last} ;
    ConjImp c xs = {s = xs.init ++ H.wordSep ++ c.s ++ H.wordSep ++ xs.last} ;

    -- =========================================================
    -- SCAFFOLDING SUBSYSTEM
    -- Strategy: coordinator wiring only.
    -- =========================================================
    GenNP x1 = sc_GenNP (lin NP x1) ;
    GenIP x1 = sc_GenIP (lin IP x1) ;
    GenRP x1 x2 = sc_GenRP (lin Num x1) (lin CN x2) ;
    GenModNP x1 x2 x3 = sc_GenModNP (lin Num x1) (lin NP x2) (lin CN x3) ;
    GenModIP x1 x2 x3 = sc_GenModIP (lin Num x1) (lin IP x2) (lin CN x3) ;
    PiedPipingQuestSlash x1 x2 = sc_PiedPipingQuestSlash (lin IP x1) (lin ClSlash x2) ;
    PiedPipingRelSlash x1 x2 = sc_PiedPipingRelSlash (lin RP x1) (lin ClSlash x2) ;
    StrandQuestSlash x1 x2 = sc_StrandQuestSlash (lin IP x1) (lin ClSlash x2) ;
    StrandRelSlash x1 x2 = sc_StrandRelSlash (lin RP x1) (lin ClSlash x2) ;
    EmptyRelSlash x1 = sc_EmptyRelSlash (lin ClSlash x1) ;
    ProDrop x1 = sc_ProDrop (lin Pron x1) ;
    AdAdV x1 x2 = sc_AdAdV (lin AdA x1) (lin AdV x2) ;
    PositAdVAdj x1 = sc_PositAdVAdj (lin A x1) ;
    IAdvAdv x1 = sc_IAdvAdv (lin Adv x1) ;
    CompS x1 = sc_CompS (lin S x1) ;
    CompQS x1 = sc_CompQS (lin QS x1) ;
    CompVP x1 x2 x3 = sc_CompVP (lin Ant x1) (lin Pol x2) (lin VP x3) ;
    UttAccIP x1 = sc_UttAccIP (lin IP x1) ;
    UttDatIP x1 = sc_UttDatIP (lin IP x1) ;
    UttAccNP x1 = sc_UttAccNP (lin NP x1) ;
    UttDatNP x1 = sc_UttDatNP (lin NP x1) ;
    UttAdV x1 = sc_UttAdV (lin AdV x1) ;
    UttVPShort x1 = sc_UttVPShort (lin VP x1) ;
    ComplBareVS x1 x2 = sc_ComplBareVS (lin VS x1) (lin S x2) ;
    SlashBareV2S x1 x2 = sc_SlashBareV2S (lin V2S x1) (lin S x2) ;
    ComplDirectVS x1 x2 = sc_ComplDirectVS (lin VS x1) (lin Utt x2) ;
    ComplDirectVQ x1 x2 = sc_ComplDirectVQ (lin VQ x1) (lin Utt x2) ;
    FrontComplDirectVS x1 x2 x3 = sc_FrontComplDirectVS (lin NP x1) (lin VS x2) (lin Utt x3) ;
    FrontComplDirectVQ x1 x2 x3 = sc_FrontComplDirectVQ (lin NP x1) (lin VQ x2) (lin Utt x3) ;
    PredIAdvVP x1 x2 = sc_PredIAdvVP (lin IAdv x1) (lin VP x2) ;
    ApposNP x1 x2 = sc_ApposNP (lin NP x1) (lin NP x2) ;
    ComplGenVV x1 x2 x3 x4 = sc_ComplGenVV (lin VV x1) (lin Ant x2) (lin Pol x3) (lin VP x4) ;
    CompoundN x1 x2 = sc_CompoundN (lin N x1) (lin N x2) ;
    GerundCN x1 = sc_GerundCN (lin VP x1) ;
    GerundNP x1 = sc_GerundNP (lin VP x1) ;
    GerundAdv x1 = sc_GerundAdv (lin VP x1) ;
    UncontractedNeg = sc_UncontractedNeg ;
    TPastSimple = sc_TPastSimple ;
    ComplSlashPartLast x1 x2 = sc_ComplSlashPartLast (lin VPSlash x1) (lin NP x2) ;
    DetNPMasc x1 = sc_DetNPMasc (lin Det x1) ;
    DetNPFem x1 = sc_DetNPFem (lin Det x1) ;
    UseComp_estar x1 = sc_UseComp_estar (lin Comp x1) ;
    UseComp_ser x1 = sc_UseComp_ser (lin Comp x1) ;
    SubjRelNP x1 x2 = sc_SubjRelNP (lin NP x1) (lin RS x2) ;
    SubjunctRelCN x1 x2 = sc_SubjunctRelCN (lin CN x1) (lin RS x2) ;
    -- =========================================================
    -- EXISTENTIAL SUBSYSTEM
    -- Strategy: existential family owned outside the coordinator.
    -- =========================================================
    ExistS x1 x2 x3 = ex_ExistS (lin Temp x1) (lin Pol x2) (lin NP x3) ;
    ExistNPQS x1 x2 x3 = ex_ExistNPQS (lin Temp x1) (lin Pol x2) (lin NP x3) ;
    ExistIPQS x1 x2 x3 = ex_ExistIPQS (lin Temp x1) (lin Pol x2) (lin IP x3) ;
    ExistCN x1 = ex_ExistCN (lin CN x1) ;
    ExistMassCN x1 = ex_ExistMassCN (lin CN x1) ;
    ExistPluralCN x1 = ex_ExistPluralCN (lin CN x1) ;
    ExistsNP x1 = ex_ExistsNP (lin NP x1) ;
    -- =========================================================
    -- AP/CN CONVERSION SUBSYSTEM
    -- Strategy: rich-category preservation handled in APCN module.
    -- =========================================================
    ICompAP x1 = apcn_ICompAP (lin AP x1) ;
    CompBareCN x1 = apcn_CompBareCN (lin CN x1) ;
    CompIQuant x1 = apcn_CompIQuant (lin IQuant x1) ;
    PredAPVP x1 x2 = apcn_PredAPVP (lin AP x1) (lin VP x2) ;
    AdjAsCN x1 = apcn_AdjAsCN (lin AP x1) ;
    AdjAsNP x1 = apcn_AdjAsNP (lin AP x1) ;
    CardCNCard x1 x2 = apcn_CardCNCard (lin Card x1) (lin CN x2) ;
    -- =========================================================
    -- FOCUS / PREPOSITION SUBSYSTEM
    -- Strategy: keep focus/prep ownership together.
    -- =========================================================
    FocusObj x1 x2 = fp_FocusObj (lin NP x1) (lin SSlash x2) ;
    FocusAdv x1 x2 = fp_FocusAdv (lin Adv x1) (lin S x2) ;
    FocusAdV x1 x2 = fp_FocusAdV (lin AdV x1) (lin S x2) ;
    FocusAP x1 x2 = fp_FocusAP (lin AP x1) (lin NP x2) ;
    PrepCN x1 x2 = fp_PrepCN (lin Prep x1) (lin CN x2) ;
    -- =========================================================
    -- VP / VPSLASH BRIDGE SUBSYSTEM
    -- Strategy: bridge family owned by VPBridge module.
    -- =========================================================
    PresPartAP x1 = vp_PresPartAP (lin VP x1) ;
    EmbedPresPart x1 = vp_EmbedPresPart (lin VP x1) ;
    EmbedSSlash x1 = vp_EmbedSSlash (lin SSlash x1) ;
    PastPartAP x1 = vp_PastPartAP (lin VPSlash x1) ;
    PastPartAgentAP x1 x2 = vp_PastPartAgentAP (lin VPSlash x1) (lin NP x2) ;
    PassVPSlash x1 = vp_PassVPSlash (lin VPSlash x1) ;
    PassAgentVPSlash x1 x2 = vp_PassAgentVPSlash (lin VPSlash x1) (lin NP x2) ;
    NominalizeVPSlashNP x1 x2 = vp_NominalizeVPSlashNP (lin VPSlash x1) (lin NP x2) ;
    ProgrVPSlash x1 = vp_ProgrVPSlash (lin VPSlash x1) ;
    A2VPSlash x1 = vp_A2VPSlash (lin A2 x1) ;
    N2VPSlash x1 = vp_N2VPSlash (lin N2 x1) ;
    AdvIsNP x1 x2 = vp_AdvIsNP (lin Adv x1) (lin NP x2) ;
    AdvIsNPAP x1 x2 x3 = vp_AdvIsNPAP (lin Adv x1) (lin NP x2) (lin AP x3) ;
    PurposeVP x1 = vp_PurposeVP (lin VP x1) ;
    WithoutVP x1 = vp_WithoutVP (lin VP x1) ;
    ByVP x1 = vp_ByVP (lin VP x1) ;
    InOrderToVP x1 = vp_InOrderToVP (lin VP x1) ;
    CompoundAP x1 x2 = vp_CompoundAP (lin N x1) (lin A x2) ;
    -- =========================================================
    -- RNP SUBSYSTEM
    -- Strategy: one coherent RNP family.
    -- =========================================================
    ReflRNP x1 x2 = rnp_ReflRNP (lin VPSlash x1) (lin RNP x2) ;
    ReflPron = rnp_ReflPron ;
    ReflPoss x1 x2 = rnp_ReflPoss (lin Num x1) (lin CN x2) ;
    PredetRNP x1 x2 = rnp_PredetRNP (lin Predet x1) (lin RNP x2) ;
    AdvRNP x1 x2 x3 = rnp_AdvRNP (lin NP x1) (lin Prep x2) (lin RNP x3) ;
    AdvRVP x1 x2 x3 = rnp_AdvRVP (lin VP x1) (lin Prep x2) (lin RNP x3) ;
    AdvRAP x1 x2 x3 = rnp_AdvRAP (lin AP x1) (lin Prep x2) (lin RNP x3) ;
    ReflA2RNP x1 x2 = rnp_ReflA2RNP (lin A2 x1) (lin RNP x2) ;
    PossPronRNP x1 x2 x3 x4 = rnp_PossPronRNP (lin Pron x1) (lin Num x2) (lin CN x3) (lin RNP x4) ;
    ConjRNP x1 x2 = rnp_ConjRNP (lin Conj x1) (lin RNPList x2) ;
    Base_rr_RNP x1 x2 = rnp_Base_rr_RNP (lin RNP x1) (lin RNP x2) ;
    Base_nr_RNP x1 x2 = rnp_Base_nr_RNP (lin NP x1) (lin RNP x2) ;
    Base_rn_RNP x1 x2 = rnp_Base_rn_RNP (lin RNP x1) (lin NP x2) ;
    Cons_rr_RNP x1 x2 = rnp_Cons_rr_RNP (lin RNP x1) (lin RNPList x2) ;
    Cons_nr_RNP x1 x2 = rnp_Cons_nr_RNP (lin NP x1) (lin RNPList x2) ;
    -- =========================================================
    -- CONSTANTS / LEXICAL TAIL
    -- Strategy: lexical-only wiring.
    -- =========================================================
    ReflPossPron = lex_ReflPossPron ;

    iFem_Pron = lex_iFem_Pron ;
    youFem_Pron = lex_youFem_Pron ;
    weFem_Pron = lex_weFem_Pron ;
    youPlFem_Pron = lex_youPlFem_Pron ;
    theyFem_Pron = lex_theyFem_Pron ;
    theyNeutr_Pron = lex_theyNeutr_Pron ;
    youPolFem_Pron = lex_youPolFem_Pron ;
    youPolPl_Pron = lex_youPolPl_Pron ;
    youPolPlFem_Pron = lex_youPolPlFem_Pron ;

    UseDAP x1 = lex_UseDAP (lin DAP x1) ;
    UseDAPMasc x1 = lex_UseDAPMasc (lin DAP x1) ;
    UseDAPFem x1 = lex_UseDAPFem (lin DAP x1) ;
} ;