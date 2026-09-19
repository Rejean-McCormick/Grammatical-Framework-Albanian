-- GF/lib/src/albanian/StructuralSqiClause.gf
resource StructuralSqiClause =
  open Prelude, ParamX, CatSqi, (P = ParadigmsSqi) in {

oper
  -- =========================================================
  -- CLAUSE / DISCOURSE STRUCTURAL VOCABULARY
  -- Strategy: keep clause-level closed-class items here.
  -- Use paradigm constructors where they exist.
  -- Use mkPrep for prepositions.
  -- Keep paired-conjunction names required by Structural, but type
  -- them as Conj in line with the GF Codex usage examples.
  -- =========================================================

  -- Prepositions
  above_Prep : Prep = P.mkPrep "sipër" Ablat ;
  after_Prep : Prep = P.mkPrep "pas" Ablat ;
  before_Prep : Prep = P.mkPrep "para" Ablat ;
  behind_Prep : Prep = P.mkPrep "pas" Ablat ;
  between_Prep : Prep = P.mkPrep "midis" Ablat ;
  by8agent_Prep : Prep = P.mkPrep "nga" Ablat ;
  by8means_Prep : Prep = P.mkPrep "me" Acc ;
  during_Prep : Prep = P.mkPrep "gjatë" Ablat ;
  for_Prep : Prep = P.mkPrep "për" Acc ;
  from_Prep : Prep = P.mkPrep "nga" Ablat ;
  in8front_Prep : Prep = P.mkPrep "përpara" Ablat ;
  in_Prep : Prep = P.mkPrep "në" Acc ;
  on_Prep : Prep = P.mkPrep "mbi" Acc ;
  part_Prep : Prep = P.mkPrep "prej" Ablat ;
  possess_Prep : Prep = P.mkPrep "i" Dat ;
  through_Prep : Prep = P.mkPrep "përmes" Ablat ;
  to_Prep : Prep = P.mkPrep "në" Acc ;
  under_Prep : Prep = P.mkPrep "nën" Acc ;
  with_Prep : Prep = P.mkPrep "me" Acc ;
  without_Prep : Prep = P.mkPrep "pa" Acc ;
  except_Prep : Prep = P.mkPrep "përveç" Ablat ;

  -- Conjunctions and subordinators
  although_Subj : Subj = P.mkSubj "megjithëse" ;
  and_Conj : Conj = P.mkConj "dhe" ;
  because_Subj : Subj = P.mkSubj "sepse" ;
  both7and_DConj : Conj = P.mkConj "si edhe" ;
  but_PConj : PConj = P.mkPConj "por" ;
  either7or_DConj : Conj = P.mkConj "ose" ;
  if_Subj : Subj = P.mkSubj "nëse" ;
  if_then_Conj : Conj = P.mkConj "nëse atëherë" ;
  or_Conj : Conj = P.mkConj "ose" ;
  otherwise_PConj : PConj = P.mkPConj "përndryshe" ;
  that_Subj : Subj = P.mkSubj "që" ;
  therefore_PConj : PConj = P.mkPConj "prandaj" ;
  when_Subj : Subj = P.mkSubj "kur" ;

  -- Adverbs and adverbials
  almost_AdA : AdA = P.mkAdA "pothuajse" ;
  almost_AdN : AdN = P.mkAdN "pothuajse" ;
  always_AdV : AdV = P.mkAdV "gjithmonë" ;
  everywhere_Adv : Adv = P.mkAdv "kudo" ;
  here_Adv : Adv = P.mkAdv "këtu" ;
  here7to_Adv : Adv = P.mkAdv "deri këtu" ;
  here7from_Adv : Adv = P.mkAdv "prej këtu" ;
  how_IAdv : IAdv = P.mkIAdv "si" ;
  how8much_IAdv : IAdv = P.mkIAdv "sa" ;
  quite_Adv : AdA = P.mkAdA "mjaft" ;
  so_AdA : AdA = P.mkAdA "aq" ;
  somewhere_Adv : Adv = P.mkAdv "diku" ;
  there_Adv : Adv = P.mkAdv "atje" ;
  there7to_Adv : Adv = P.mkAdv "deri atje" ;
  there7from_Adv : Adv = P.mkAdv "prej andej" ;
  too_AdA : AdA = P.mkAdA "tepër" ;
  very_AdA : AdA = P.mkAdA "shumë" ;
  when_IAdv : IAdv = P.mkIAdv "kur" ;
  where_IAdv : IAdv = P.mkIAdv "ku" ;
  why_IAdv : IAdv = P.mkIAdv "pse" ;
  at_least_AdN : AdN = P.mkAdN "të paktën" ;
  at_most_AdN : AdN = P.mkAdN "të shumtën" ;

  -- Comparative adverbs
  less_CAdv : CAdv = lin CAdv {s = "më pak" ; p = "se"} ;
  more_CAdv : CAdv = lin CAdv {s = "më" ; p = "se"} ;
  as_CAdv : CAdv = lin CAdv {s = "po aq" ; p = "sa"} ;

  -- Utterances and vocatives
  no_Utt : Utt = lin Utt {s = "jo"} ;
  yes_Utt : Utt = lin Utt {s = "po"} ;
  please_Voc : Voc = P.mkVoc "ju lutem" ;
  language_title_Utt : Utt = lin Utt {s = "shqip"} ;

} ;