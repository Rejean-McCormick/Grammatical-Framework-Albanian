-- Shared helpers for Albanian Extend/Extra implementations.
resource ExtendSqiHelpers =
  open GrammarSqi, CatSqi, (R = ResSqi), (P = ParamX), Prelude,
       ClauseSqiRes in {

oper
  wordSep : Str = " " ;

  agrMascSg : R.Agr = R.agrgP3 R.Masc P.Sg ;

  adjSurfaceNomMascSg : A -> Str =
    \a -> R.adjForm a R.Nom R.Masc P.Sg ;

  apSurfaceNomMascSg : AP -> Str =
    \ap -> ap.s ! R.Indef ! R.Nom ! R.Masc ! P.Sg ;

  verbPres3sg : R.Verb -> Str =
    \v -> v.Indicative ! R.Pres ! P.Sg ! P.P3 ;

  prepSurface : R.Prep -> NP -> Str =
    \prep,np -> prep.s ++ np.s ! prep.c ;

  mkPronConst :
    Str -> Str -> Str -> R.Gender -> P.Number -> CatSqi.Pron =
    \nom,acc,gendat,g,n -> lin Pron {
      s = table {
        R.Nom   => nom ;
        R.Acc   => acc ;
        R.Gen   => gendat ;
        R.Dat   => gendat ;
        R.Ablat => gendat
      } ;
      a = R.agrgP3 g n ;
      isPron = True
    } ;

  adjComplStr : A -> R.Species -> R.Case -> R.Gender -> P.Number -> Str =
    \a,spec,c,g,n -> case a.clit of {
      True  => R.link_clitic ! spec ! c ! g ! n ++ R.adjForm a c g n ;
      False => R.adjForm a c g n
    } ;

  mkBareNpFromCn : P.Number -> CN -> NP =
    \n,cn -> lin NP {
      s = \\c => R.nounForm cn R.Indef c n ;
      a = R.agrgP3 cn.g n ;
      isPron = False
    } ;

  cnSurfaceNomSg : CN -> Str =
    \cn -> R.nounForm cn R.Indef R.Nom P.Sg ;

  apSurfaceNomMascSgCompat : AP -> Str = apSurfaceNomMascSg ;

  mkCompatAPFromStr : Str -> AP =
    \w -> lin AP {s = \\_,_,_,_ => w} ;

  mkCompatCNFromStr : Str -> R.Gender -> CN =
    \w,g -> lin CN {s = \\_,_,_ => w ; g = g} ;

  mkCompatNPFromStr : Str -> R.Gender -> P.Number -> NP =
    \w,g,n -> lin NP {
      s = \\_ => w ;
      a = R.agrgP3 g n ;
      isPron = False
    } ;

  vpSurfaceDefault : VP -> Str =
    \vp -> realizeSubjVP vp P.Pos agrMascSg ;

  slashSurfaceDefault : VPSlash -> Str =
    \sl -> realizeSubjVP (vpFromSlash sl) P.Pos agrMascSg ;

}
