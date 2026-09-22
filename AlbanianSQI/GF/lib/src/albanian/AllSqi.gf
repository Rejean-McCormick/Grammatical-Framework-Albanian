--# -path=.:../abstract:../common:../api:../prelude

concrete AllSqi of AllSqiAbs =
  LangSqi,
  ExtendSqi,
  IrregSqi
  **
  open ExtraSqi
  in {}
