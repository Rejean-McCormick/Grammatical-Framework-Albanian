-- Albanian construction grammar built on the same deferred VP/Cl core.
concrete ConstructionSqi of Construction = CatSqi **
  open ResSqi, Prelude, Predef, ParamX, ClauseSqiRes, (P=ParadigmsSqi), (I=IrregSqi) in {

  lincat
    Timeunit, Hour, Weekday, Month, Monthday, Year, Language = {s : Str} ;

  oper
    showIntStr : Int -> Str = \i -> Predef.show Predef.Int i ;

    mkNConst : Gender -> Str -> Noun = \g,w ->
      mkNoun w w w w w w w w w w w w w w w w g ;

    mkNPConst : Gender -> Number -> Str -> NP = \g,n,w -> lin NP {
      s=\\_=>w; acc_clit=[]; dat_clit=[]; a=agrgP3 g n; isPron=False
    } ;

    mkPNConst : Gender -> Str -> PN = \g,w -> lin PN {
      s=\\_=>w ; a=agrgP3 g Sg
    } ;

    constructionBaseVP : Verb -> VP = emptyVP ;
    constructionAddPost : VP -> (Agr => Str) -> VP = appendVP ;

    mkPred : Str -> Agr -> VP -> Cl = \subj,a,vp -> lin Cl {
      s=\\t,ant,pol =>mkClause subj a vp t ant pol
    } ;

    copVP : (Agr => Str) -> VP = \x -> appendVP (emptyVP (lin Verb I.jam_V)) x ;

    qualVP : Str -> Str -> VP = \m,f -> copVP (\\a=>case agrGender a of {
      Masc=>m; Fem=>f
    }) ;

  lin
    dayMonthAdv d m = {s=d.s ++ m.s} ;
    dayMonthYearAdv d m y = {s=d.s ++ m.s ++ y.s} ;
    monthAdv m = {s=m.s} ;
    monthYearAdv m y = {s=m.s ++ y.s} ;
    yearAdv y = {s=y.s} ;

    monthN m = mkNConst Masc m.s ;
    monthPN m = mkPNConst Masc m.s ;
    weekdayN w = mkNConst Fem w.s ;
    weekdayPN w = mkPNConst Fem w.s ;
    weekdayLastAdv w = {s=w.s ++ "e" ++ "kaluar"} ;
    weekdayNextAdv w = {s=w.s ++ "e" ++ "ardhshme"} ;
    weekdayPunctualAdv w = {s="të" ++ w.s} ;
    weekdayHabitualAdv w = {s="çdo" ++ w.s} ;

    intMonthday i = {s=i.s} ;
    intYear i = {s=i.s} ;

    InLanguage lang = {s="në" ++ lang.s} ;
    languageCN lang = mkNConst Fem ("gjuhë" ++ lang.s) ;
    languageNP lang = mkNPConst Fem Sg ("gjuha" ++ lang.s) ;

    has_age_VP c = constructionAddPost (constructionBaseVP (lin Verb I.kam_V)) (\\_=>c.s ++ "vjeç") ;

    have_name_Cl np name =
      mkPred (np.s!Nom) np.a
        (constructionAddPost
          (constructionBaseVP (lin Verb (P.mkV "quhem")))
          (\\_ =>name.s!Nom)) ;

    what_name_QCl np = {
      s=\\t,a,p=>"si" ++ (have_name_Cl np (mkNPConst Masc Sg [])).s!t!a!p
    } ;

    how_old_QCl np = {
      s=\\t,a,p=>"sa" ++ "vjeç" ++
        realizeVP (constructionBaseVP (lin Verb I.jam_V)) t a p np.a ++ np.s!Nom
    } ;

    how_far_QCl np = {
      s=\\t,a,p=>"sa" ++ "larg" ++
        realizeVP (constructionBaseVP (lin Verb I.jam_V)) t a p np.a ++ np.s!Nom
    } ;



    married_Cl np other =
      mkPred (np.s!Nom) np.a
        (constructionAddPost (qualVP "i martuar" "e martuar") (\\_=>"me" ++ other.s!Acc)) ;

    hungry_VP  = qualVP "i uritur" "e uritur" ;
    thirsty_VP = qualVP "i etur" "e etur" ;
    tired_VP   = qualVP "i lodhur" "e lodhur" ;
    ill_VP     = qualVP "i sëmurë" "e sëmurë" ;
    scared_VP  = qualVP "i frikësuar" "e frikësuar" ;
    ready_VP   = copVP (\\_=>"gati") ;
    is_right_VP = copVP (\\_=>"me të drejtë") ;
    is_wrong_VP = copVP (\\_=>"gabim") ;

    weather_adjCl ap =
      mkPred "moti" {gn=GSg Masc;p=P3}
        (copVP (\\_=>ap.s!Indef!Nom!Masc!Sg)) ;

    timeunitAdv c tu = {s=c.s ++ tu.s} ;
    timeunitRange lo hi tu = {s=lo.s ++ "deri" ++ hi.s ++ tu.s} ;

    n_units_AP c cn a = {
      s=\\sp,cas,g,n=>c.s ++ cn.s!Indef!cas!Pl ++ a.s!cas!g!n
    } ;

    n_units_of_NP c cn np = lin NP {
      s=\\cas=>c.s ++ cn.s!Indef!cas!Pl ++ "prej" ++ np.s!Ablat;
      acc_clit=[]; dat_clit=[]; a=agrgP3 Masc Pl; isPron=False
    } ;

    n_unit_CN c unit cn = {
      s=\\sp,cas,n=>c.s ++ unit.s!Indef!cas!Sg ++ cn.s!sp!cas!n;
      g=cn.g
    } ;

    bottle_of_CN np = {
      s=\\sp,cas,n=>(mkNConst Fem "shishe").s!sp!cas!n ++ "me" ++ np.s!Acc;
      g=Fem
    } ;
    cup_of_CN np = {
      s=\\sp,cas,n=>(mkNConst Masc "filxhan").s!sp!cas!n ++ "me" ++ np.s!Acc;
      g=Masc
    } ;
    glass_of_CN np = {
      s=\\sp,cas,n=>(mkNConst Fem "gotë").s!sp!cas!n ++ "me" ++ np.s!Acc;
      g=Fem
    } ;

    few_X_short_of_Y np x y = {
      s=np.s!Nom ++
        realizeVP (constructionBaseVP (lin Verb I.kam_V)) ParamX.Pres Simul Pos np.a ++
        "pak" ++ x.s!Indef!Acc!Pl ++
        "më pak se" ++ y.s!Indef!Acc!Sg
    } ;

    oneHour = {s = "1"} ;
    twoHour = {s = "2"} ;
    threeHour = {s = "3"} ;
    fourHour = {s = "4"} ;
    fiveHour = {s = "5"} ;
    sixHour = {s = "6"} ;
    sevenHour = {s = "7"} ;
    eightHour = {s = "8"} ;
    nineHour = {s = "9"} ;
    tenHour = {s = "10"} ;
    elevenHour = {s = "11"} ;
    twelveHour = {s = "12"} ;
    thirteenHour = {s = "13"} ;
    fourteenHour = {s = "14"} ;
    fifteenHour = {s = "15"} ;
    sixteenHour = {s = "16"} ;
    seventeenHour = {s = "17"} ;
    eighteenHour = {s = "18"} ;
    nineteenHour = {s = "19"} ;
    twentyHour = {s = "20"} ;
    twentyOneHour = {s = "21"} ;
    twentyTwoHour = {s = "22"} ;
    twentyThreeHour = {s = "23"} ;
    twentyFourHour = {s = "24"} ;

    timeHour h = lin Adv {s = "në" ++ "orën" ++ h.s} ;
    timeHourMinute h m = lin Adv {s = "në" ++ "orën" ++ h.s ++ "e" ++ m.s} ;

    second_Timeunit = {s = "sekondë"} ;
    minute_Timeunit = {s = "minutë"} ;
    hour_Timeunit = {s = "orë"} ;
    day_Timeunit = {s = "ditë"} ;
    week_Timeunit = {s = "javë"} ;
    month_Timeunit = {s = "muaj"} ;
    year_Timeunit = {s = "vit"} ;

    monday_Weekday = {s = "hënë"} ;
    tuesday_Weekday = {s = "martë"} ;
    wednesday_Weekday = {s = "mërkurë"} ;
    thursday_Weekday = {s = "enjte"} ;
    friday_Weekday = {s = "premte"} ;
    saturday_Weekday = {s = "shtunë"} ;
    sunday_Weekday = {s = "diel"} ;

    january_Month = {s = "janar"} ;
    february_Month = {s = "shkurt"} ;
    march_Month = {s = "mars"} ;
    april_Month = {s = "prill"} ;
    may_Month = {s = "maj"} ;
    june_Month = {s = "qershor"} ;
    july_Month = {s = "korrik"} ;
    august_Month = {s = "gusht"} ;
    september_Month = {s = "shtator"} ;
    october_Month = {s = "tetor"} ;
    november_Month = {s = "nëntor"} ;
    december_Month = {s = "dhjetor"} ;

    afrikaans_Language = {s = "afrikanisht"} ;
    amharic_Language = {s = "amharisht"} ;
    arabic_Language = {s = "arabisht"} ;
    bulgarian_Language = {s = "bullgarisht"} ;
    catalan_Language = {s = "katalanisht"} ;
    chinese_Language = {s = "kinezisht"} ;
    danish_Language = {s = "danisht"} ;
    dutch_Language = {s = "holandisht"} ;
    english_Language = {s = "anglisht"} ;
    estonian_Language = {s = "estonisht"} ;
    finnish_Language = {s = "finlandisht"} ;
    french_Language = {s = "frëngjisht"} ;
    german_Language = {s = "gjermanisht"} ;
    greek_Language = {s = "greqisht"} ;
    hebrew_Language = {s = "hebraisht"} ;
    hindi_Language = {s = "hindisht"} ;
    japanese_Language = {s = "japonisht"} ;
    italian_Language = {s = "italisht"} ;
    latin_Language = {s = "latinisht"} ;
    latvian_Language = {s = "letonisht"} ;
    maltese_Language = {s = "maltezisht"} ;
    nepali_Language = {s = "nepalisht"} ;
    norwegian_Language = {s = "norvegjisht"} ;
    persian_Language = {s = "persisht"} ;
    polish_Language = {s = "polonisht"} ;
    punjabi_Language = {s = "punjabisht"} ;
    romanian_Language = {s = "rumanisht"} ;
    russian_Language = {s = "rusisht"} ;
    sindhi_Language = {s = "sindisht"} ;
    spanish_Language = {s = "spanjisht"} ;
    swahili_Language = {s = "suahilisht"} ;
    swedish_Language = {s = "suedisht"} ;
    thai_Language = {s = "tajlandisht"} ;
    turkish_Language = {s = "turqisht"} ;
    urdu_Language = {s = "urdu"} ;

}
