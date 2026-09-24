concrete ConjunctionSqi of Conjunction = CatSqi **
  open Prelude, ParamX, ResSqi in {

  lincat
    [S] = {first,last : Str} ;
    [RS] = {first,last : Agr => Str} ;
    [Adv] = {first,last : Str} ;
    [AdV] = {first,last : Str} ;
    [IAdv] = {first,last : Str} ;
    [NP] = {first,last : Case => Str ; a : Agr} ;
    [AP] = {first,last : Species => Case => Gender => Number => Str} ;
    [CN] = {first,last : Species => Case => Number => Str ; g : Number => Gender} ;
    [DAP] = {first,last : Case => Gender => Str ; n : Number} ;

  oper
    coordPerson : Person -> Person -> Person = \p,q -> case <p,q> of {
      <P1,_> => P1 ; <_,P1> => P1 ;
      <P2,_> => P2 ; <_,P2> => P2 ;
      _ => P3
    } ;

    coordGender : Agr -> Agr -> Gender = \a,b -> case <agrGender a,agrGender b> of {
      <Fem,Fem> => Fem ;
      _ => Masc
    } ;

    coordAgr : Agr -> Agr -> Agr = \a,b -> {
      gn = GPl (coordGender a b) ;
      p = coordPerson a.p b.p
    } ;

    coordNounGender : (Number => Gender) -> (Number => Gender) -> Number => Gender =
      \g1,g2 => table {
        Sg => case <g1 ! Sg,g2 ! Sg> of {<Fem,Fem>=>Fem ; _=>Masc} ;
        Pl => case <g1 ! Pl,g2 ! Pl> of {<Fem,Fem>=>Fem ; _=>Masc}
      } ;

  lin
    BaseS x y = {first=x.s; last=y.s} ;
    ConsS x xs = {first=x.s ++ "," ++ xs.first; last=xs.last} ;
    ConjS c xs = {s=xs.first ++ c.s ++ xs.last} ;

    BaseAdv x y = {first=x.s; last=y.s} ;
    ConsAdv x xs = {first=x.s ++ "," ++ xs.first; last=xs.last} ;
    ConjAdv c xs = {s=xs.first ++ c.s ++ xs.last} ;

    BaseAdV x y = {first=x.s; last=y.s} ;
    ConsAdV x xs = {first=x.s ++ "," ++ xs.first; last=xs.last} ;
    ConjAdV c xs = {s=xs.first ++ c.s ++ xs.last} ;

    BaseIAdv x y = {first=x.s; last=y.s} ;
    ConsIAdv x xs = {first=x.s ++ "," ++ xs.first; last=xs.last} ;
    ConjIAdv c xs = {s=xs.first ++ c.s ++ xs.last} ;

    BaseNP x y = {first=x.s; last=y.s; a=coordAgr x.a y.a} ;
    ConsNP x xs = {
      first=\\c=>x.s!c ++ "," ++ xs.first!c;
      last=xs.last; a=coordAgr x.a xs.a
    } ;
    ConjNP c xs = {
      s=\\k=>xs.first!k ++ c.s ++ xs.last!k;
      acc_clit=[]; dat_clit=[]; a=xs.a; isPron=False
    } ;

    BaseAP x y = {first=x.s; last=y.s} ;
    ConsAP x xs = {
      first=\\sp,k,g,n=>x.s!sp!k!g!n ++ "," ++ xs.first!sp!k!g!n;
      last=xs.last
    } ;
    ConjAP c xs = {
      s=\\sp,k,g,n=>xs.first!sp!k!g!n ++ c.s ++ xs.last!sp!k!g!n
    } ;

    BaseRS x y = {first=x.s; last=y.s} ;
    ConsRS x xs = {
      first=\\a=>x.s!a ++ "," ++ xs.first!a; last=xs.last
    } ;
    ConjRS c xs = {s=\\a=>xs.first!a ++ c.s ++ xs.last!a} ;

    BaseCN x y = {first=x.s; last=y.s; g=coordNounGender x.g y.g} ;
    ConsCN x xs = {
      first=\\sp,k,n=>x.s!sp!k!n ++ "," ++ xs.first!sp!k!n;
      last=xs.last; g=coordNounGender x.g xs.g
    } ;
    ConjCN c xs = {
      s=\\sp,k,n=>xs.first!sp!k!n ++ c.s ++ xs.last!sp!k!n;
      g=xs.g
    } ;

    BaseDAP x y = {first=x.s; last=y.s; n=Pl} ;
    ConsDAP x xs = {
      first=\\k,g=>x.s!k!g ++ "," ++ xs.first!k!g;
      last=xs.last; n=Pl
    } ;
    ConjDet c xs = {
      s=\\k,g=>xs.first!k!g ++ c.s ++ xs.last!k!g;
      n=xs.n; spec=Def; placement=PreNominal
    } ;
}
