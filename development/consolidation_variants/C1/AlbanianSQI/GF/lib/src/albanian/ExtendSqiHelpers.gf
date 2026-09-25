-- Shared helpers for Albanian Extend/Extra implementations.
resource ExtendSqiHelpers =
  open GrammarSqi, CatSqi, (R = ResSqi), (P = ParamX), Prelude,
       ClauseSqiRes in {

oper
  wordSep : Str = " " ;

  agrMascSg : R.Agr = R.agrgP3 R.Masc P.Sg ;

  adjSurfaceNomMascSg : A -> Str =
    \a -> a.s ! R.Nom ! R.Masc ! P.Sg ;

  apSurfaceNomMascSg : AP -> Str =
    \ap -> ap.s ! R.Indef ! R.Nom ! R.Masc ! P.Sg ;

  verbPres3sg : R.Verb -> Str =
    \v -> v.Indicative ! R.Pres ! P.Sg ! P.P3 ;

  prepSurface : R.Prep -> NP -> Str =
    \prep,np -> prep.s ++ np.s ! prep.c ;

  mkPronConst :
    Str -> Str -> Str -> Str -> Str -> R.Gender -> P.Number -> CatSqi.Pron =
    \nom,acc,dat,accCl,datCl,g,n -> lin Pron {
      s = table {
        R.Nom   => nom ;
        R.Acc   => acc ;
        R.Dat   => dat ;
        R.Gen   => dat ;
        R.Ablat => dat
      } ;
      acc_clit = accCl ;
      dat_clit = datCl ;
      a = R.agrgP3 g n ;
      isPron = True
    } ;

  adjComplStr : A -> R.Species -> R.Case -> R.Gender -> P.Number -> Str =
    \a,spec,c,g,n -> case R.adjNeedsNyje a of {
      True  => R.nyje ! spec ! c ! g ! n ++ a.s ! c ! g ! n ;
      False => a.s ! c ! g ! n
    } ;

  mkBareNpFromCn : P.Number -> CN -> NP =
    \n,cn -> lin NP {
      s = \\c => cn.s ! R.Indef ! c ! n ;
      acc_clit = [] ;
      dat_clit = [] ;
      a = R.agrgP3 (cn.g ! n) n ;
      isPron = False
    } ;

  cnSurfaceNomSg : CN -> Str =
    \cn -> cn.s ! R.Indef ! R.Nom ! P.Sg ;

  apSurfaceNomMascSgCompat : AP -> Str = apSurfaceNomMascSg ;

  mkCompatAPFromStr : Str -> AP =
    \w -> lin AP {s = \\_,_,_,_ => w} ;

  mkCompatCNFromStr : Str -> R.Gender -> CN =
    \w,g -> lin CN {s = \\_,_,_ => w ; g = table {P.Sg=>g ; P.Pl=>g}} ;

  mkCompatNPFromStr : Str -> R.Gender -> P.Number -> NP =
    \w,g,n -> lin NP {
      s = \\_ => w ;
      acc_clit = [] ;
      dat_clit = [] ;
      a = R.agrgP3 g n ;
      isPron = False
    } ;

  vpSurfaceDefault : VP -> Str =
    \vp -> realizeSubjVP vp P.Pos agrMascSg ;

  slashSurfaceDefault : VPSlash -> Str =
    \sl -> realizeSubjVP (vpFromSlash sl) P.Pos agrMascSg ;

}
