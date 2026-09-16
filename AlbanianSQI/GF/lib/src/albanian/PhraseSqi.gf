concrete PhraseSqi of Phrase = CatSqi ** open Prelude, ResSqi in {

  lin
    PhrUtt pconj utt voc = lin Phr {s = pconj.s ++ utt.s ++ voc.s} ;

    UttS s = lin Utt {s = s.s} ;
    UttQS qs = lin Utt {s = qs.s} ;

    -- Imp is intentionally shallow in CatSqi.  Number/politeness distinctions
    -- are therefore not encoded in the lincat yet; keep all three abstract
    -- constructors explicit and preserve polarity at the phrase boundary.
    UttImpSg  pol imp = lin Utt {s = pol.s ++ imp.s} ;
    UttImpPl  pol imp = lin Utt {s = pol.s ++ imp.s} ;
    UttImpPol pol imp = lin Utt {s = pol.s ++ imp.s} ;

    UttIP ip = lin Utt {s = ip.s} ;
    UttIAdv iadv = lin Utt {s = iadv.s} ;
    UttNP np = lin Utt {s = np.s ! Nom} ;
    UttAdv adv = lin Utt {s = adv.s} ;
    UttVP vp = lin Utt {s = vp.s} ;
    UttCN cn = lin Utt {s = cn.s ! Indef ! Nom ! Sg} ;
    UttCard card = lin Utt {s = card.s} ;
    UttAP ap = lin Utt {s = ap.s ! Indef ! Nom ! Masc ! Sg} ;
    UttInterj i = lin Utt {s = i.s} ;

    NoPConj = lin PConj {s = []} ;
    PConjConj conj = lin PConj {s = conj.s} ;

    NoVoc = lin Voc {s = []} ;
    VocNP np = lin Voc {s = "," ++ np.s ! Nom} ;

}
