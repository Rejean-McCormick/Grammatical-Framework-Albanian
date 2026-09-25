-- Finite/subjunctive VP coordination family for Albanian Extend/Extra.
-- Keeps substantive realization logic out of the thin concrete coordinators.
resource ExtendSqiVPS =
  open Prelude, GrammarSqi, CatSqi, ClauseSqiRes,
       (R = ResSqi), (P = ParamX) in {

oper
  VPSRec : Type = {s : R.Agr => Str} ;
  VPSListRec : Type = {first,last : R.Agr => Str} ;

  -- A binary VP must not be flattened before ComplVPS2/ComplVPI2 supplies
  -- the shared object.  Keep two finite-table realizations: one for an overt
  -- lexical object (including obligatory dative clitic doubling), and one for
  -- an Acc/Dat pronominal object realized as a weak clitic.
  VPS2Rec : Type = {
    plain,pron : R.Agr => R.Agr => Str ;
    c2 : R.Compl
  } ;
  VPS2ListRec : Type = {
    plainFirst,plainLast,pronFirst,pronLast : R.Agr => R.Agr => Str ;
    c2 : R.Compl
  } ;

  lexicalObjectVP : R.VPSlash -> R.Agr -> R.VP = \sl,objAgr ->
    case sl.c2.c of {
      R.Dat => appendClitic (vpFromSlash sl) (R.datCliticAgr objAgr) (R.subjDatCliticAgr objAgr) ;
      _ => vpFromSlash sl
    } ;

  pronominalObjectVP : R.VPSlash -> R.Agr -> R.VP = \sl,objAgr ->
    case sl.c2.c of {
      R.Acc => appendClitic (vpFromSlash sl) (R.accCliticAgr objAgr) (R.subjAccCliticAgr objAgr) ;
      R.Dat => appendClitic (vpFromSlash sl) (R.datCliticAgr objAgr) (R.subjDatCliticAgr objAgr) ;
      _ => vpFromSlash sl
    } ;

  vps_MkVPS : Temp -> Pol -> VP -> VPSRec = \t,pol,vp -> {
    s=\\a =>realizeVP vp t.t t.a pol.p a
  } ;
  vps_BaseVPS : VPSRec -> VPSRec -> VPSListRec = \x,y -> {first=x.s; last=y.s} ;
  vps_ConsVPS : VPSRec -> VPSListRec -> VPSListRec = \x,xs -> {
    first=\\a =>x.s!a ++ "," ++ xs.first!a ; last=xs.last
  } ;
  vps_ConjVPS : Conj -> VPSListRec -> VPSRec = \c,xs -> {
    s=\\a =>xs.first!a ++ c.s ++ xs.last!a
  } ;
  vps_PredVPS : NP -> VPSRec -> S = \np,x -> lin S {
    s=np.s!R.Nom ++ x.s!np.a
  } ;
  vps_SQuestVPS : NP -> VPSRec -> QS = \np,x -> lin QS {
    s="a" ++ np.s!R.Nom ++ x.s!np.a
  } ;
  vps_QuestVPS : IP -> VPSRec -> QS = \ip,x -> lin QS {
    s=ip.s!R.Nom ++ x.s!ip.a
  } ;
  vps_RelVPS : RP -> VPSRec -> RS = \rp,x -> lin RS {
    s=\\a =>rp.s!R.Nom!a.g!a.n ++ x.s!a
  } ;

  vps_MkVPI : VP -> VPSRec = \vp -> {
    s=\\a =>realizeSubjVP vp P.Pos a
  } ;
  vps_BaseVPI : VPSRec -> VPSRec -> VPSListRec = vps_BaseVPS ;
  vps_ConsVPI : VPSRec -> VPSListRec -> VPSListRec = vps_ConsVPS ;
  vps_ConjVPI : Conj -> VPSListRec -> VPSRec = vps_ConjVPS ;
  vps_ComplVPIVV : VV -> VPSRec -> R.VP = \vv,x ->
    appendVP (emptyVP vv) (\\a =>x.s!a) ;

  vps_MkVPS2 : Temp -> Pol -> VPSlash -> VPS2Rec = \t,pol,sl -> {
    plain=\\obj,subj =>realizeVP (lexicalObjectVP sl obj) t.t t.a pol.p subj ;
    pron=\\obj,subj =>realizeVP (pronominalObjectVP sl obj) t.t t.a pol.p subj ;
    c2=sl.c2
  } ;
  vps_BaseVPS2 : VPS2Rec -> VPS2Rec -> VPS2ListRec = \x,y -> {
    plainFirst=x.plain ; plainLast=y.plain ;
    pronFirst=x.pron ; pronLast=y.pron ; c2=y.c2
  } ;
  vps_ConsVPS2 : VPS2Rec -> VPS2ListRec -> VPS2ListRec = \x,xs -> {
    plainFirst=\\obj,a =>x.plain!obj!a ++ "," ++ xs.plainFirst!obj!a ;
    plainLast=xs.plainLast ;
    pronFirst=\\obj,a =>x.pron!obj!a ++ "," ++ xs.pronFirst!obj!a ;
    pronLast=xs.pronLast ;
    c2=xs.c2
  } ;
  vps_ConjVPS2 : Conj -> VPS2ListRec -> VPS2Rec = \c,xs -> {
    plain=\\obj,a =>xs.plainFirst!obj!a ++ c.s ++ xs.plainLast!obj!a ;
    pron=\\obj,a =>xs.pronFirst!obj!a ++ c.s ++ xs.pronLast!obj!a ;
    c2=xs.c2
  } ;
  vps_ComplVPS2 : VPS2Rec -> NP -> VPSRec = \x,np -> {
    s=\\a =>case <np.isPron,x.c2.c> of {
      <True,R.Acc> => x.pron!np.a!a ;
      <True,R.Dat> => x.pron!np.a!a ;
      _ => x.plain!np.a!a ++ x.c2.s ++ np.s!x.c2.c
    }
  } ;
  vps_ReflVPS2 : VPS2Rec -> {s : R.Agr => R.Case => Str ; isPron : Bool} -> VPSRec = \x,rnp -> {
    s=\\a =>case <rnp.isPron,x.c2.c> of {
      <True,R.Acc> => x.pron!a!a ;
      <True,R.Dat> => x.pron!a!a ;
      _ => x.plain!a!a ++ x.c2.s ++ rnp.s!a!x.c2.c
    }
  } ;

  vps_MkVPI2 : VPSlash -> VPS2Rec = \sl -> {
    plain=\\obj,subj =>realizeSubjVP (lexicalObjectVP sl obj) P.Pos subj ;
    pron=\\obj,subj =>realizeSubjVP (pronominalObjectVP sl obj) P.Pos subj ;
    c2=sl.c2
  } ;
  vps_BaseVPI2 : VPS2Rec -> VPS2Rec -> VPS2ListRec = vps_BaseVPS2 ;
  vps_ConsVPI2 : VPS2Rec -> VPS2ListRec -> VPS2ListRec = vps_ConsVPS2 ;
  vps_ConjVPI2 : Conj -> VPS2ListRec -> VPS2Rec = vps_ConjVPS2 ;
  vps_ComplVPI2 : VPS2Rec -> NP -> VPSRec = vps_ComplVPS2 ;

}
