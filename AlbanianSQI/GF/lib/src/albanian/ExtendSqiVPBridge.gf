-- GF/lib/src/albanian/ExtendSqiVPBridge.gf

resource ExtendSqiVPBridge =
  open GrammarSqi, CatSqi,
       (R = ResSqi), (P = ParamX), (PS = ParadigmsSqi),
       ExtendSqiHelpers,
       (NS = NounSqi), (AS = AdverbSqi) in {

  oper
    -- =========================================================
    -- VP / VPSLASH BRIDGE SUBSYSTEM
    -- Strategy:
    -- - prefer inherited/compositional Albanian paths whenever they exist
    -- - keep temporary lossy bridges explicit and centralized
    -- - allow shallow verbal wrappers where Albanian is already shallow
    -- - keep rich complements rich as long as possible
    -- - do not let VP-bridge functions become another AP/CN flattening zone
    -- =========================================================

    vp_npSurfaceAcc : NP -> Str =
      \np -> np.s ! R.Acc ;

    vp_agentAdv : NP -> Adv =
      \np -> AS.PrepNP (R.mkPrep "nga") np ;

    vp_compFromA2 : A2 -> Comp =
      \a2 -> CompAP (UseA2 a2) ;

    vp_compFromN2 : N2 -> Comp =
      \n2 -> CompCN (UseN2 n2) ;

    -- TEMPORARY fallback:
    -- no Albanian AP-preserving participial constructor path has been surfaced yet.
    vp_PresPartAP : VP -> AP =
      \vp ->
        mkCompatAPFromStr vp.s ;

    -- SC is shallow/string-like here, so direct embedding is acceptable.
    vp_EmbedPresPart : VP -> SC =
      \vp ->
        lin SC {s = vp.s} ;

    -- TEMPORARY compile probe / compatibility fallback.
    -- ExtendFunctor leaves EmbedSSlash as variants {} in the pinned RGL.
    -- Albanian SSlash is already flattened to {s : Str}, so this bridge can
    -- only preserve the available surface string. This is NOT a final
    -- linguistic realization of free-relative/slash embedding. Model
    -- languages reconstruct or fill the slash more explicitly; Albanian
    -- needs a later category/constructor decision before this can be final.
    vp_EmbedSSlash : SSlash -> SC =
      \sslash ->
        lin SC {s = sslash.s} ;

    -- TEMPORARY fallback:
    -- preserve subsystem ownership, but keep the lossy AP bridge explicit.
    vp_PastPartAP : VPSlash -> AP =
      \vpslash ->
        mkCompatAPFromStr vpslash.s ;

    -- TEMPORARY fallback:
    -- build the agented passive through Albanian agent marking first,
    -- then surface only for the provisional AP bridge.
    vp_PastPartAgentAP : VPSlash -> NP -> AP =
      \vpslash,np ->
        mkCompatAPFromStr (vpslash.s ++ wordSep ++ (vp_agentAdv np).s) ;

    -- VP/VPSlash are shallow in current Albanian CatSqi, so this remains
    -- a direct coercion at the surface level.
    vp_PassVPSlash : VPSlash -> VP =
      \vpslash ->
        lin VP {s = vpslash.s} ;

    -- Preferred passive+agent path: reuse Albanian prep government.
    vp_PassAgentVPSlash : VPSlash -> NP -> VP =
      \vpslash,np ->
        AdvVP (lin VP {s = vpslash.s}) (vp_agentAdv np) ;

    -- TEMPORARY fallback:
    -- nominalization is still compatibility-based, but keep the complement
    -- realization explicit and centralized.
    vp_NominalizeVPSlashNP : VPSlash -> NP -> NP =
      \vpslash,np ->
        mkCompatNPFromStr
          (vpslash.s ++ wordSep ++ vp_npSurfaceAcc np)
          R.Masc
          P.Sg ;

    -- Same record shape; keep this as a pure coercion for now.
    vp_ProgrVPSlash : VPSlash -> VPSlash =
      \vpslash ->
        vpslash ;

    -- Preserve the full VPSlash category shape (including GF lock fields)
    -- by starting from a real Albanian VPSlash constructor. The dummy verb
    -- is only a structural scaffold: its surface string is replaced below.
    -- This follows the model-language pattern used for A2VPSlash/N2VPSlash
    -- while keeping the actual Albanian A2/N2 complement realization.
    vp_dummyVPSlash : VPSlash =
      SlashV2a (PS.mkV2 (PS.mkV "bëj")) ;

    vp_A2VPSlash : A2 -> VPSlash =
      \a2 ->
        let vp : VP = UseComp (vp_compFromA2 a2)
        in vp_dummyVPSlash ** {
          s = vp.s ++ wordSep ++ a2.c2.s
        } ;

    vp_N2VPSlash : N2 -> VPSlash =
      \n2 ->
        let vp : VP = UseComp (vp_compFromN2 n2)
        in vp_dummyVPSlash ** {
          s = vp.s ++ wordSep ++ n2.c2.s
        } ;

    -- Preferred inherited/functor-style composition path.
    vp_AdvIsNP : Adv -> NP -> Cl =
      \adv,np ->
        PredVP np (UseComp (CompAdv adv)) ;

    -- Preferred inherited/functor-style composition path.
    vp_AdvIsNPAP : Adv -> NP -> AP -> Cl =
      \adv,np,ap ->
        PredVP np (AdvVP (UseComp (CompAP ap)) adv) ;

    -- These targets are Adv/string-like, so shallow realization is acceptable.
    vp_PurposeVP : VP -> Adv =
      \vp ->
        lin Adv {s = "për të" ++ wordSep ++ vp.s} ;

    vp_WithoutVP : VP -> Adv =
      \vp ->
        lin Adv {s = "pa" ++ wordSep ++ vp.s} ;

    vp_ByVP : VP -> Adv =
      \vp ->
        lin Adv {s = "nga" ++ wordSep ++ vp.s} ;

    vp_InOrderToVP : VP -> Adv =
      \vp ->
        lin Adv {s = "që të" ++ wordSep ++ vp.s} ;

    -- Constructor-based AP path; keeps AP shape instead of manufacturing one.
    vp_CompoundAP : N -> A -> AP =
      \n,a ->
        AdvAP (PositA a) (AS.PrepNP (R.mkPrep "nga") (NS.MassNP (UseN n))) ;

} ;