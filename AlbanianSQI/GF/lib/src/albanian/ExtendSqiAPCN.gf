resource ExtendSqiAPCN =
  open Prelude, GrammarSqi, CatSqi, ClauseSqiRes,
       (R = ResSqi), (P = ParamX), NounSqi, AdjectiveSqi in {

oper
  apcn_ICompAP : AP -> IComp = \ap -> lin IComp {
    s="sa" ++ ap.s!R.Indef!R.Nom!R.Masc!P.Sg
  } ;

  apcn_CompBareCN : CN -> Comp = \cn -> CompCN cn ;

  apcn_CompIQuant : IQuant -> IComp = \iq ->
    CompIP (IdetIP (IdetQuant iq NumSg)) ;

  apcn_PredAPVP : AP -> VP -> Cl = \ap,vp ->
    ImpersCl (UseComp (CompAP (SentAP ap (EmbedVP vp)))) ;

  apcn_AdjAsCN : AP -> CN = \ap -> lin CN {
    s=\sp,c,n=>ap.s!sp!c!R.Masc!n ; g=R.Masc
  } ;

  apcn_AdjAsNP : AP -> NP = \ap ->
    DetCN (DetQuant IndefArt NumSg) (apcn_AdjAsCN ap) ;

  apcn_CardCNCard : Card -> CN -> Card = \card,cn -> lin Card {
    s=card.s ++ cn.s!R.Indef!R.Nom!card.n ; n=card.n
  } ;

}
