-- FILE: QuestionSqi.gf
concrete QuestionSqi of Question = CatSqi **
  open ResSqi, Prelude in {

  oper
    questionSep : Str = " " ;

  lincat
    -- QVP is not defined in CatSqi, so we define it here.
    QVP = {s : Str} ;

  lin
    AddAdvQVP qvp iadv =
      {s = qvp.s ++ questionSep ++ iadv.s} ;

    AdvIAdv iadv adv =
      {s = iadv.s ++ questionSep ++ adv.s} ;

    -- CatSqi: IP = {s : Str}
    AdvIP ip adv =
      {s = ip.s ++ questionSep ++ adv.s} ;

    AdvQVP vp iadv =
      {s = vp.s ++ questionSep ++ iadv.s} ;

    -- CatSqi: IComp = {s : Str}
    CompIAdv iadv =
      {s = iadv.s} ;

    CompIP ip =
      {s = ip.s} ;

    ComplSlashIP vpslash ip =
      {s = vpslash.s ++ questionSep ++ ip.s} ;

    -- CatSqi: IDet = {s : Str}, IP = {s : Str}, CN is Noun with
    -- cn.s : Species => Case => Number => Str
    -- Fallback: pick Indef/Nom/Sg.
    IdetCN idet cn =
      {s = idet.s ++ questionSep ++ cn.s ! Indef ! Nom ! Sg} ;

    IdetIP idet =
      {s = idet.s} ;

    -- CatSqi: IQuant = {s : Str}
    IdetQuant iquant num =
      {s = iquant.s ++ questionSep ++ num.s} ;

    PrepIP prep ip =
      {s = prep.s ++ questionSep ++ ip.s} ;

    QuestCl cl =
      {s = cl.s} ;

    QuestIAdv iadv cl =
      {s = iadv.s ++ questionSep ++ cl.s} ;

    QuestIComp icomp np =
      {s = icomp.s ++ questionSep ++ np.s ! Nom} ;

    QuestQVP ip qvp =
      {s = ip.s ++ questionSep ++ qvp.s} ;

    QuestSlash ip clslash =
      {s = ip.s ++ questionSep ++ clslash.s} ;

    QuestVP ip vp =
      {s = ip.s ++ questionSep ++ vp.s} ;

} 