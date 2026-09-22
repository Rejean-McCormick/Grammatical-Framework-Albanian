-- Albanian names with explicit case/agreement support.
concrete NamesSqi of Names = CatSqi ** open Prelude, ResSqi in {

oper
  namedNP : (Case => Str) -> Agr -> NP = \forms,a -> lin NP {
    s = forms ;
    acc_clit = [] ;
    dat_clit = [] ;
    a = a ;
    isPron = False
  } ;

lin
  GivenName n = namedNP n.s (agrgP3 n.g Sg) ;
  MaleSurname n = namedNP (n.s ! Masc) (agrgP3 Masc Sg) ;
  FemaleSurname n = namedNP (n.s ! Fem) (agrgP3 Fem Sg) ;
  PlSurname n = namedNP n.p (agrgP3 Masc Pl) ;

  FullName n sn = namedNP
    (\\c => n.s ! Nom ++ sn.s ! n.g ! c)
    (agrgP3 n.g Sg) ;

  UseLN n = namedNP n.s n.a ;
  PlainLN n = namedNP n.s n.a ;
  InLN n = {s = "në" ++ n.s ! Acc} ;
  AdjLN ap n = n ** {
    s = \\c => n.s ! c ++
      ap.s ! Def ! c ! agrGender n.a ! agrNumber n.a
  } ;
}
