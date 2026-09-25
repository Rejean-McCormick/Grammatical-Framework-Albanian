concrete AlbMorphologyMaxNegativeSqi of AlbMorphologyMaxNegative =
  open Prelude, ResSqi, (P = ParadigmsSqi) in {
  lincat Probe = {s : Str} ;
  lin
    -- Every item is intentionally incompatible. Linearization must fail
    -- explicitly instead of silently discarding the supplied principal part.
    BAD_N2 = {s = (P.reg2N "mal" "WRONG").s ! Indef ! Nom ! Pl} ;
    BAD_N3 = {s = (P.reg3N "mal" "male" "WRONG").s ! Def ! Nom ! Sg} ;
    BAD_A2 = {s = (P.reg2A "madh" "WRONG").s ! Nom ! Masc ! Pl} ;
    BAD_V2 = {s = (P.reg2V "shkruaj" "WRONG").participle} ;
    BAD_V3 = {s = (P.reg3V "shkruaj" "WRONG" "shkruar").Indicative ! Aorist ! Sg ! P1} ;
    BAD_V4 = {s = (P.reg4V "shkruaj" "shkrova" "shkruar" "WRONG").Indicative ! Imperfect ! Sg ! P1} ;
}
