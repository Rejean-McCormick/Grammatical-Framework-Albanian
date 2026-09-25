concrete RelativeSqi of Relative = CatSqi **
  open Prelude, ParamX, ResSqi, ClauseSqiRes in {

lin
  RelCl cl = {s = \\_,t,ant,pol => markRelativeClause (cl.s ! t ! ant ! pol)} ;

  RelVP rp vp = {
    s = \\agr,t,ant,pol => mkClause (rp.s ! Nom ! agr.gn) agr vp t ant pol
  } ;

  RelSlash rp cl = {
    s = \\agr,t,ant,pol =>
      frontGovernedRP cl.c2 rp.s agr.gn (cl.s ! t ! ant ! pol)
  } ;

  IdRP = {s = \\_,_ => invariantRelativeMarker} ;

  FunRP prep np rp = {
    s = \\c,g => prep.s ++ np.s ! prep.c ++ rp.s ! c ! g
  } ;
}
