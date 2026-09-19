concrete RelativeSqi of Relative = CatSqi **
  open Prelude, ParamX, ResSqi, ClauseSqiRes in {

lin
  RelCl cl = {s = \_,t,ant,pol => "që" ++ cl.s ! t ! ant ! pol} ;

  RelVP rp vp = {
    s = \agr,t,ant,pol => rp.s ! Nom ! agr.gn ++ realizeVP vp t ant pol agr
  } ;

  RelSlash rp cl = {
    s = \agr,t,ant,pol =>
      cl.c2.s ++ rp.s ! cl.c2.c ! agr.gn ++ cl.s ! t ! ant ! pol
  } ;

  IdRP = {s = \_,_ => "që"} ;

  FunRP prep np rp = {
    s = \c,g => prep.s ++ np.s ! prep.c ++ rp.s ! c ! g
  } ;
}
