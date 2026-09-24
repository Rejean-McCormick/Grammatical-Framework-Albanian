resource ResSqi = ParamX-[Tense,Past,Pres] ** open Prelude in {

oper
  Compl : Type = {s : Str ; c : Case} ;

  mkCompl : Str -> Case -> Compl = \s,c -> {s = s ; c = c} ;

  -- In CatSqi: Prep = Compl.  Government is therefore carried all the
  -- way to the final nominal-realization boundary instead of being
  -- flattened into a preposition string.
  Prep : Type = Compl ;
  mkPrep : Str -> Case -> Prep = mkCompl ;
  noPrep : Prep = mkPrep [] Acc ;


param
  Species = Indef | Def ;
  Case = Nom | Acc | Gen | Dat | Ablat ;
  Gender = Masc | Fem ;

param
  GenNum = GSg Gender | GPl Gender ;

oper
  Agr : Type = {gn : GenNum ; p : Person} ;

  genNum : Gender -> Number -> GenNum = \g,n ->
    case n of {
      Sg => GSg g ;
      Pl => GPl g
    } ;

  agrgP3 : Gender -> Number -> Agr =
    \g,n -> {gn = genNum g n ; p = P3} ;


param
  DetPlacement = PreNominal | PostNominal ;

oper
  Noun : Type = {s : Species => Case => Number => Str ; g : Number => Gender} ;

  mkNoun : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Gender -> Noun =
    \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,g ->
      { s = table {
              Indef => table {
                         Nom => table {Sg => f1 ;  Pl => f2} ;
                         Acc => table {Sg => f3 ;  Pl => f4} ;
                         Gen => table {Sg => f5 ;  Pl => f6} ;
                         Dat => table {Sg => f5 ;  Pl => f6} ;
                         Ablat => table {Sg => f7 ; Pl => f8}
                       } ;
              Def => table {
                       Nom => table {Sg => f9 ;  Pl => f10} ;
                       Acc => table {Sg => f11 ; Pl => f12} ;
                       Gen => table {Sg => f13 ; Pl => f14} ;
                       Dat => table {Sg => f13 ; Pl => f14} ;
                       Ablat => table {Sg => f15 ; Pl => f16}
                     }
            } ;
        g = table {Sg => g ; Pl => g}
      } ;

  -- Draft-max escape hatch for ambigeneric nouns whose agreement gender
  -- differs between singular and plural.  Surface inflection remains owned
  -- by the supplied Noun table; only agreement gender is number-sensitive.
  setNounGender : Noun -> Gender -> Gender -> Noun = \n,gsg,gpl -> n ** {
    g = table {Sg => gsg ; Pl => gpl}
  } ;


oper
  Adj : Type = {s : Case => Gender => Number => Str ; clit : Bool} ;

  mkAdj : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Bool -> Adj =
    \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,clit ->
      { s = table {
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
        clit = clit
      } ;


param
  Tense = Pres | Past | Imperfect | Aorist ;
  Voice = ActiveVoice | NonActiveVoice ;
  VoiceUse = PlainVoice | PassiveVoice | ReflexiveVoice ;
  PerfectAux = AuxKam | AuxJam ;

oper
  -- Object clitics stay typed until the final clause-realization boundary.
  -- dat precedes acc in Albanian; refl is the non-active/reflexive u-slot.
  -- extra is a compatibility escape hatch for legacy clients and is never
  -- populated by the new role-specific constructors.
  CliticCluster : Type = {dat,acc,refl,extra : Str} ;

  emptyCliticCluster : CliticCluster = {dat=[] ; acc=[] ; refl=[] ; extra=[]} ;

  setDatClitic : CliticCluster -> Str -> CliticCluster = \c,x -> c ** {dat=x} ;
  setAccClitic : CliticCluster -> Str -> CliticCluster = \c,x -> c ** {acc=x} ;
  setReflClitic : CliticCluster -> Str -> CliticCluster = \c,x -> c ** {refl=x} ;
  appendLegacyClitic : CliticCluster -> Str -> CliticCluster = \c,x ->
    c ** {extra=c.extra ++ x} ;

  -- Albanian dative + accusative/reflexive weak-pronoun fusion.
  fuseWeakClitics : Str -> Str -> Str = \dat,acc -> case <dat,acc> of {
    <[],a> => a ;
    <d,[]> => d ;
    <"më","e"> => "ma" ; <"më","i"> => "m'i" ; <"më","u"> => "m'u" ;
    <"të","e"> => "ta" ; <"të","i"> => "t'i" ; <"të","u"> => "t'u" ;
    <"i","e">  => "ia" ; <"i","i">  => "ia" ; <"i","u">  => "iu" ;
    <"na","e"> => "na" ++ "e" ; <"na","i"> => "na" ++ "i" ; <"na","u"> => "na" ++ "u" ;
    <"ju","e"> => "jua" ; <"ju","i"> => "jua" ; <"ju","u"> => "ju" ;
    <"u","e">  => "ua" ; <"u","i">  => "ua" ; <"u","u">  => "ju" ;
    _ => dat ++ acc
  } ;

  clusterObject : CliticCluster -> Str = \c -> case c.acc of {
    [] => c.refl ;
    x  => x
  } ;

  flattenClitics : CliticCluster -> Str = \c ->
    fuseWeakClitics c.dat (clusterObject c) ++ c.extra ;

  -- të contracts only when it is immediately adjacent to the cluster.
  -- If another preverbal particle (e.g. po, mos) intervenes, callers emit
  -- të separately and use flattenClitics after that particle.
  teWithClitics : CliticCluster -> Str = \c -> case <flattenClitics c : Str> of {
    [] => "të" ;
    "e" => "ta" ;
    "i" => "t'i" ;
    "u" => "t'u" ;
    "ia" => "t'ia" ;
    "iu" => "t'iu" ;
    "ua" => "t'ua" ;
    "jua" => "t'jua" ;
    "ju" => "t'ju" ;
    x => "të" ++ x
  } ;

  -- Shared verb-phrase representation.  Clitics, preverbal particles,
  -- voice and perfect-auxiliary choice are all explicit state.
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
    preverb : Str ;
    voice : Voice ;
    voiceUse : VoiceUse ;
    perfAux : PerfectAux ;
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
    imperf_admirative: Number => Person => Str ;
    voice            : Voice ;
    voiceUse         : VoiceUse ;
    perfAux          : PerfectAux
  } ;

  -- These operations annotate paradigms; they do not invent the synthetic
  -- present/imperfect non-active morphology.  Exact non-active paradigms must
  -- supply those finite forms (e.g. through irregVFull) before being marked.
  markNonActiveVerb : Verb -> Verb = \v -> v ** {
    voice=NonActiveVoice ; voiceUse=PlainVoice ; perfAux=AuxJam
  } ;
  markPassiveVerb : Verb -> Verb = \v -> v ** {
    voice=NonActiveVoice ; voiceUse=PassiveVoice ; perfAux=AuxJam
  } ;
  markReflexiveVerb : Verb -> Verb = \v -> v ** {
    voice=NonActiveVoice ; voiceUse=ReflexiveVoice ; perfAux=AuxJam
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
                             } ;
        voice = ActiveVoice ;
        voiceUse = PlainVoice ;
        perfAux = AuxKam
      } ;


oper
  -- Match CatSqi lincat Pron
  Pron : Type = {s : Case => Str ; acc_clit, dat_clit : Str ; a : Agr ; isPron : Bool} ;

  mkPron : (_,_,_,_,_,_ : Str) -> GenNum -> Person -> Pron =
    \nom,acc,dat,ablat,accC,datC,gn,p ->
      { s = table {Nom => nom ; Acc => acc ; Gen => dat ; Dat => dat ; Ablat => ablat} ;
        acc_clit = accC ;
        dat_clit = datC ;
        a = {gn = gn ; p = p} ;
        isPron = True
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
  -- Albanian linking article for articulated adjectives.  The article varies
  -- with definiteness, case, gender and number; keep the full distinction here
  -- instead of letting downstream syntax guess from a surface string.
  link_clitic : Species => Case => Gender => Number => Str =
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
          Fem  => table {Sg => "të" ; Pl => "të"}
        } ;
        Dat => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "të" ; Pl => "të"}
        } ;
        Ablat => table {
          Masc => table {Sg => "të" ; Pl => "të"} ;
          Fem  => table {Sg => "të" ; Pl => "të"}
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

  beAux : ParamX.Tense => Number => Person => Str = table {
    ParamX.Pres => table {
      Sg => table {P1 => "jam" ; P2 => "je" ; P3 => "është"} ;
      Pl => table {P1 => "jemi" ; P2 => "jeni" ; P3 => "janë"}
    } ;
    ParamX.Past => table {
      Sg => table {P1 => "isha" ; P2 => "ishe" ; P3 => "ishte"} ;
      Pl => table {P1 => "ishim" ; P2 => "ishit" ; P3 => "ishin"}
    } ;
    ParamX.Fut => table {
      Sg => table {P1 => "do të jem" ; P2 => "do të jesh" ; P3 => "do të jetë"} ;
      Pl => table {P1 => "do të jemi" ; P2 => "do të jeni" ; P3 => "do të jenë"}
    } ;
    ParamX.Cond => table {
      Sg => table {P1 => "do të isha" ; P2 => "do të ishe" ; P3 => "do të ishte"} ;
      Pl => table {P1 => "do të ishim" ; P2 => "do të ishit" ; P3 => "do të ishin"}
    }
  } ;

  perfectAuxFinite : PerfectAux -> ParamX.Tense -> Number -> Person -> Str =
    \aux,t,n,p -> case aux of {
      AuxKam => haveAux ! t ! n ! p ;
      AuxJam => beAux ! t ! n ! p
    } ;

  -- Compatibility selector for callers that still need an Agr-shaped API.
  -- No morphology is reconstructed here: the dedicated table is authoritative.
  subjunctiveFinite : Verb -> Agr -> Str = \v,a ->
    v.Subjunctive ! agrNumber a ! a.p ;

  haveSubj : Number => Person => Str = table {
    Sg => table {P1 => "kem" ; P2 => "kesh" ; P3 => "ketë"} ;
    Pl => table {P1 => "kemi" ; P2 => "keni" ; P3 => "kenë"}
  } ;

  beSubj : Number => Person => Str = table {
    Sg => table {P1 => "jem" ; P2 => "jesh" ; P3 => "jetë"} ;
    Pl => table {P1 => "jemi" ; P2 => "jeni" ; P3 => "jenë"}
  } ;

  perfectAuxSubj : PerfectAux -> Number -> Person -> Str = \aux,n,p ->
    case aux of {
      AuxKam => haveSubj ! n ! p ;
      AuxJam => beSubj ! n ! p
    } ;

  -- Non-active aorist uses preverbal u.  Present/imperfect non-active forms
  -- are synthetic and therefore belong in the verb paradigm itself.
  addVoiceClitic : Voice -> Tense -> CliticCluster -> CliticCluster = \v,t,c ->
    case <v,t> of {
      <NonActiveVoice,Aorist> => case c.acc of {
        [] => c ** {refl="u"} ;
        _  => c ** {extra=c.extra ++ "u"}
      } ;
      _ => c
    } ;

  cliticFor : Case -> {s : Case => Str ; acc_clit, dat_clit : Str ; a : Agr ; isPron : Bool} -> Str =
    \c,np -> case c of {
      Acc => np.acc_clit ;
      Dat => np.dat_clit ;
      _   => []
    } ;

  -- Weak object clitics determined from agreement.  These tables are used
  -- where a slash phrase must preserve the clitic slot until its object is
  -- supplied (notably VPS2/VPI2 shared-object coordination).
  accCliticAgr : Agr -> Str = \a -> case <agrNumber a,a.p> of {
    <Sg,P1> => "më" ;
    <Sg,P2> => "të" ;
    <Sg,P3> => "e" ;
    <Pl,P1> => "na" ;
    <Pl,P2> => "ju" ;
    <Pl,P3> => "i"
  } ;

  datCliticAgr : Agr -> Str = \a -> case <agrNumber a,a.p> of {
    <Sg,P1> => "më" ;
    <Sg,P2> => "të" ;
    <Sg,P3> => "i" ;
    <Pl,P1> => "na" ;
    <Pl,P2> => "ju" ;
    <Pl,P3> => "u"
  } ;


  subjAccCliticAgr : Agr -> Str = \a ->
    teWithClitics (setAccClitic emptyCliticCluster (accCliticAgr a)) ;

  subjDatCliticAgr : Agr -> Str = \a ->
    teWithClitics (setDatClitic emptyCliticCluster (datCliticAgr a)) ;

}