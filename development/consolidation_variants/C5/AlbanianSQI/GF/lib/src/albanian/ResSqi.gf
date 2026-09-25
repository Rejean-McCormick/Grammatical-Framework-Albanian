resource ResSqi = ParamX-[Tense,Past,Pres] ** open Prelude in {

param
  ComplKind = OrdinaryCompl | GenitiveCompl ;

oper
  Compl : Type = {s : Str ; c : Case ; kind : ComplKind} ;

  mkCompl : Str -> Case -> Compl = \s,c -> {s = s ; c = c ; kind = OrdinaryCompl} ;
  mkGenitiveCompl : Compl = {s = [] ; c = Gen ; kind = GenitiveCompl} ;

  -- In CatSqi: Prep = Compl.  Government is therefore carried all the
  -- way to the final nominal-realization boundary instead of being
  -- flattened into a preposition string.
  Prep : Type = Compl ;
  mkPrep : Str -> Case -> Prep = mkCompl ;
  noPrep : Prep = mkPrep [] Acc ;


param
  Species = Indef | Def ;

  -- Five syntax cases are kept distinct.  Genitive and dative are
  -- morphologically syncretic in the core nominal paradigms, but Gen remains
  -- visible to syntax so nyje selection and government are never guessed from
  -- a surface form.
  Case = Nom | Acc | Gen | Dat | Ablat ;
  MorphCase = MNom | MAcc | MDat | MAblat ;
  Gender = Masc | Fem ;

param
  GenNum = GSg Gender | GPl Gender ;
  WeakClitic = NoWeak | Weak Number Person ;

oper
  Agr : Type = {gn : GenNum ; p : Person} ;

  genNum : Gender -> Number -> GenNum = \g,n ->
    case n of {
      Sg => GSg g ;
      Pl => GPl g
    } ;

  agrgP3 : Gender -> Number -> Agr =
    \g,n -> {gn = genNum g n ; p = P3} ;

  morphCase : Case -> MorphCase = \c -> case c of {
    Nom => MNom ;
    Acc => MAcc ;
    Gen => MDat ;
    Dat => MDat ;
    Ablat => MAblat
  } ;


param
  DetPlacement = PreNominal | PostNominal ;

oper
  Noun : Type = {s : Species => MorphCase => Number => Str ; g : Gender} ;

  mkNoun : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Gender -> Noun =
    \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,g ->
      { s = table {
              Indef => table {
                         MNom => table {Sg => f1 ;  Pl => f2} ;
                         MAcc => table {Sg => f3 ;  Pl => f4} ;
                         MDat => table {Sg => f5 ;  Pl => f6} ;
                         MAblat => table {Sg => f7 ; Pl => f8}
                       } ;
              Def => table {
                       MNom => table {Sg => f9 ;  Pl => f10} ;
                       MAcc => table {Sg => f11 ; Pl => f12} ;
                       MDat => table {Sg => f13 ; Pl => f14} ;
                       MAblat => table {Sg => f15 ; Pl => f16}
                     }
            } ;
        g = g
      } ;


oper
  Adj : Type = {s : MorphCase => Gender => Number => Str ; clit : Bool} ;

  mkAdj : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Bool -> Adj =
    \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,clit ->
      { s = table {
              MNom => table {
                       Masc => table {Sg => f1 ;  Pl => f2} ;
                       Fem  => table {Sg => f3 ;  Pl => f4}
                     } ;
              MAcc => table {
                       Masc => table {Sg => f5 ;  Pl => f6} ;
                       Fem  => table {Sg => f7 ;  Pl => f8}
                     } ;
              MDat => table {
                       Masc => table {Sg => f9 ;  Pl => f10} ;
                       Fem  => table {Sg => f11 ; Pl => f12}
                     } ;
              MAblat => table {
                         Masc => table {Sg => f13 ; Pl => f14} ;
                         Fem  => table {Sg => f15 ; Pl => f16}
                       }
            } ;
        clit = clit
      } ;

  nounForm : Noun -> Species -> Case -> Number -> Str = \n,sp,c,num ->
    n.s ! sp ! morphCase c ! num ;

  adjForm : Adj -> Case -> Gender -> Number -> Str = \a,c,g,num ->
    a.s ! morphCase c ! g ! num ;


param
  Tense = Pres | Past | Imperfect | Aorist ;

oper
  -- Shared verb-phrase representation.  CatSqi aliases VP/VPSlash to these
  -- resource types so clause helpers preserve category shape instead of
  -- coercing locked concrete-category records through an ad-hoc structural type.
  -- Weak objects stay typed until the final clause-realization boundary.
  -- `preClitic` carries genuine preverbal non-clitic material (for example
  -- SelfAdVVP); `progressive` carries po separately.  Neither field may be
  -- used to encode a pronominal clitic.
  WeakArg : Type = WeakClitic ;
  CliticCluster : Type = {dat, acc : WeakArg ; refl : Bool} ;

  VP : Type = {
    indicative : Tense => Number => Person => Str ;
    subjunctive : Number => Person => Str ;
    imperative : Number => Str ;
    participle : Str ;
    pres_optative : Number => Person => Str ;
    perf_optative : Number => Person => Str ;
    pres_admirative : Number => Person => Str ;
    imperf_admirative : Number => Person => Str ;
    clitics : CliticCluster ;
    progressive : Bool ;
    preClitic : Str ;
    post : Agr => Str
  } ;

  VPSlash : Type = VP ** {c2 : Compl} ;

oper
  Verb : Type = {
    Indicative       : Tense => Number => Person => Str ;
    Subjunctive      : Number => Person => Str ;
    Imperative       : Number => Str ;
    participle       : Str ;
    pres_optative    : Number => Person => Str ;
    perf_optative    : Number => Person => Str ;
    pres_admirative  : Number => Person => Str ;
    imperf_admirative: Number => Person => Str
  } ;

  -- Build the Standard-Albanian finite subjunctive once at the
  -- morphology boundary.  Syntax must select this table directly and
  -- must not infer mood later by inspecting an indicative surface string.
  -- This preserves the previous productive/irregular rules while moving
  -- their evaluation out of PMCFG-facing VP consumers.
  subjunctiveFromPresent :
    (Number => Person => Str) -> Number => Person => Str = \pres ->
      let p1 : Str = pres ! Sg ! P1 ;
          p2 : Str = pres ! Sg ! P2
      in table {
        Sg => table {
          P1 => p1 ;
          P2 => case <p1 : Str> of {
            "jam" => "jesh" ;
            "kam" => "kesh" ;
            "dua" => "duash" ;
            "di"  => "dish" ;
            "ha"  => "hash" ;
            "pi"  => "pish" ;
            "vij" => "vish" ;
            "them" => "thuash" ;
            _ + "j" => init p1 ++ "sh" ;
            _ => case <p2 : Str> of {
              stem + "n" => stem ++ "sh" ;
              x => x
            }
          } ;
          P3 => case <p1 : Str> of {
            "jam" => "jetë" ;
            "kam" => "ketë" ;
            "dua" => "dojë" ;
            "di"  => "dijë" ;
            "ha"  => "hajë" ;
            "pi"  => "pijë" ;
            "vij" => "vijë" ;
            "them" => "thotë" ;
            _ + "j" => p1 + "ë" ;
            _ => case <p2 : Str> of {
              stem + "n" => stem ++ "ë" ;
              x => x
            }
          }
        } ;
        Pl => table {
          P1 => pres ! Pl ! P1 ;
          P2 => pres ! Pl ! P2 ;
          P3 => pres ! Pl ! P3
        }
      } ;

  mkVerb :
    (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Verb =
    \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23,f24,f25,f26,f27,
     f28,f29,f30,f31,f32,f33,f34,f35,f36,f37,f38,f39,f40,f41,f42,f43,f44,f45,f46,f47,f48,f49,f50,f51 ->
      { Indicative = table {
            Pres => table {
                     Sg => table {P1 => f1 ;  P2 => f2 ;  P3 => f3} ;
                     Pl => table {P1 => f4 ;  P2 => f5 ;  P3 => f6}
                   } ;
            Past => table {
                     Sg => table {P1 => f7 ;  P2 => f8 ;  P3 => f9} ;
                     Pl => table {P1 => f10 ; P2 => f11 ; P3 => f12}
                   } ;
            Aorist => table {
                       Sg => table {P1 => f13 ; P2 => f14 ; P3 => f15} ;
                       Pl => table {P1 => f16 ; P2 => f17 ; P3 => f18}
                     } ;
            Imperfect => table {
                          Sg => table {P1 => f19 ; P2 => f20 ; P3 => f21} ;
                          Pl => table {P1 => f22 ; P2 => f23 ; P3 => f24}
                        }
          } ;
        Subjunctive = subjunctiveFromPresent (table {
          Sg => table {P1 => f1 ; P2 => f2 ; P3 => f3} ;
          Pl => table {P1 => f4 ; P2 => f5 ; P3 => f6}
        }) ;
        Imperative = table {Sg => f25 ; Pl => f26} ;
        participle = f27 ;
        pres_optative = table {
                          Sg => table {P1 => f28 ; P2 => f29 ; P3 => f30} ;
                          Pl => table {P1 => f31 ; P2 => f32 ; P3 => f33}
                        } ;
        perf_optative = table {
                          Sg => table {P1 => f34 ; P2 => f35 ; P3 => f36} ;
                          Pl => table {P1 => f37 ; P2 => f38 ; P3 => f39}
                        } ;
        pres_admirative = table {
                             Sg => table {P1 => f40 ; P2 => f41 ; P3 => f42} ;
                             Pl => table {P1 => f43 ; P2 => f44 ; P3 => f45}
                           } ;
        imperf_admirative = table {
                               Sg => table {P1 => f46 ; P2 => f47 ; P3 => f48} ;
                               Pl => table {P1 => f49 ; P2 => f50 ; P3 => f51}
                             }
      } ;


oper
  -- Pronouns/NPS retain strong case forms and agreement.  Weak object forms
  -- are derived from agreement at the syntax boundary; there is no second
  -- string-valued clitic authority on the nominal record.
  Pron : Type = {s : Case => Str ; a : Agr ; isPron : Bool} ;

  mkPron : (_,_,_,_ : Str) -> GenNum -> Person -> Pron =
    \nom,acc,gendat,ablat,gn,p ->
      { s = table {
          Nom => nom ; Acc => acc ; Gen => gendat ; Dat => gendat ; Ablat => ablat
        } ;
        a = {gn = gn ; p = p} ;
        isPron = True
      } ;


oper
  emptyClitics : CliticCluster = {dat=NoWeak ; acc=NoWeak ; refl=False} ;

  weakFromAgr : Agr -> WeakArg = \a -> Weak (agrNumber a) a.p ;

  putAccClitic : CliticCluster -> Agr -> CliticCluster = \cc,a ->
    case cc.acc of {
      NoWeak => cc ** {acc=weakFromAgr a} ;
      _ => Predef.error "Albanian clitic cluster already has an accusative slot"
    } ;

  putDatClitic : CliticCluster -> Agr -> CliticCluster = \cc,a ->
    case cc.dat of {
      NoWeak => cc ** {dat=weakFromAgr a} ;
      _ => Predef.error "Albanian clitic cluster already has a dative slot"
    } ;

  putReflClitic : CliticCluster -> CliticCluster = \cc ->
    case cc.refl of {
      False => cc ** {refl=True} ;
      True => Predef.error "Albanian clitic cluster already has a reflexive slot"
    } ;

  weakAcc : WeakArg -> Str = \w -> case w of {
    NoWeak => [] ;
    Weak Sg P1 => "më" ;
    Weak Sg P2 => "të" ;
    Weak Sg P3 => "e" ;
    Weak Pl P1 => "na" ;
    Weak Pl P2 => "ju" ;
    Weak Pl P3 => "i"
  } ;

  weakDat : WeakArg -> Str = \w -> case w of {
    NoWeak => [] ;
    Weak Sg P1 => "më" ;
    Weak Sg P2 => "të" ;
    Weak Sg P3 => "i" ;
    Weak Pl P1 => "na" ;
    Weak Pl P2 => "ju" ;
    Weak Pl P3 => "u"
  } ;

  datAccSg : WeakArg -> Str = \d -> case d of {
    Weak Sg P1 => "ma" ;
    Weak Sg P2 => "ta" ;
    Weak Sg P3 => "ia" ;
    Weak Pl P1 => "na" ++ "e" ;
    Weak Pl P2 => "jua" ;
    Weak Pl P3 => "ua" ;
    NoWeak => "e"
  } ;

  datAccPl : WeakArg -> Str = \d -> case d of {
    Weak Sg P1 => "m'i" ;
    Weak Sg P2 => "t'i" ;
    Weak Sg P3 => "ia" ;
    Weak Pl P1 => "na" ++ "i" ;
    Weak Pl P2 => "jua" ;
    Weak Pl P3 => "ua" ;
    NoWeak => "i"
  } ;

  datRefl : WeakArg -> Str = \d -> case d of {
    Weak Sg P1 => "m'u" ;
    Weak Sg P2 => "t'u" ;
    Weak Sg P3 => "iu" ;
    Weak Pl P1 => "na" ++ "u" ;
    Weak Pl P2 => "ju" ;
    Weak Pl P3 => "ju" ;
    NoWeak => "u"
  } ;

  -- This is the sole owner of Dat+Acc/Refl ordering and fusion.  The supplied
  -- Albanian reference explicitly gives the 6 x {e,i,u} matrix; other
  -- Dat+Acc person combinations are rejected rather than guessed.
  flattenClitics : CliticCluster -> Str = \cc ->
    case <cc.dat,cc.acc,cc.refl> of {
      <NoWeak,NoWeak,False> => [] ;
      <NoWeak,a,False> => weakAcc a ;
      <d,NoWeak,False> => weakDat d ;
      <NoWeak,NoWeak,True> => "u" ;
      <d,NoWeak,True> => datRefl d ;
      <d,Weak Sg P3,False> => datAccSg d ;
      <d,Weak Pl P3,False> => datAccPl d ;
      <NoWeak,a,True> => Predef.error "Albanian Acc+Refl cluster not licensed by the locked C5 evidence" ;
      <d,a,False> => Predef.error "Albanian Dat+Acc cluster outside the locked 18-cell paradigm" ;
      <d,a,True> => Predef.error "Albanian three-slot Dat+Acc+Refl cluster not licensed by the locked C5 evidence"
    } ;

  -- të contracts only after the cluster has been flattened.  e gives ta;
  -- vowel-/j-initial licensed clusters lose the vowel of të.
  teWithClitics : CliticCluster -> Str = \cc ->
    case <flattenClitics cc : Str> of {
      "" => "të" ;
      "e" => "ta" ;
      "i" => "t'i" ;
      "u" => "t'u" ;
      "ia" => "t'ia" ;
      "iu" => "t'iu" ;
      "jua" => "t'jua" ;
      "ju" => "t'ju" ;
      "ua" => "t'ua" ;
      x => "të" ++ x
    } ;


oper
  Quant : Type = {s : Case => Gender => Number => Str ; spec : Species ; placement : DetPlacement} ;

  mkQuant : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Quant =
    \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16 -> {
      s = table {
            Nom => table {
                     Masc => table {Sg => f1 ;  Pl => f2} ;
                     Fem  => table {Sg => f3 ;  Pl => f4}
                   } ;
            Acc => table {
                     Masc => table {Sg => f5 ;  Pl => f6} ;
                     Fem  => table {Sg => f7 ;  Pl => f8}
                   } ;
            Gen => table {
                     Masc => table {Sg => f9 ;  Pl => f10} ;
                     Fem  => table {Sg => f11 ; Pl => f12}
                   } ;
            Dat => table {
                     Masc => table {Sg => f9 ;  Pl => f10} ;
                     Fem  => table {Sg => f11 ; Pl => f12}
                   } ;
            Ablat => table {
                      Masc => table {Sg => f13 ; Pl => f14} ;
                      Fem  => table {Sg => f15 ; Pl => f16}
                    }
          } ;
      spec = Indef ;
      placement = PreNominal
    } ;


oper
  Det : Type = {s : Case => Gender => Str ; n : Number ; spec : Species ; placement : DetPlacement} ;

  mkDet : (Number -> Species -> Case -> Gender -> Str) -> Det = \f -> {
    s = \\c,g => f Sg Indef c g ;
    n = Sg ;
    spec = Indef ;
    placement = PreNominal
  } ;

  mkNum : Str -> Number -> {s : Str ; n : Number} = \s,n -> {s=s ; n=n} ;


oper
  -- Single Albanian nyje service.  The same table licenses articulated
  -- adjectives and the linking particle before a genitive modifier.  The
  -- surface is selected from the grammatical properties of the modified
  -- nominal, exactly as described by the supplied Albanian reference.
  nyje : Species => Case => Gender => Number => Str =
    table {
      Indef => table {
        Nom => table {
          Masc => table {Sg => "i" ; Pl => "të"} ;
          Fem  => table {Sg => "e" ; Pl => "të"}
        } ;
        Acc => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "të" ; Pl => "të"}
        } ;
        Gen => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "së" ; Pl => "të"}
        } ;
        Dat => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "së" ; Pl => "të"}
        } ;
        Ablat => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "së" ; Pl => "të"}
        }
      } ;
      Def => table {
        Nom => table {
          Masc => table {Sg => "i" ; Pl => "e"} ;
          Fem  => table {Sg => "e" ; Pl => "e"}
        } ;
        Acc => table {
          Masc => table {Sg => "e" ; Pl => "e"} ;
          Fem  => table {Sg => "e" ; Pl => "e"}
        } ;
        Gen => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "së" ; Pl => "të"}
        } ;
        Dat => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "së" ; Pl => "të"}
        } ;
        Ablat => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "së" ; Pl => "të"}
        }
      }
    } ;

  -- Compatibility name for existing adjective consumers.  It is an alias,
  -- not a second source of truth, and can be removed when the nominal/adj
  -- workstream renames its callers.
  link_clitic : Species => Case => Gender => Number => Str = nyje ;


oper
  agrNumber : Agr -> Number = \a -> case a.gn of {
    GSg _ => Sg ;
    GPl _ => Pl
  } ;

  agrGender : Agr -> Gender = \a -> case a.gn of {
    GSg g => g ;
    GPl g => g
  } ;

  -- Public RGL tense and Albanian morphological tense are deliberately
  -- distinct parameter spaces.  Keep the conversion centralized here;
  -- never use a ParamX constructor as a key of Verb.Indicative.
  sqiTense : ParamX.Tense -> Tense = \t -> case t of {
    ParamX.Pres => Pres ;
    ParamX.Past => Aorist ;
    ParamX.Fut  => Pres ;
    ParamX.Cond => Imperfect
  } ;

  negation : Polarity -> Str = \p -> case p of {
    Pos => [] ;
    Neg => "nuk"
  } ;

  futureParticle : ParamX.Tense -> Str = \t -> case t of {
    ParamX.Fut  => "do" ++ "të" ;
    ParamX.Cond => "do" ++ "të" ;
    _           => []
  } ;

  haveAux : ParamX.Tense => Number => Person => Str = table {
    ParamX.Pres => table {
      Sg => table {P1 => "kam" ; P2 => "ke" ; P3 => "ka"} ;
      Pl => table {P1 => "kemi" ; P2 => "keni" ; P3 => "kanë"}
    } ;
    ParamX.Past => table {
      Sg => table {P1 => "kisha" ; P2 => "kishe" ; P3 => "kishte"} ;
      Pl => table {P1 => "kishim" ; P2 => "kishit" ; P3 => "kishin"}
    } ;
    ParamX.Fut => table {
      Sg => table {P1 => "do të kem" ; P2 => "do të kesh" ; P3 => "do të ketë"} ;
      Pl => table {P1 => "do të kemi" ; P2 => "do të keni" ; P3 => "do të kenë"}
    } ;
    ParamX.Cond => table {
      Sg => table {P1 => "do të kisha" ; P2 => "do të kishe" ; P3 => "do të kishte"} ;
      Pl => table {P1 => "do të kishim" ; P2 => "do të kishit" ; P3 => "do të kishin"}
    }
  } ;

  -- Compatibility selector for callers that still need an Agr-shaped API.
  -- No morphology is reconstructed here: the dedicated table is authoritative.
  subjunctiveFinite : Verb -> Agr -> Str = \v,a ->
    v.Subjunctive ! agrNumber a ! a.p ;

  haveSubj : Number => Person => Str = table {
    Sg => table {P1 => "kem" ; P2 => "kesh" ; P3 => "ketë"} ;
    Pl => table {P1 => "kemi" ; P2 => "keni" ; P3 => "kenë"}
  } ;

  cliticFor : Case -> {s : Case => Str ; a : Agr ; isPron : Bool} -> WeakArg =
    \c,np -> case c of {
      Acc => weakFromAgr np.a ;
      Dat => weakFromAgr np.a ;
      _   => NoWeak
    } ;

  accCliticAgr : Agr -> Str = \a -> weakAcc (weakFromAgr a) ;
  datCliticAgr : Agr -> Str = \a -> weakDat (weakFromAgr a) ;

}