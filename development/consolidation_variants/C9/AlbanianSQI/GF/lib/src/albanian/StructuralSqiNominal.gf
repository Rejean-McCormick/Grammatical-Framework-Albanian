resource StructuralSqiNominal =
  open Prelude, ParamX, ResSqi, (P = ParadigmsSqi), (SR = StructuralSqiRes) in {

oper
  -- Predeterminers, determiners, quantifiers
  all_Predet = P.mkPredet "të gjithë" ;

  every_Det = SR.mkDetInv "çdo" Sg ;
  few_Det = SR.mkDetInv "pak" Pl ;
  how8many_IDet = lin IDet {
    s = table {
      Nom => table {Masc => "sa" ; Fem => "sa"} ;
      Acc => table {Masc => "sa" ; Fem => "sa"} ;
      Dat => table {Masc => "sa" ; Fem => "sa"} ;
      Ablat => table {Masc => "sa" ; Fem => "sa"}
    } ; n=Pl
  } ;
  many_Det = SR.mkDetInv "shumë" Pl ;
  most_Predet = P.mkPredet "shumica" ;
  much_Det = SR.mkDetInv "shumë" Sg ;
  only_Predet = P.mkPredet "vetëm" ;

  -- Standard singular some/any: ndonjë.  The supplied Geg lesson glosses
  -- ndo'i "some, any" and explicitly gives Standard Albanian ndonjë.
  someSg_Det = SR.mkDetInv "ndonjë" Sg ;
  somePl_Det = SR.mkDetInv "disa" Pl ;

  no_Quant = SR.mkQuantInv "asnjë" ;
  not_Predet = P.mkPredet "jo" ;

  that_Quant =
    ResSqi.mkQuant "ai"   "ata"   "ajo"  "ato"
                   "atë"  "ata"   "atë"  "ato"
                   "atij" "atyre" "asaj" "atyre"
                   "atij" "atyre" "asaj" "atyre" ;

  this_Quant =
    ResSqi.mkQuant "ky"    "këta"     "kjo"   "këto"
                   "këtë"  "këta"     "këtë"  "këto"
                   "këtij" "këtyre"   "kësaj" "këtyre"
                   "këtij" "këtyre"   "kësaj" "këtyre" ;

  which_IQuant = lin IQuant {
    s = table {
      Nom => table {
        Masc => table {Sg => "cili" ; Pl => "cilët"} ;
        Fem  => table {Sg => "cila" ; Pl => "cilat"}
      } ;
      Acc => table {
        Masc => table {Sg => "cilin" ; Pl => "cilët"} ;
        Fem  => table {Sg => "cilën" ; Pl => "cilat"}
      } ;
      Dat => table {
        Masc => table {Sg => "cilit" ; Pl => "cilëve"} ;
        Fem  => table {Sg => "cilës" ; Pl => "cilave"}
      } ;
      Ablat => table {
        Masc => table {Sg => "cilit" ; Pl => "cilëve"} ;
        Fem  => table {Sg => "cilës" ; Pl => "cilave"}
      }
    }
  } ;

  -- Pronouns and noun-phrase constants
  everybody_NP = SR.mkNPConstP3 "të gjithë" ;
  everything_NP = SR.mkNPConstP3 "gjithçka" ;

  he_Pron =
    ResSqi.mkPron "ai" "atë" "atij" "atij" "e" "i" (GSg Masc) P3 ;

  i_Pron =
    ResSqi.mkPron "unë" "mua" "mua" "meje" "më" "më" (GSg Masc) P1 ;

  -- The supplied Lesson 30 notes that when gender is unspecified, the
  -- default pronoun form is feminine.  The common-RGL neuter-like `it`
  -- therefore receives the Albanian feminine default rather than inventing
  -- a productive neuter category.
  it_Pron =
    ResSqi.mkPron "ajo" "atë" "asaj" "asaj" "e" "i" (GSg Fem) P3 ;

  she_Pron =
    ResSqi.mkPron "ajo" "atë" "asaj" "asaj" "e" "i" (GSg Fem) P3 ;

  somebody_NP = SR.mkNPConstP3 "dikush" ;
  something_NP = SR.mkNPConstP3 "diçka" ;

  -- Common `they` is not gender-parameterized.  Use the same supplied
  -- unspecified-gender policy: feminine plural `ato` as the neutralized
  -- Albanian default; explicitly gendered contexts should use richer paths.
  they_Pron =
    ResSqi.mkPron "ato" "ato" "atyre" "atyre" "i" "u" GPl P3 ;

  we_Pron =
    ResSqi.mkPron "ne" "ne" "neve" "nesh" "na" "na" GPl P1 ;

  whatPl_IP = lin IP {
    s=table {Nom=>"çfarë"; Acc=>"çfarë"; Dat=>"çfarë"; Ablat=>"çfarë"};
    a={gn=GPl;p=P3}
  } ;
  whatSg_IP = lin IP {
    s=table {Nom=>"çfarë"; Acc=>"çfarë"; Dat=>"çfarë"; Ablat=>"çfarë"};
    a={gn=GSg Masc;p=P3}
  } ;

  whoPl_IP = lin IP {
    s=table {Nom=>"kush"; Acc=>"kë"; Dat=>"kujt"; Ablat=>"kujt"};
    a={gn=GPl;p=P3}
  } ;
  whoSg_IP = lin IP {
    s=table {Nom=>"kush"; Acc=>"kë"; Dat=>"kujt"; Ablat=>"kujt"};
    a={gn=GSg Masc;p=P3}
  } ;

  youSg_Pron =
    ResSqi.mkPron "ti" "ty" "ty" "teje" "të" "të" (GSg Masc) P2 ;

  youPl_Pron =
    ResSqi.mkPron "ju" "ju" "juve" "jush" "ju" "ju" GPl P2 ;

  youPol_Pron =
    ResSqi.mkPron "ju" "ju" "juve" "jush" "ju" "ju" GPl P2 ;

  nobody_NP = SR.mkNPConstP3 "askush" ;
  nothing_NP = SR.mkNPConstP3 "asgjë" ;

} ;