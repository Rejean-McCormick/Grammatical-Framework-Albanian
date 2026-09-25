concrete RelativeSqi of Relative = CatSqi **
  open Prelude, ParamX, ResSqi, ClauseSqiRes in {

lin
  RelCl cl = {s = \\_,t,ant,pol => "që" ++ cl.s ! t ! ant ! pol} ;

  RelVP rp vp = {
    s = \\agr,t,ant,pol => rp.s ! Nom ! agr.gn ++ realizeVP vp t ant pol agr
  } ;

  RelSlash rp cl = {
    s = \\agr,t,ant,pol =>
      cl.c2.s ++ rp.s ! cl.c2.c ! agr.gn ++ cl.s ! t ! ant ! pol
  } ;

  -- Standard declined relative pronoun cili.  RelCl keeps invariant që as the
  -- common complementizer strategy; IdRP is the fully inflected RP strategy.
  IdRP = {s = \\c,gn => case <c,gn> of {
    <Nom,GSg Masc> => "i" ++ "cili" ;
    <Nom,GSg Fem>  => "e" ++ "cila" ;
    <Nom,GPl Masc> => "të" ++ "cilët" ;
    <Nom,GPl Fem>  => "të" ++ "cilat" ;
    <Acc,GSg Masc> => "të" ++ "cilin" ;
    <Acc,GSg Fem>  => "të" ++ "cilën" ;
    <Acc,GPl Masc> => "të" ++ "cilët" ;
    <Acc,GPl Fem>  => "të" ++ "cilat" ;
    <Gen,GSg Masc> => "të" ++ "cilit" ;
    <Gen,GSg Fem>  => "së" ++ "cilës" ;
    <Gen,GPl Masc> => "të" ++ "cilëve" ;
    <Gen,GPl Fem>  => "të" ++ "cilave" ;
    <Dat,GSg Masc> => "të" ++ "cilit" ;
    <Dat,GSg Fem>  => "së" ++ "cilës" ;
    <Dat,GPl Masc> => "të" ++ "cilëve" ;
    <Dat,GPl Fem>  => "të" ++ "cilave" ;
    <Ablat,GSg Masc> => "të" ++ "cilit" ;
    <Ablat,GSg Fem>  => "së" ++ "cilës" ;
    <Ablat,GPl Masc> => "të" ++ "cilëve" ;
    <Ablat,GPl Fem>  => "të" ++ "cilave"
  }} ;

  FunRP prep np rp = {
    s = \\c,g => np.s ! c ++ prep.s ++ rp.s ! prep.c ! g
  } ;
}
