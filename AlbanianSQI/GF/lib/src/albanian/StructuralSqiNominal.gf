resource StructuralSqiNominal =
  open Prelude, ParamX, ResSqi, (P = ParadigmsSqi), (SR = StructuralSqiRes) in {

oper
  -- Predeterminers, determiners, quantifiers
  all_Predet = P.mkPredet "të gjithë" ;

  every_Det = SR.mkDetInv "çdo" Sg ;
  few_Det = SR.mkDetInv "pak" Pl ;
  how8many_IDet = lin IDet {s=\_,_=>"sa"; n=Pl} ;
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
                   "këtë"  "këtyre"   "këtë"  "këtyre"
                   "këtij" "këtyre"   "kësaj" "këtyre"
                   "këtij" "këtyre"   "kësaj" "këtyre" ;

  which_IQuant = lin IQuant {
    s = \c,g,n => case <c,g,n> of {
      <Nom,Masc,Sg> => "cili" ; <Nom,Fem,Sg> => "cila" ;
      <Nom,Masc,Pl> => "cilët" ; <Nom,Fem,Pl> => "cilat" ;
      <Acc,Masc,Sg> => "cilin" ; <Acc,Fem,Sg> => "cilën" ;
      <Acc,Masc,Pl> => "cilët" ; <Acc,Fem,Pl> => "cilat" ;
      <Dat,Masc,Sg> => "cilit" ; <Dat,Fem,Sg> => "cilës" ;
      <Dat,Masc,Pl> => "cilëve" ; <Dat,Fem,Pl> => "cilave" ;
      <Ablat,Masc,Sg> => "cilit" ; <Ablat,Fem,Sg> => "cilës" ;
      <Ablat,Masc,Pl> => "cilëve" ; <Ablat,Fem,Pl> => "cilave"
    }
  } ;

  -- Pronouns and noun-phrase constants
  everybody_NP = SR.mkNPConstP3 "të gjithë" ;
  everything_NP = SR.mkNPConstP3 "gjithçka" ;

  he_Pron =
    ResSqi.mkPron "ai" "atë" "atij" "atij" "e" "i" (GSg Masc) P3 ;

  i_Pron =
    ResSqi.mkPron "unë" "mua" "mua" "meje" "më" "më" (GSg Masc) P1 ;

  -- Kept exactly as in the original source.
  it_Pron =
    ResSqi.mkPron "ai" "atë" "atij" "atij" "e" "i" (GSg Masc) P3 ;

  she_Pron =
    ResSqi.mkPron "ajo" "atë" "asaj" "asaj" "e" "i" (GSg Fem) P3 ;

  somebody_NP = SR.mkNPConstP3 "dikush" ;
  something_NP = SR.mkNPConstP3 "diçka" ;

  they_Pron =
    ResSqi.mkPron "ata" "ata" "atyre" "atyre" "i" "u" GPl P3 ;

  we_Pron =
    ResSqi.mkPron "ne" "ne" "neve" "nesh" "na" "na" GPl P1 ;

  whatPl_IP = lin IP {
    s=\_=>"çfarë"; a={gn=GPl;p=P3}
  } ;
  whatSg_IP = lin IP {
    s=\_=>"çfarë"; a={gn=GSg Masc;p=P3}
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