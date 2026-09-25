concrete DocumentationSqi of Documentation = CatSqi ** open
  ParamX, ResSqi, Prelude, HTML in {

lincat
  Inflection = {t : Str; s1,s2,s3 : Str} ;
  Definition = {s : Str} ;
  Document   = {s : Str} ;
  Tag        = {s : Str} ;

lin InflectionN, InflectionN2, InflectionN3 = \x -> {
      t="em" ;
      s1=heading1 ("Emër" ++
                   case <x.g ! Sg,x.g ! Pl> of {
                     <Masc,Masc> => "(mashkullor)" ;
                     <Fem,Fem>   => "(femëror)" ;
                     <Masc,Fem>  => "(mashkullor sg / femëror pl)" ;
                     <Fem,Masc>  => "(femëror sg / mashkullor pl)"
                   }) ;
      s2=frameTable (
           tr (intagAttr "th" "colspan=\"2\"" "" ++ th "Sg" ++ th "Pl") ++
           tr (intagAttr "th" "rowspan=\"5\"" "Indef" ++ th "Nom" ++ td (x.s ! Indef ! Nom ! Sg) ++ td (x.s ! Indef ! Nom ! Pl)) ++
           tr (th "Acc" ++ td (x.s ! Indef ! Acc ! Sg) ++ td (x.s ! Indef ! Acc ! Pl)) ++
           tr (th "Dat" ++ td (x.s ! Indef ! Dat ! Sg) ++ td (x.s ! Indef ! Dat ! Pl)) ++
           tr (th "Gen" ++ td (x.s ! Indef ! Gen ! Sg) ++ td (x.s ! Indef ! Gen ! Pl)) ++
           tr (th "Ablat" ++ td (x.s ! Indef ! Ablat ! Sg) ++ td (x.s ! Indef ! Ablat ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"5\"" "Def" ++ th "Nom" ++ td (x.s ! Def ! Nom ! Sg) ++ td (x.s ! Def ! Nom ! Pl)) ++
           tr (th "Acc" ++ td (x.s ! Def ! Acc ! Sg) ++ td (x.s ! Def ! Acc ! Pl)) ++
           tr (th "Dat" ++ td (x.s ! Def ! Dat ! Sg) ++ td (x.s ! Def ! Dat ! Pl)) ++
           tr (th "Gen" ++ td (x.s ! Def ! Gen ! Sg) ++ td (x.s ! Def ! Gen ! Pl)) ++
           tr (th "Ablat" ++ td (x.s ! Def ! Ablat ! Sg) ++ td (x.s ! Def ! Ablat ! Pl))) ;
      s3=[]
    } ;

lin InflectionA, InflectionA2 = \x -> {
      t="mb" ;
      s1=heading1 "Mbiemër" ;
      s2=frameTable (
           tr (intagAttr "th" "colspan=\"2\"" "" ++ th "Sg" ++ th "Pl") ++
           tr (intagAttr "th" "rowspan=\"2\"" "Nom" ++ th "Masc" ++ td (y ! Nom ! Masc ! Sg) ++ td (y ! Nom ! Masc ! Pl)) ++
           tr (th "Fem" ++ td (y ! Nom ! Fem ! Sg) ++ td (y ! Nom ! Fem ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Acc" ++ th "Masc" ++ td (y ! Acc ! Masc ! Sg) ++ td (y ! Acc ! Masc ! Pl)) ++
           tr (th "Fem" ++ td (y ! Acc ! Fem ! Sg) ++ td (y ! Acc ! Fem ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Dat" ++ th "Masc" ++ td (y ! Dat ! Masc ! Sg) ++ td (y ! Dat ! Masc ! Pl)) ++
           tr (th "Fem" ++ td (y ! Dat ! Fem ! Sg) ++ td (y ! Dat ! Fem ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Gen" ++ th "Masc" ++ td (y ! Gen ! Masc ! Sg) ++ td (y ! Gen ! Masc ! Pl)) ++
           tr (th "Fem" ++ td (y ! Gen ! Fem ! Sg) ++ td (y ! Gen ! Fem ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Ablat" ++ th "Masc" ++ td (y ! Ablat ! Masc ! Sg) ++ td (y ! Ablat ! Masc ! Pl)) ++
           tr (th "Fem" ++ td (y ! Ablat ! Fem ! Sg) ++ td (y ! Ablat ! Fem ! Pl))) ;
      s3=[]
    } where {
        y : Case => Gender => Number => Str =
          \\c,g,n => case adjNeedsNyje x of {
                       True  => nyje ! Indef ! c ! g ! n ++ x.s ! c ! g ! n ;
                       False => x.s ! c ! g ! n
                     } ;
    } ;

lin InflectionV, InflectionV2, InflectionVV, InflectionVS, InflectionVQ, InflectionVA,
    InflectionV3, InflectionV2V, InflectionV2S, InflectionV2Q, InflectionV2A = \x -> {
      t="fl" ;
      s1=heading1 "Folje" ;
      s2=frameTable (
           tr (intagAttr "th" "rowspan=\"24\"" "Indicative" ++ intagAttr "th" "rowspan=\"6\"" "Pres" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.Indicative ! Pres ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Pres ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Pres ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.Indicative ! Pres ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Pres ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Pres ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "Perfect" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.Indicative ! Perfect ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Perfect ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Perfect ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.Indicative ! Perfect ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Perfect ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Perfect ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "Aorist" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.Indicative ! Aorist ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Aorist ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Aorist ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.Indicative ! Aorist ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Aorist ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Aorist ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "Imperfect" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.Indicative ! Imperfect ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Imperfect ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Imperfect ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.Indicative ! Imperfect ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.Indicative ! Imperfect ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.Indicative ! Imperfect ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "Subjunctive" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.Subjunctive ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.Subjunctive ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.Subjunctive ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.Subjunctive ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.Subjunctive ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.Subjunctive ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Imperative" ++ th "Sg" ++ td (x.Imperative ! Sg)) ++
           tr (th "Pl" ++ td (x.Imperative ! Pl)) ++
           tr (th "participle" ++ td (x.participle)) ++
           tr (th "morphVoice" ++ td (case x.morphVoice of {ActiveMorph=>"active"; NonActiveMorph=>"non-active"})) ++
           tr (th "perfectAux" ++ td (case x.perfectAux of {AuxKam=>"kam"; AuxJam=>"jam"})) ++
           tr (intagAttr "th" "rowspan=\"6\"" "pres_optative" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.pres_optative ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.pres_optative ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.pres_optative ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.pres_optative ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.pres_optative ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.pres_optative ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "perf_optative" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.perf_optative ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.perf_optative ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.perf_optative ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.perf_optative ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.perf_optative ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.perf_optative ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "pres_admirative" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.pres_admirative ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.pres_admirative ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.pres_admirative ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.pres_admirative ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.pres_admirative ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.pres_admirative ! Pl ! P3)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "imperf_admirative" ++ intagAttr "th" "rowspan=\"3\"" "Sg" ++ th "P1" ++ td (x.imperf_admirative ! Sg ! P1)) ++
           tr (th "P2" ++ td (x.imperf_admirative ! Sg ! P2)) ++
           tr (th "P3" ++ td (x.imperf_admirative ! Sg ! P3)) ++
           tr (intagAttr "th" "rowspan=\"3\"" "Pl" ++ th "P1" ++ td (x.imperf_admirative ! Pl ! P1)) ++
           tr (th "P2" ++ td (x.imperf_admirative ! Pl ! P2)) ++
           tr (th "P3" ++ td (x.imperf_admirative ! Pl ! P3))) ;
      s3=[]
    } ;

lin InflectionAdv, InflectionAdV, InflectionAdA, InflectionAdN = \x -> {
      t="nd" ;
      s1=heading1 "Ndajfolje" ;
      s2=frameTable (
           tr (th "s" ++ td (x.s))) ;
      s3=[]
    } ;

lin
  InflectionPN x = caseInflection "pn" "Emër i përveçëm" x.s ;
  InflectionLN x = caseInflection "ln" "Emër vendi" x.s ;
  InflectionGN x = caseInflection "gn" "Emër vetjak" x.s ;
  InflectionSN x = {
    t="sn" ;
    s1=heading1 "Mbiemër familjar" ;
    s2=frameTable (
      tr (th "" ++ th "Nom" ++ th "Acc" ++ th "Dat" ++ th "Gen" ++ th "Ablat") ++
      tr (th "Masc" ++ td (x.s!Masc!Nom) ++ td (x.s!Masc!Acc) ++ td (x.s!Masc!Dat) ++ td (x.s!Masc!Gen) ++ td (x.s!Masc!Ablat)) ++
      tr (th "Fem" ++ td (x.s!Fem!Nom) ++ td (x.s!Fem!Acc) ++ td (x.s!Fem!Dat) ++ td (x.s!Fem!Gen) ++ td (x.s!Fem!Ablat)) ++
      tr (th "Pl" ++ td (x.p!Nom) ++ td (x.p!Acc) ++ td (x.p!Dat) ++ td (x.p!Gen) ++ td (x.p!Ablat))) ;
    s3=[]
  } ;
  InflectionPrep x = simpleInflection "prep" "Parafjalë" x.s ;

  NoDefinition t = {s = t.s} ;
  MkDefinition t d = {s = "<p><b>Definition:</b>" ++ t.s ++ d.s ++ "</p>"} ;
  MkDefinitionEx t d e =
    {s = "<p><b>Definition:</b>" ++ t.s ++ d.s ++ "</p><p><b>Example:</b>" ++ e.s ++ "</p>"} ;
  MkDocument d i e = {s = i.s1 ++ d.s ++ i.s2 ++ i.s3 ++ e.s} ;
  MkTag i = {s = i.t} ;

oper
  caseInflection : Str -> Str -> (Case => Str) -> {t : Str; s1,s2,s3 : Str} = \tag,label,forms -> {
    t = tag ;
    s1 = heading1 label ;
    s2 = frameTable (
      tr (th "Nom" ++ td (forms ! Nom)) ++
      tr (th "Acc" ++ td (forms ! Acc)) ++
      tr (th "Dat" ++ td (forms ! Dat)) ++
      tr (th "Gen" ++ td (forms ! Gen)) ++
      tr (th "Ablat" ++ td (forms ! Ablat))) ;
    s3 = []
  } ;

  simpleInflection : Str -> Str -> Str -> {t : Str; s1,s2,s3 : Str} = \tag,label,form -> {
    t = tag ;
    s1 = heading1 label ;
    s2 = frameTable (tr (th "s" ++ td form)) ;
    s3 = []
  } ;

}