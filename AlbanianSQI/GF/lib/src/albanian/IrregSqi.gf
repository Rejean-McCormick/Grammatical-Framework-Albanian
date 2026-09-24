concrete IrregSqi of IrregSqiAbs = CatSqi **
  open ParadigmsSqi, (P = ParamX) in {
oper
  personTable : (p1sg,p2sg,p3sg,p1pl,p2pl,p3pl : Str) -> P.Number => P.Person => Str =
    \p1sg,p2sg,p3sg,p1pl,p2pl,p3pl -> table {
      P.Sg => table {P.P1=>p1sg ; P.P2=>p2sg ; P.P3=>p3sg} ;
      P.Pl => table {P.P1=>p1pl ; P.P2=>p2pl ; P.P3=>p3pl}
    } ;

  numberTable : (sg,pl : Str) -> P.Number => Str =
    \sg,pl -> table {P.Sg=>sg ; P.Pl=>pl} ;

lin
  bej_V  = irregV "bëj"  "bën"  "bën"   "bëjmë"  "bëni"  "bëjnë"  "bëj"  "bëni"  "bërë" ;

  -- Standard mediopassive 'bëhem': exact ordinary and marked finite forms,
  -- including jam-based perfect morphology.
  behem_V = irregVFull
    (personTable "bëhem" "bëhesh" "bëhet" "bëhemi" "bëheni" "bëhen")
    (personTable "jam bërë" "je bërë" "është bërë" "jemi bërë" "jeni bërë" "janë bërë")
    (personTable "u bëra" "u bëre" "u bë" "u bëmë" "u bëtë" "u bënë")
    (personTable "bëhesha" "bëheshe" "bëhej" "bëheshim" "bëheshit" "bëheshin")
    (personTable "bëhem" "bëhesh" "bëhet" "bëhemi" "bëheni" "bëhen")
    (personTable "u bëfsha" "u bëfsh" "u bëftë" "u bëfshim" "u bëfshi" "u bëfshin")
    (personTable "qofsha bërë" "qofsh bërë" "qoftë bërë" "qofshim bërë" "qofshit bërë" "qofshin bërë")
    (personTable "u bëkam" "u bëke" "u bëka" "u bëkemi" "u bëkeni" "u bëkan")
    (personTable "u bëkësha" "u bëkëshe" "u bëkësh" "u bëkëshim" "u bëkëshit" "u bëkëshin")
    (numberTable "bëhu" "bëhuni")
    "bërë" ;

  -- 'blej' is not the productive -ej class: it has blini, blerë and
  -- stem alternations in the imperfect/marked paradigms.
  blej_V = irregVFull
    (personTable "blej" "blen" "blen" "blejmë" "blini" "blejnë")
    (personTable "kam blerë" "ke blerë" "ka blerë" "kemi blerë" "keni blerë" "kanë blerë")
    (personTable "bleva" "bleve" "bleu" "blemë" "bletë" "blenë")
    (personTable "blija" "blije" "blinte" "blinim" "blinit" "blinin")
    (personTable "blej" "blesh" "blejë" "blejmë" "blini" "blejnë")
    (personTable "blefsha" "blefsh" "bleftë" "blefshim" "blefshi" "blefshin")
    (personTable "paça blerë" "paç blerë" "pastë blerë" "paçim blerë" "paçit blerë" "paçin blerë")
    (personTable "blekam" "bleke" "bleka" "blekemi" "blekeni" "blekan")
    (personTable "blekësha" "blekëshe" "blekësh" "blekëshim" "blekëshit" "blekëshin")
    (numberTable "bli" "blini")
    "blerë" ;
  bie_V  = irregV "bie"  "bie"  "bie"   "biem"  "bini"  "bien"   "bjer" "bini"  "rënë" ;
  dal_V  = irregV "dal"  "del"  "del"   "dalim"  "dilni" "dalin"  "dil"  "dilni" "dalë" ;
  dua_V = irregVFull
    (personTable "dua" "do" "do" "duam" "doni" "duan")
    (personTable "kam dashur" "ke dashur" "ka dashur" "kemi dashur" "keni dashur" "kanë dashur")
    (personTable "desha" "deshe" "deshi" "deshëm" "deshët" "deshën")
    (personTable "doja" "doje" "donte" "donim" "donit" "donin")
    (personTable "dua" "duash" "dojë" "duam" "doni" "duan")
    (personTable "daça" "daç" "dashtë" "daçim" "daçi" "daçin")
    (personTable "paça dashur" "paç dashur" "pastë dashur" "paçim dashur" "paçit dashur" "paçin dashur")
    (personTable "dashkam" "dashke" "dashka" "dashkemi" "dashkeni" "dashkan")
    (personTable "dashkësha" "dashkëshe" "dashkësh" "dashkëshim" "dashkëshit" "dashkëshin")
    (numberTable "duaj" "doni")
    "dashur" ;
  eci_V  = irregV "eci"  "ecën" "ecën"  "ecim"   "ecni"  "ecin"   "ec"   "ecni"  "ecur" ;
  ha_V = irregVFull
    (personTable "ha" "ha" "ha" "hamë" "hani" "hanë")
    (personTable "kam ngrënë" "ke ngrënë" "ka ngrënë" "kemi ngrënë" "keni ngrënë" "kanë ngrënë")
    (personTable "hëngra" "hëngre" "hëngri" "hëngrëm" "hëngrët" "hëngrën")
    (personTable "haja" "haje" "hante" "hanim" "hanit" "hanin")
    (personTable "ha" "hash" "hajë" "hamë" "hani" "hanë")
    (personTable "ngrënça" "ngrënç" "ngrëntë" "ngrënçim" "ngrënçi" "ngrënçin")
    (personTable "paça ngrënë" "paç ngrënë" "pastë ngrënë" "paçim ngrënë" "paçit ngrënë" "paçin ngrënë")
    (personTable "ngrënkam" "ngrënke" "ngrënka" "ngrënkemi" "ngrënkeni" "ngrënkan")
    (personTable "ngrënkësha" "ngrënkëshe" "ngrënkësh" "ngrënkëshim" "ngrënkëshit" "ngrënkëshin")
    (numberTable "ha" "hani")
    "ngrënë" ;
  gjej_V = irregVFull
    (personTable "gjej" "gjen" "gjen" "gjejmë" "gjeni" "gjejnë")
    (personTable "kam gjetur" "ke gjetur" "ka gjetur" "kemi gjetur" "keni gjetur" "kanë gjetur")
    (personTable "gjeta" "gjete" "gjeti" "gjetëm" "gjetët" "gjetën")
    (personTable "gjeja" "gjeje" "gjente" "gjenim" "gjenit" "gjenin")
    (personTable "gjej" "gjesh" "gjejë" "gjejmë" "gjeni" "gjejnë")
    (personTable "gjetsha" "gjetsh" "gjettë" "gjetshim" "gjetshit" "gjetshin")
    (personTable "paça gjetur" "paç gjetur" "pastë gjetur" "paçim gjetur" "paçit gjetur" "paçin gjetur")
    (personTable "gjetkam" "gjetke" "gjetka" "gjetkemi" "gjetkeni" "gjetkan")
    (personTable "gjetkësha" "gjetkëshe" "gjetkësh" "gjetkëshim" "gjetkëshit" "gjetkëshin")
    (numberTable "gjej" "gjeni")
    "gjetur" ;
  hyj_V  = irregV "hyj"  "hyn"  "hyn"   "hyjmë"  "hyni"  "hyjnë"  "hyr"  "hyni"  "hyrë" ;
  iki_V  = irregV "iki"  "ikën" "ikën"  "ikim"   "ikni"  "ikin"   "ik"   "ikni"  "ikur" ;
  jam_V = irregVFull
    (personTable "jam" "je" "është" "jemi" "jeni" "janë")
    (personTable "kam qenë" "ke qenë" "ka qenë" "kemi qenë" "keni qenë" "kanë qenë")
    (personTable "qeshë" "qe" "qe" "qemë" "qetë" "qenë")
    (personTable "isha" "ishe" "ishte" "ishim" "ishit" "ishin")
    (personTable "jem" "jesh" "jetë" "jemi" "jeni" "jenë")
    (personTable "qofsha" "qofsh" "qoftë" "qofshim" "qofshit" "qofshin")
    (personTable "paça qenë" "paç qenë" "pastë qenë" "paçim qenë" "paçit qenë" "paçin qenë")
    (personTable "qenkam" "qenke" "qenka" "qenkemi" "qenkeni" "qenkan")
    (personTable "qenkësha" "qenkëshe" "qenkësh" "qenkëshim" "qenkëshit" "qenkëshin")
    (numberTable "ji" "jini")
    "qenë" ;
  jap_V = irregVFull
    (personTable "jap" "jep" "jep" "japim" "jepni" "japin")
    (personTable "kam dhënë" "ke dhënë" "ka dhënë" "kemi dhënë" "keni dhënë" "kanë dhënë")
    (personTable "dhashë" "dhe" "dha" "dhamë" "dhatë" "dhanë")
    (personTable "jepja" "jepje" "jepte" "jepnim" "jepnit" "jepnin")
    (personTable "jap" "japësh" "japë" "japim" "jepni" "japin")
    (personTable "dhënça" "dhënç" "dhëntë" "dhënçim" "dhënçi" "dhënçin")
    (personTable "paça dhënë" "paç dhënë" "pastë dhënë" "paçim dhënë" "paçit dhënë" "paçin dhënë")
    (personTable "dhënkam" "dhënke" "dhënka" "dhënkemi" "dhënkeni" "dhënkan")
    (personTable "dhënkësha" "dhënkëshe" "dhënkësh" "dhënkëshim" "dhënkëshit" "dhënkëshin")
    (numberTable "jep" "jepni")
    "dhënë" ;
  kam_V = irregVFull
    (personTable "kam" "ke" "ka" "kemi" "keni" "kanë")
    (personTable "kam pasur" "ke pasur" "ka pasur" "kemi pasur" "keni pasur" "kanë pasur")
    (personTable "pata" "pate" "pati" "patëm" "patët" "patën")
    (personTable "kisha" "kishe" "kishte" "kishim" "kishit" "kishin")
    (personTable "kem" "kesh" "ketë" "kemi" "keni" "kenë")
    (personTable "paça" "paç" "pastë" "paçim" "paçit" "paçin")
    (personTable "paça pasur" "paç pasur" "pastë pasur" "paçim pasur" "paçit pasur" "paçin pasur")
    (personTable "paskam" "paske" "paska" "paskemi" "paskeni" "paskan")
    (personTable "paskësha" "paskëshe" "paskësh" "paskëshim" "paskëshit" "paskëshin")
    (numberTable "ki" "kini")
    "pasur" ;
  ngre_V = irregV "ngre" "ngre" "ngre"  "ngremë" "ngrini" "ngrenë" "ngre" "ngrini" "ngritur" ;
  njoh_V = irregV "njoh" "njeh" "njeh"  "njohim" "njihni" "njohin" "njih" "njihni" "njohur" ;
  pi_V   = irregV "pi"   "pi"   "pi"    "pimë"   "pini"  "pinë"   "pi"   "pini"  "pirë" ;
  shoh_V = irregVFull
    (personTable "shoh" "sheh" "sheh" "shohim" "shihni" "shohin")
    (personTable "kam parë" "ke parë" "ka parë" "kemi parë" "keni parë" "kanë parë")
    (personTable "pashë" "pe" "pa" "pamë" "patë" "panë")
    (personTable "shihja" "shihje" "shihte" "shihnim" "shihnit" "shihnin")
    (personTable "shoh" "shohësh" "shohë" "shohim" "shihni" "shohin")
    (personTable "pafsha" "pafsh" "paftë" "pafshim" "pafshit" "pafshin")
    (personTable "paça parë" "paç parë" "pastë parë" "paçim parë" "paçit parë" "paçin parë")
    (personTable "pakam" "pake" "paka" "pakemi" "pakeni" "pakan")
    (personTable "pakësha" "pakëshe" "pakësh" "pakëshim" "pakëshit" "pakëshin")
    (numberTable "shih" "shihni")
    "parë" ;
  them_V = irregVFull
    (personTable "them" "thua" "thotë" "themi" "thoni" "thonë")
    (personTable "kam thënë" "ke thënë" "ka thënë" "kemi thënë" "keni thënë" "kanë thënë")
    (personTable "thashë" "the" "tha" "thamë" "thatë" "thanë")
    (personTable "thosha" "thoshe" "thoshte" "thoshim" "thoshit" "thoshin")
    (personTable "them" "thuash" "thotë" "themi" "thoni" "thonë")
    (personTable "thënça" "thënç" "thëntë" "thënçim" "thënçi" "thënçin")
    (personTable "paça thënë" "paç thënë" "pastë thënë" "paçim thënë" "paçit thënë" "paçin thënë")
    (personTable "thënkam" "thënke" "thënka" "thënkemi" "thënkeni" "thënkan")
    (personTable "thënkësha" "thënkëshe" "thënkësh" "thënkëshim" "thënkëshit" "thënkëshin")
    (numberTable "thuaj" "thoni")
    "thënë" ;
  urrej_V = irregV "urrej" "urren" "urren" "urrejmë" "urreni" "urrejnë" "urre" "urreni" "urryer" ;
  ve_V   = irregV "vë"   "vë"   "vë"    "vëmë"   "vini"  "vënë"   "vër"  "vini"  "vënë" ;
  vij_V = irregVFull
    (personTable "vij" "vjen" "vjen" "vijmë" "vini" "vijnë")
    (personTable "kam ardhur" "ke ardhur" "ka ardhur" "kemi ardhur" "keni ardhur" "kanë ardhur")
    (personTable "erdha" "erdhe" "erdhi" "erdhëm" "erdhët" "erdhën")
    (personTable "vija" "vije" "vinte" "vinim" "vinit" "vinin")
    (personTable "vij" "vish" "vijë" "vijmë" "vini" "vijnë")
    (personTable "ardhsha" "ardhsh" "ardhtë" "ardhshim" "ardhshi" "ardhshin")
    (personTable "paça ardhur" "paç ardhur" "pastë ardhur" "paçim ardhur" "paçit ardhur" "paçin ardhur")
    (personTable "ardhkam" "ardhke" "ardhka" "ardhkemi" "ardhkeni" "ardhkan")
    (personTable "ardhkësha" "ardhkëshe" "ardhkësh" "ardhkëshim" "ardhkëshit" "ardhkëshin")
    (numberTable "eja" "ejani")
    "ardhur" ;
}
