--# -path=.:api:albanian:common:abstract:prelude

resource CombinatorsSqi = Combinators with
  (Cat = CatSqi),
  (Structural = StructuralSqi),
  (Constructors = ConstructorsSqi) ;
