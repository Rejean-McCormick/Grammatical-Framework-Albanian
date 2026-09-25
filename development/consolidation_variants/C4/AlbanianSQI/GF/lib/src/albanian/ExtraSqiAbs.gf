-- Albanian Extra surface.  Common Extra is preserved, with explicitly
-- Albanian TAM/mood constructors added here instead of overloading common
-- RGL Tense semantics.
abstract ExtraSqiAbs =
  Extra
  ** {
    fun
      AlbAoristS : Pol -> NP -> VP -> S ;
      AlbAoristAnteriorS : Pol -> NP -> VP -> S ;
      AlbOptativeS : NP -> VP -> S ;
      AlbPerfectOptativeS : NP -> VP -> S ;
      AlbAdmirativeS : NP -> VP -> S ;
      AlbImperfectAdmirativeS : NP -> VP -> S ;
      AlbGerundAdv : Pol -> VP -> Adv ;
      AlbPurposeAdv : Pol -> VP -> Adv ;
  }
