-- Reflexive noun-phrase family for Albanian Extend.
resource ExtendSqiRNP =
  open Prelude, GrammarSqi, CatSqi, ParamX, ClauseSqiRes,
       (R = ResSqi), ExtendSqiHelpers, (AS = AdverbSqi) in {

oper
  RNPRec : Type = {s : R.Agr => R.Case => Str ; isPron : Bool} ;
  RNPListRec : Type = {first,last : R.Agr => R.Case => Str} ;

  rnp_ReflRNP : R.VPSlash -> RNPRec -> R.VP = \sl,rnp -> case rnp.isPron of {
    True => appendClitic (vpFromSlash sl) "u" "t'u" ;
    False => appendVP (vpFromSlash sl) (\\a =>sl.c2.s ++ rnp.s!a!sl.c2.c)
  } ;

  rnp_ReflPron : RNPRec = {
    s=\\a,c =>case c of {
      R.Acc => "veten" ;
      R.Gen => "vetes" ;
      R.Dat => "vetes" ;
      R.Ablat => "vetes" ;
      R.Nom => case R.agrNumber a of {Sg=>"vetë"; Pl=>"vetë"}
    } ;
    isPron=True
  } ;

  rnp_ReflPoss : Num -> CN -> RNPRec = \num,cn -> {
    s=\\a,c =>R.cnForm cn R.Def c num.n ++ case a.p of {
      P1 => case R.agrNumber a of {Sg=>"im"; Pl=>"ynë"} ;
      P2 => case R.agrNumber a of {Sg=>"yt"; Pl=>"juaj"} ;
      P3 => "i vet"
    } ;
    isPron=False
  } ;

  rnp_PredetRNP : Predet -> RNPRec -> RNPRec = \pred,r -> r ** {
    s=\\a,c =>pred.s ++ r.s!a!c
  } ;

  rnp_AdvRNP : NP -> Prep -> RNPRec -> RNPRec = \np,prep,r -> r ** {
    s=\\a,c =>r.s!a!c ++ prep.s ++ np.s!prep.c ;
    isPron=False
  } ;

  rnp_AdvRVP : R.VP -> Prep -> RNPRec -> R.VP = \vp,prep,r ->
    appendVP vp (\\a =>prep.s ++ r.s!a!prep.c) ;

  rnp_AdvRAP : AP -> Prep -> RNPRec -> AP = \ap,prep,r -> lin AP {
    s=\\sp,c,g,n =>ap.s!sp!c!g!n ++ prep.s ++ r.s!(R.agrgP3 g n)!prep.c
  } ;

  rnp_ReflA2RNP : A2 -> RNPRec -> AP = \a2,r -> lin AP {
    s=\\sp,c,g,n =>(UseA2 a2).s!sp!c!g!n ++ a2.c2.s ++
      r.s!(R.agrgP3 g n)!a2.c2.c
  } ;

  rnp_PossPronRNP : Pron -> Num -> CN -> RNPRec -> NP = \pron,num,cn,r -> lin NP {
    s=\\c =>R.cnForm cn R.Def c num.n ++ R.nyje!R.Def!c!(cn.g!num.n)!num.n ++
      r.s!pron.a!R.Ablat ; a=R.agrgP3 (cn.g!num.n) num.n ; isPron=False
  } ;

  rnp_ConjRNP : Conj -> RNPListRec -> RNPRec = \conj,xs -> {
    s=\\a,c =>xs.first!a!c ++ conj.s ++ xs.last!a!c ;
    isPron=False
  } ;

  rnp_Base_rr_RNP : RNPRec -> RNPRec -> RNPListRec = \x,y -> {first=x.s;last=y.s} ;
  rnp_Base_nr_RNP : NP -> RNPRec -> RNPListRec = \np,r -> {
    first=\\_,c =>np.s!c ; last=r.s
  } ;
  rnp_Base_rn_RNP : RNPRec -> NP -> RNPListRec = \r,np -> {
    first=r.s ; last=\\_,c =>np.s!c
  } ;
  rnp_Cons_rr_RNP : RNPRec -> RNPListRec -> RNPListRec = \r,xs -> {
    first=\\a,c =>r.s!a!c ++ "," ++ xs.first!a!c ; last=xs.last
  } ;
  rnp_Cons_nr_RNP : NP -> RNPListRec -> RNPListRec = \np,xs -> {
    first=\\a,c =>np.s!c ++ "," ++ xs.first!a!c ; last=xs.last
  } ;

}
