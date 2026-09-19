-- Albanian uses the public ParamX tense/ant/polarity contract unchanged.
-- Language-specific mapping to morphological ResSqi.Tense happens only in
-- ClauseSqiRes/ResSqi, avoiding parameter-provenance mismatches in PMCFG.
--# -path=.:../common:../abstract
concrete TenseSqi of Tense = TenseX ** {
}
