-- Extension-specific lexical material.
resource ExtendSqiLexicon =
  open Prelude, ParamX, CatSqi, ExtendSqiHelpers, (R = ResSqi) in {

oper
  lex_ReflPossPron : Quant = lin Quant {
    s=\\_,_,_ =>"vet" ; spec=R.Def
  } ;

  lex_iFem_Pron : Pron =
    mkPronConst "unë" "mua" "mua" "më" "më" R.Fem Sg ;
  lex_youFem_Pron : Pron =
    mkPronConst "ti" "ty" "ty" "të" "të" R.Fem Sg ;
  lex_weFem_Pron : Pron =
    mkPronConst "ne" "ne" "neve" "na" "na" R.Fem Pl ;
  lex_youPlFem_Pron : Pron =
    mkPronConst "ju" "ju" "juve" "ju" "ju" R.Fem Pl ;
  lex_theyFem_Pron : Pron =
    mkPronConst "ato" "ato" "atyre" "i" "u" R.Fem Pl ;
  lex_theyNeutr_Pron : Pron =
    mkPronConst "ata" "ata" "atyre" "i" "u" R.Masc Pl ;
  lex_youPolFem_Pron : Pron =
    mkPronConst "ju" "ju" "juve" "ju" "ju" R.Fem Pl ;
  lex_youPolPl_Pron : Pron =
    mkPronConst "ju" "ju" "juve" "ju" "ju" R.Masc Pl ;
  lex_youPolPlFem_Pron : Pron =
    mkPronConst "ju" "ju" "juve" "ju" "ju" R.Fem Pl ;

  lex_dapAsNP : R.Gender -> DAP -> NP = \g,dap -> lin NP {
    s=\\c =>dap.s!c!g ;
    acc_clit=[] ; dat_clit=[] ; a=R.agrgP3 g dap.n ; isPron=False
  } ;

  lex_UseDAP : DAP -> NP = \dap -> lex_dapAsNP R.Masc dap ;
  lex_UseDAPMasc : DAP -> NP = lex_UseDAP ;
  lex_UseDAPFem : DAP -> NP = \dap -> lex_dapAsNP R.Fem dap ;

}
