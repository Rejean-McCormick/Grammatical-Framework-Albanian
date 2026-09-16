-- FILE: ConstructionSqi.gf
concrete ConstructionSqi of Construction = CatSqi **
  open ResSqi, Prelude, Predef, ParamX in {

  lincat
    Timeunit, Hour, Weekday, Month, Monthday, Year, Language = {s : Str} ;

  oper
    -- GF 3.12: Int is a built-in type; convert via Predef.show when needed.
    showIntStr : Int -> Str = \i -> Predef.show Predef.Int i ;

    -- Constant noun (same surface form everywhere), with a gender
    mkNConst : Gender -> Str -> Noun = \g,w ->
      mkNoun w w w w w w w w w w w w w w w w g ;

    -- Constant NP (same surface form in all cases)
    -- Use `lin NP` so any lock field required by the RGL lincat is added.
    mkNPConst : Gender -> Number -> Str -> NP = \g,n,w ->
      lin NP { s = \\_ => w ; a = agrgP3 g n } ;

    copBe : Str = "është" ;

  lin
    -- Dates / time adverbs (simple concatenation fallbacks)
    dayMonthAdv d m = {s = d.s ++ m.s} ;
    dayMonthYearAdv d m y = {s = d.s ++ m.s ++ y.s} ;

    monthAdv m = {s = m.s} ;
    monthYearAdv m y = {s = m.s ++ y.s} ;
    yearAdv y = {s = y.s} ;

    -- Months / weekdays as nouns / proper names
    monthN m = mkNConst Masc m.s ;
    monthPN m = {s = m.s} ;

    weekdayN w = mkNConst Fem w.s ;
    weekdayPN w = {s = w.s} ;
    weekdayLastAdv w = {s = w.s ++ "e" ++ "kaluar"} ;
    weekdayNextAdv w = {s = w.s ++ "e" ++ "ardhshme"} ;
    weekdayPunctualAdv w = {s = "të" ++ w.s} ;
    weekdayHabitualAdv w = {s = "çdo" ++ w.s} ;

    intMonthday i = {s = i.s} ;
    intYear i = {s = i.s} ;

    -- Languages
    InLanguage lang = {s = "në" ++ lang.s} ;

    languageCN lang = mkNConst Fem ("gjuhë" ++ lang.s) ;
    languageNP lang = mkNPConst Fem Sg ("gjuha" ++ lang.s) ;

    -- Age / name / questions (stringy fallbacks)
    has_age_VP c = {s = c.s ++ "vjeç"} ;

    -- name behaves NP-like in your setup (name.s : Case => Str), so pick Nom
    have_name_Cl np name = {s = np.s ! Nom ++ "quhet" ++ name.s ! Nom} ;
    what_name_QCl np = {s = "si" ++ "quhet" ++ np.s ! Nom} ;

    how_old_QCl np = {s = "sa" ++ "vjeç" ++ copBe ++ np.s ! Nom} ;
    how_far_QCl np = {s = "sa" ++ "larg" ++ copBe ++ np.s ! Nom} ;

    -- Deictic motion questions and predicates. VP/QCl are shallow in the
    -- current Albanian category model, so these are realized directly.
    where_go_QCl np = {s = "ku" ++ "shkon" ++ np.s ! Nom} ;
    where_come_from_QCl np = {s = "nga" ++ "ku" ++ "vjen" ++ np.s ! Nom} ;

    go_here_VP = {s = "shkon" ++ "këtu"} ;
    come_here_VP = {s = "vjen" ++ "këtu"} ;
    come_from_here_VP = {s = "vjen" ++ "nga" ++ "këtu"} ;

    go_there_VP = {s = "shkon" ++ "atje"} ;
    come_there_VP = {s = "vjen" ++ "atje"} ;
    come_from_there_VP = {s = "vjen" ++ "nga" ++ "atje"} ;

    married_Cl np other =
      {s = np.s ! Nom ++ copBe ++ "i" ++ "martuar" ++ "me" ++ other.s ! Nom} ;

    hungry_VP  = {s = "i" ++ "uritur"} ;
    thirsty_VP = {s = "i" ++ "etur"} ;
    tired_VP   = {s = "i" ++ "lodhur"} ;
    ill_VP     = {s = "i" ++ "sëmurë"} ;
    scared_VP  = {s = "i" ++ "frikësuar"} ;
    ready_VP   = {s = "gati"} ;

    is_right_VP = {s = "me" ++ "të" ++ "drejtë"} ;
    is_wrong_VP = {s = "gabim"} ;

    -- Weather: "moti është AP"
    weather_adjCl ap =
      {s = "moti" ++ copBe ++ ap.s ! Indef ! Nom ! Masc ! Sg} ;

    -- Time unit adverbials / quantity constructions
    timeunitAdv c tu = {s = c.s ++ tu.s} ;

    n_units_AP c cn a = {
      s = \\spec,cas,g,n =>
            c.s ++ cn.s ! Indef ! cas ! Pl ++ a.s ! cas ! g ! n
    } ;

    n_units_of_NP c cn np =
      lin NP {
        s = \\cas => c.s ++ cn.s ! Indef ! cas ! Pl ++ "prej" ++ np.s ! Ablat ;
        a = agrgP3 Masc Pl
      } ;

    -- Compound unit noun: keep the head CN's full nominal table and gender.
    n_unit_CN c unit cn = {
      s = \\spec,cas,n =>
            c.s ++ unit.s ! Indef ! cas ! Sg ++ cn.s ! spec ! cas ! n ;
      g = cn.g
    } ;

    -- Container constructions keep a full CN shape.
    bottle_of_CN np = {
      s = \\spec,cas,n =>
            (mkNConst Fem "shishe").s ! spec ! cas ! n ++ "me" ++ np.s ! Ablat ;
      g = Fem
    } ;
    cup_of_CN np = {
      s = \\spec,cas,n =>
            (mkNConst Masc "filxhan").s ! spec ! cas ! n ++ "me" ++ np.s ! Ablat ;
      g = Masc
    } ;
    glass_of_CN np = {
      s = \\spec,cas,n =>
            (mkNConst Fem "gotë").s ! spec ! cas ! n ++ "me" ++ np.s ! Ablat ;
      g = Fem
    } ;

    few_X_short_of_Y np x y = lin S {
      s = np.s ! Nom ++ "ka" ++ "pak" ++ x.s ! Indef ! Acc ! Pl ++
          "më pak se" ++ y.s ! Indef ! Acc ! Sg
    } ;

    timeunitRange lo hi tu = lin Adv {
      s = lo.s ++ "deri" ++ hi.s ++ tu.s
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