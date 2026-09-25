--# -path=.:../../../AlbanianSQI/GF/lib/src:../../../AlbanianSQI/GF/lib/src/albanian:../../../AlbanianSQI/GF/lib/src/api:../../../AlbanianSQI/GF/lib/src/common:../../../AlbanianSQI/GF/lib/src/abstract:../../../AlbanianSQI/GF/lib/src/prelude

concrete AlbC9ResourceSmokeSqi of AlbC9ResourceSmoke =
  open Prelude, ParamX, ResSqi, CatSqi,
       (S = SyntaxSqi), (C = CombinatorsSqi), (T = TrySqi),
       (L = LexiconSqi), (St = StructuralSqi), ExtendSqiScaffolding in {

  lincat Probe = {s : Str} ;

  lin
    C9_FROM_CASE = {s = (S.mkAdv St.from_Prep probeNP).s} ;
    C9_AGENT_CASE = {s = (S.mkAdv St.by8agent_Prep probeNP).s} ;
    C9_THIS_ACC_PL_MASC = {s = St.this_Quant.s ! Acc ! Masc ! Pl} ;
    C9_THIS_ACC_PL_FEM = {s = St.this_Quant.s ! Acc ! Fem ! Pl} ;
    C9_SOME_SG = {s = St.someSg_Det.s ! Nom ! Masc} ;
    C9_SOME_PL = {s = St.somePl_Det.s ! Nom ! Masc} ;
    C9_IT_PRON_NOM = {s = St.it_Pron.s ! Nom} ;
    C9_THEY_PRON_NOM = {s = St.they_Pron.s ! Nom} ;
    C9_APP_CN = {s = (C.appCN (S.mkCN L.book_N) probeNP).s ! Nom} ;
    C9_TRY_ADV = {s = (T.mkAdv "qartë").s} ;
    C9_TRY_ADN = {s = (T.mkAdN "rreth").s} ;
    C9_TRY_ORD = {s = (T.mkOrd "i pari").s ! Nom ! Masc ! Sg} ;
    C9_STRAND_QUESTION = {
      s = (sc_StrandQuestSlash probeIP probeSlash).s ! ParamX.Pres ! Simul ! Pos
    } ;
    C9_STRAND_RELATIVE = {
      s = (sc_StrandRelSlash probeRP probeSlash).s ! agrgP3 Masc Sg ! ParamX.Pres ! Simul ! Pos
    } ;
    C9_EMPTY_REL_MASC = {
      s = (sc_EmptyRelSlash probeSlash).s ! agrgP3 Masc Sg ! ParamX.Pres ! Simul ! Pos
    } ;
    C9_EMPTY_REL_FEM = {
      s = (sc_EmptyRelSlash probeSlash).s ! agrgP3 Fem Sg ! ParamX.Pres ! Simul ! Pos
    } ;
    C9_EMPTY_REL_PL = {
      s = (sc_EmptyRelSlash probeSlash).s ! agrgP3 Masc Pl ! ParamX.Pres ! Simul ! Pos
    } ;
    C9_EMPTY_REL_NOPREP = {
      s = (sc_EmptyRelSlash probeSlashBare).s ! agrgP3 Masc Sg ! ParamX.Pres ! Simul ! Pos
    } ;

  oper
    probeNP : NP = lin NP {
      s = table {Nom => "NOM" ; Acc => "ACC" ; Dat => "DAT" ; Ablat => "ABL"} ;
      acc_clit = [] ; dat_clit = [] ; a = agrgP3 Masc Sg ; isPron = False
    } ;

    probeIP : IP = lin IP {
      s = table {Nom => "kush" ; Acc => "kë" ; Dat => "kujt" ; Ablat => "kujt"} ;
      a = agrgP3 Masc Sg
    } ;

    probeRP : RP = lin RP {
      s = \\c,gn => sc_RelativeCili c gn
    } ;

    probeSlash : ClSlash = lin ClSlash {
      s = \\_,_,_ => "jeton" ;
      c2 = mkCompl "me" Acc
    } ;

    probeSlashBare : ClSlash = lin ClSlash {
      s = \\_,_,_ => "jeton" ;
      c2 = mkCompl [] Acc
    } ;
}
