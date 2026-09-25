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
      Gen => table {Masc => "sa" ; Fem => "sa"} ;
      Dat => table {Masc => "sa" ; Fem => "sa"} ;
      Ablat => table {Masc => "sa" ; Fem => "sa"}
    } ; n=Pl
  } ;
  many_Det = SR.mkDetInv "shumë" Pl ;
  most_Predet = P.mkPredet "shumica" ;
  much_Det = SR.mkDetInv "shumë" Sg ;
  only_Predet = P.mkPredet "vetëm" ;

  someSg_Det = SR.mkDetInv "disa" Sg ;
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
                   "këtë"  "këta"      "këtë"  "këto"
                   "këtij" "këtyre"   "kësaj" "këtyre"
                   "këtij" "këtyre"   "kësaj" "këtyre" ;

  -- Standard declined cili includes its nyje in every cell.
  which_IQuant = lin IQuant {
    s = table {
      Nom => table {
        Masc => table {Sg => "i" ++ "cili" ; Pl => "të" ++ "cilët"} ;
        Fem  => table {Sg => "e" ++ "cila" ; Pl => "të" ++ "cilat"}
      } ;
      Acc => table {
        Masc => table {Sg => "të" ++ "cilin" ; Pl => "të" ++ "cilët"} ;
        Fem  => table {Sg => "të" ++ "cilën" ; Pl => "të" ++ "cilat"}
      } ;
      Gen => table {
        Masc => table {Sg => "të" ++ "cilit" ; Pl => "të" ++ "cilëve"} ;
        Fem  => table {Sg => "së" ++ "cilës" ; Pl => "të" ++ "cilave"}
      } ;
      Dat => table {
        Masc => table {Sg => "të" ++ "cilit" ; Pl => "të" ++ "cilëve"} ;
        Fem  => table {Sg => "së" ++ "cilës" ; Pl => "të" ++ "cilave"}
      } ;
      Ablat => table {
        Masc => table {Sg => "të" ++ "cilit" ; Pl => "të" ++ "cilëve"} ;
        Fem  => table {Sg => "së" ++ "cilës" ; Pl => "të" ++ "cilave"}
      }
    }
  } ;

  -- Pronouns and noun-phrase constants
  everybody_NP = SR.mkNPConstP3 "të gjithë" ;
  everything_NP = SR.mkNPConstP3 "gjithçka" ;

  he_Pron =
    ResSqi.mkPron "ai" "atë" "atij" "atij" (GSg Masc) P3 ;

  i_Pron =
    ResSqi.mkPron "unë" "mua" "mua" "meje" (GSg Masc) P1 ;

  -- Lesson 30 states that an unspecified-gender referent defaults to the
  -- feminine demonstrative series; this is the RGL "it" strategy.
  it_Pron =
    ResSqi.mkPron "ajo" "atë" "asaj" "asaj" (GSg Fem) P3 ;

  she_Pron =
    ResSqi.mkPron "ajo" "atë" "asaj" "asaj" (GSg Fem) P3 ;

  somebody_NP = SR.mkNPConstP3 "dikush" ;
  something_NP = SR.mkNPConstP3 "diçka" ;

  they_Pron =
    ResSqi.mkPron "ata" "ata" "atyre" "atyre" (GPl Masc) P3 ;

  we_Pron =
    ResSqi.mkPron "ne" "ne" "neve" "nesh" (GPl Masc) P1 ;

  whatPl_IP = lin IP {
    s=table {Nom=>"çfarë"; Acc=>"çfarë"; Gen=>"çfarë"; Dat=>"çfarë"; Ablat=>"çfarë"};
    a={gn=GPl Masc;p=P3}
  } ;
  whatSg_IP = lin IP {
    s=table {Nom=>"çfarë"; Acc=>"çfarë"; Gen=>"çfarë"; Dat=>"çfarë"; Ablat=>"çfarë"};
    a={gn=GSg Masc;p=P3}
  } ;

  whoPl_IP = lin IP {
    s=table {Nom=>"kush"; Acc=>"kë"; Gen=>"kujt"; Dat=>"kujt"; Ablat=>"kujt"};
    a={gn=GPl Masc;p=P3}
  } ;
  whoSg_IP = lin IP {
    s=table {Nom=>"kush"; Acc=>"kë"; Gen=>"kujt"; Dat=>"kujt"; Ablat=>"kujt"};
    a={gn=GSg Masc;p=P3}
  } ;

  youSg_Pron =
    ResSqi.mkPron "ti" "ty" "ty" "teje" (GSg Masc) P2 ;

  youPl_Pron =
    ResSqi.mkPron "ju" "ju" "juve" "jesh" (GPl Masc) P2 ;

  youPol_Pron =
    ResSqi.mkPron "ju" "ju" "juve" "jesh" (GPl Masc) P2 ;

  nobody_NP = SR.mkNPConstP3 "askush" ;
  nothing_NP = SR.mkNPConstP3 "asgjë" ;

} ;