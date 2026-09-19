--# -path=.:../abstract:../common:../prelude:../api

-- Public language surface: core grammar + lexicon + constructions +
-- documentation, matching the mature RGL Lang architecture.
concrete LangSqi of Lang =
  GrammarSqi,
  LexiconSqi,
  ConstructionSqi,
  DocumentationSqi
  ** {

flags
  startcat = Phr ;

} ;
