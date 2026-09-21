-- Albanian names module.  Names become full NPs only at the consumer
-- boundary; the lexical name categories themselves remain strings.
concrete NamesSqi of Names = CatSqi ** open Prelude, ResSqi in {

oper
  nameNP : Gender -> Number -> Str -> NP = \g,n,s -> lin NP {
    s = \\_ => s ;
    acc_clit = [] ;
    dat_clit = [] ;
    a = agrgP3 g n ;
    isPron = False
  } ;

lin
  GivenName n = nameNP Masc Sg n.s ;
  MaleSurname n = nameNP Masc Sg n.s ;
  FemaleSurname n = nameNP Fem Sg n.s ;
  PlSurname n = nameNP Masc Pl n.s ;
  FullName n s = nameNP Masc Sg (n.s ++ s.s) ;

  UseLN n = nameNP Masc Sg n.s ;
  PlainLN n = nameNP Masc Sg n.s ;
  InLN n = {s = "në" ++ n.s} ;
  AdjLN ap n = {
    s = n.s ++ ap.s ! Def ! Nom ! Masc ! Sg
  } ;
}
