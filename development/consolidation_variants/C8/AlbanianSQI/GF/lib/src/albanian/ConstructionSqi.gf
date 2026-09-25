-- Albanian construction grammar built on the same deferred VP/Cl core.
concrete ConstructionSqi of Construction = CatSqi **
  open ResSqi, Prelude, Predef, ParamX, ClauseSqiRes, (P=ParadigmsSqi), (I=IrregSqi) in {

  lincat
    Timeunit, Hour, Month, Monthday, Year, Language = {s : Str} ;
    -- Weekdays are article-bearing feminine nominals in Albanian.  Keep the
    -- citation/nominative form and the temporal accusative form separately so
    -- "e hënë" and "të hënën" are not flattened into one string.
    Weekday = {nom,acc : Str} ;

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

    adjVP : A -> VP = \a -> copVP (\\agr =>
      case a.clit of {
        True => link_clitic ! Indef ! Nom ! agrGender agr ! agrNumber agr ++
                a.s ! Nom ! agrGender agr ! agrNumber agr ;
        False => a.s ! Nom ! agrGender agr ! agrNumber agr
      }) ;

    adjWordVP : Str -> VP = \x -> adjVP (P.mkA x) ;

    ageWord : Agr -> Str = \a -> case agrGender a of {
      Masc => "vjeç" ; Fem => "vjeçe"
    } ;

  lin
    dayMonthAdv d m = {s="më" ++ d.s ++ m.s} ;
    dayMonthYearAdv d m y = {s="më" ++ d.s ++ m.s ++ y.s} ;
    monthAdv m = {s="në" ++ m.s} ;
    monthYearAdv m y = {s="në" ++ m.s ++ y.s} ;
    yearAdv y = {s="në" ++ y.s} ;

    monthN m = mkNConst Masc m.s ;
    monthPN m = mkPNConst Masc m.s ;
    weekdayN w = mkNConst Fem w.nom ;
    weekdayPN w = mkPNConst Fem w.nom ;
    weekdayLastAdv w = {s=w.acc ++ "e" ++ "kaluar"} ;
    weekdayNextAdv w = {s=w.acc ++ "e" ++ "ardhshme"} ;
    weekdayPunctualAdv w = {s=w.acc} ;
    weekdayHabitualAdv w = {s="çdo" ++ w.acc} ;

    intMonthday i = {s=i.s} ;
    intYear i = {s=i.s} ;

    InLanguage lang = {s="në" ++ lang.s} ;
    languageCN lang = mkNConst Fem ("gjuhë" ++ lang.s) ;
    languageNP lang = mkNPConst Fem Sg ("gjuha" ++ lang.s) ;

    has_age_VP c = constructionAddPost (constructionBaseVP (lin Verb I.jam_V)) (\\a=>c.s ++ ageWord a) ;

    have_name_Cl np name = lin Cl {
      s = \\t,ant,pol =>
        np.s!Nom ++ realizeVP (constructionBaseVP (lin Verb (P.mkV "quhem"))) t ant pol np.a ++ name.s!Nom
    } ;

    what_name_QCl np = {
      -- Si quhet ai? / Si quheni ju? Predicate precedes the overt subject.
      s=\\t,a,p=>"si" ++ realizeVP
        (constructionBaseVP (lin Verb (P.mkV "quhem"))) t a p np.a ++ np.s!Nom
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
        (constructionAddPost (adjWordVP "martuar") (\\_=>"me" ++ other.s!Acc)) ;

    -- Productive adjective paradigms retain gender and number; this matters for
    -- coordinated/plural subjects, unlike the former two-string singular fallback.
    hungry_VP  = adjWordVP "uritur" ;
    thirsty_VP = adjWordVP "etur" ;
    tired_VP   = adjWordVP "lodhur" ;
    ill_VP     = adjWordVP "sëmurë" ;
    scared_VP  = adjWordVP "frikësuar" ;
    ready_VP   = adjVP (P.unartA (P.mkA "gati")) ;

    -- Idiomatic Albanian predication: ka të drejtë / e ka gabim.
    is_right_VP = constructionAddPost
      (constructionBaseVP (lin Verb I.kam_V)) (\\_=>"të drejtë") ;
    is_wrong_VP = constructionAddPost
      (appendClitic (constructionBaseVP (lin Verb I.kam_V)) "e" "ta")
      (\\_=>"gabim") ;

    weather_adjCl ap = {
      s=\\t,a,p=>"moti" ++ realizeVP
        (copVP (\\_=>ap.s!Indef!Nom!Masc!Sg)) t a p {gn=GSg Masc;p=P3}
    } ;

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

    monday_Weekday = {nom = "e hënë" ; acc = "të hënën"} ;
    tuesday_Weekday = {nom = "e martë" ; acc = "të martën"} ;
    wednesday_Weekday = {nom = "e mërkurë" ; acc = "të mërkurën"} ;
    thursday_Weekday = {nom = "e enjte" ; acc = "të enjten"} ;
    friday_Weekday = {nom = "e premte" ; acc = "të premten"} ;
    saturday_Weekday = {nom = "e shtunë" ; acc = "të shtunën"} ;
    sunday_Weekday = {nom = "e diel" ; acc = "të dielën"} ;

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
