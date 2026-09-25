concrete QuestionSqi of Question = CatSqi **
  open Prelude, ParamX, ResSqi, ClauseSqiRes, (I = IrregSqi) in {

  lincat QVP = VP ;

lin
  -- Standard polar questions are introduced by a.
  QuestCl cl = {s = \\t,ant,pol => "a" ++ cl.s ! t ! ant ! pol} ;

  QuestVP ip vp = {
    s = \\t,ant,pol => ip.s ! Nom ++ realizeVP vp t ant pol ip.a
  } ;

  QuestSlash ip cl = {
    s = \\t,ant,pol => cl.c2.s ++ ip.s ! cl.c2.c ++ cl.s ! t ! ant ! pol ++ cl.gapPost ! ip.a
  } ;

  QuestIAdv iadv cl = {
    s = \\t,ant,pol => iadv.s ++ cl.s ! t ! ant ! pol
  } ;

  QuestIComp icomp np = {
    s = \\t,ant,pol =>
      icomp.s ++ realizeVP (emptyVP (lin Verb I.jam_V)) t ant pol np.a ++ np.s ! Nom
  } ;

  IdetCN idet cn = {
    s = \\c => idet.s ! c ! (cn.g ! idet.n) ++ cn.s ! Indef ! c ! idet.n ;
    a = agrgP3 (cn.g ! idet.n) idet.n
  } ;

  IdetIP idet = {
    s = \\c => idet.s ! c ! Masc ;
    a = agrgP3 Masc idet.n
  } ;

  AdvIP ip adv = ip ** {s = \\c => ip.s ! c ++ adv.s} ;

  IdetQuant iq num = {
    s = \\c,g => iq.s ! c ! g ! num.n ++ num.s ;
    n = num.n
  } ;

  PrepIP prep ip = {s = prep.s ++ ip.s ! prep.c} ;
  AdvIAdv iadv adv = {s = iadv.s ++ adv.s} ;
  CompIAdv iadv = {s = iadv.s} ;
  CompIP ip = {s = ip.s ! Nom} ;

  ComplSlashIP sl ip = appendVP (vpFromSlash sl)
    (\\subj => sl.c2.s ++ ip.s ! sl.c2.c ++ sl.gapPost ! subj ! ip.a) ;

  AdvQVP vp iadv = appendVP vp (\\_ => iadv.s) ;
  AddAdvQVP qvp iadv = appendVP qvp (\\_ => iadv.s) ;

  QuestQVP ip qvp = {
    s = \\t,ant,pol => ip.s ! Nom ++ realizeVP qvp t ant pol ip.a
  } ;
}
