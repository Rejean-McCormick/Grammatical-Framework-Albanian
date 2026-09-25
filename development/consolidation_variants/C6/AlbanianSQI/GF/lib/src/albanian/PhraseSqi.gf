concrete PhraseSqi of Phrase = CatSqi ** open Prelude, ParamX, ResSqi, ClauseSqiRes in {
  lin
    PhrUtt pconj utt voc = {s=pconj.s ++ utt.s ++ voc.s} ;
    UttS s = s ;
    UttQS s = s ;
    UttImpSg p i = {s=i.s!p.p!Sg} ;
    UttImpPl p i = {s=i.s!p.p!Pl} ;
    UttImpPol p i = {s=i.s!p.p!Pl} ;
    UttIP ip = {s=ip.s!Nom} ;
    UttIAdv a = a ;
    UttNP np = {s=np.s!Nom} ;
    UttAdv a = a ;
    UttVP vp = {s=realizeSubjVP vp Pos defaultAgr} ;
    UttCN cn = {s=cnForm cn Indef Nom Sg} ;
    UttCard c = {s=c.s} ;
    UttAP ap = {s=ap.s!Indef!Nom!Masc!Sg} ;
    UttInterj i = i ;
    NoPConj = {s=[]} ;
    PConjConj c = c ;
    NoVoc = {s=[]} ;
    VocNP np = {s=SOFT_BIND ++ "," ++ np.s!Nom} ;
}
