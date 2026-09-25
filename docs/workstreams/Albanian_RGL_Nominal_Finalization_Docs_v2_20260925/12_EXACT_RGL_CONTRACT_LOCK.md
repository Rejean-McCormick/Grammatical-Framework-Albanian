# Exact RGL Contract Lock — domaine nominal
> **Document version**: 2.0  
> **Document status**: GENERATED SOURCE LOCK  
> **Regeneration trigger**: changement de `gf-rgl-master.zip` ou de l’abstract RGL utilisé par le chantier.  
## 1. Règle

Ce document verrouille **ce que l’API abstraite RGL exige**, indépendamment de la manière dont l’Albanais le réalise. Une proposition qui contredit ces signatures doit d’abord changer de scope ou expliciter qu’elle requiert une évolution de l’abstract RGL; elle ne peut pas être introduite silencieusement dans le concrete albanais.
## 2. Source verrouillée

- archive: `gf-rgl-master.zip`
- SHA-256 archive: `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d`
- `src/abstract/Cat.gf`: `ed805138026e445029609ee6f5299d69f958e28c966da0ee27c84a4a2b0c1196`
- `src/abstract/Noun.gf`: `93dfeb610b055488eca9de2cf03feaedb79a1bee68a0adc6c17525f4acf02c61` — 43 déclarations typées extraites
- `src/abstract/Adjective.gf`: `c75472970e177898e0cad5aa42f66f74fa64597bef858dca32e52aefb941b212` — 11 déclarations typées extraites
- `src/abstract/Numeral.gf`: `2f14b13d61b982afadbcd9bd9df55e3ff464f9f93d262521618eb580cf94ee9b` — 51 déclarations typées extraites
- `src/abstract/Names.gf`: `a23878235c8c13a1b7b08c7196842edc55e2b50828bf59eff037485dace1c7a8` — 9 déclarations typées extraites

## 3. Catégories nominales pertinentes

Les catégories abstraites concernées directement ou indirectement sont `N`, `N2`, `N3`, `CN`, `NP`, `Pron`, `PN`, `GN`, `SN`, `LN`, `A`, `A2`, `AP`, `Det`, `Predet`, `Quant`, `Num`, `Card`, `Ord`, `DAP`, `IDet`, `IQuant`, `IP`, `RP`, `Prep`. Le concrete peut leur donner des représentations albanaises différentes de celles d’English, mais ne peut pas modifier leurs signatures abstraites.

## 4.1 `Noun` — signatures exactes

| Fonction | Signature abstraite |
|---|---|
| `DetCN` | `Det -> CN -> NP` |
| `UsePN` | `PN -> NP` |
| `UsePron` | `Pron -> NP` |
| `PredetNP` | `Predet -> NP -> NP` |
| `PPartNP` | `NP -> V2 -> NP` |
| `AdvNP` | `NP -> Adv -> NP` |
| `ExtAdvNP` | `NP -> Adv -> NP` |
| `RelNP` | `NP -> RS -> NP` |
| `DetNP` | `Det -> NP` |
| `DetQuant` | `Quant -> Num -> Det` |
| `DetQuantOrd` | `Quant -> Num -> Ord -> Det` |
| `NumSg` | `Num` |
| `NumPl` | `Num` |
| `NumCard` | `Card -> Num` |
| `NumDigits` | `Digits -> Card` |
| `NumDecimal` | `Decimal -> Card` |
| `NumNumeral` | `Numeral -> Card` |
| `AdNum` | `AdN -> Card -> Card` |
| `OrdDigits` | `Digits -> Ord` |
| `OrdNumeral` | `Numeral -> Ord` |
| `OrdSuperl` | `A -> Ord` |
| `OrdNumeralSuperl` | `Numeral -> A -> Ord` |
| `IndefArt` | `Quant` |
| `DefArt` | `Quant` |
| `MassNP` | `CN -> NP` |
| `PossPron` | `Pron -> Quant` |
| `UseN` | `N -> CN` |
| `ComplN2` | `N2 -> NP -> CN` |
| `ComplN3` | `N3 -> NP -> N2` |
| `UseN2` | `N2 -> CN` |
| `Use2N3` | `N3 -> N2` |
| `Use3N3` | `N3 -> N2` |
| `AdjCN` | `AP -> CN -> CN` |
| `RelCN` | `CN -> RS -> CN` |
| `AdvCN` | `CN -> Adv -> CN` |
| `SentCN` | `CN -> SC -> CN` |
| `ApposCN` | `CN -> NP -> CN` |
| `PossNP` | `CN -> NP -> CN` |
| `PartNP` | `CN -> NP -> CN` |
| `CountNP` | `Det -> NP -> NP` |
| `AdjDAP` | `DAP -> AP -> DAP` |
| `DetDAP` | `Det -> DAP` |
| `QuantityNP` | `Decimal -> MU -> NP` |

## 4.2 `Adjective` — signatures exactes

| Fonction | Signature abstraite |
|---|---|
| `PositA` | `A -> AP` |
| `ComparA` | `A -> NP -> AP` |
| `ComplA2` | `A2 -> NP -> AP` |
| `ReflA2` | `A2 -> AP` |
| `UseA2` | `A2 -> AP` |
| `UseComparA` | `A -> AP` |
| `CAdvAP` | `CAdv -> AP -> NP -> AP` |
| `AdjOrd` | `Ord -> AP` |
| `SentAP` | `AP -> SC -> AP` |
| `AdAP` | `AdA -> AP -> AP` |
| `AdvAP` | `AP -> Adv -> AP` |

## 4.3 `Numeral` — signatures exactes

| Fonction | Signature abstraite |
|---|---|
| `num` | `Sub1000000 -> Numeral` |
| `n2` | `Digit` |
| `n3` | `Digit` |
| `n4` | `Digit` |
| `n5` | `Digit` |
| `n6` | `Digit` |
| `n7` | `Digit` |
| `n8` | `Digit` |
| `n9` | `Digit` |
| `pot01` | `Sub10` |
| `pot0` | `Digit -> Sub10` |
| `pot0as1` | `Sub10 -> Sub100` |
| `pot110` | `Sub100` |
| `pot111` | `Sub100` |
| `pot1to19` | `Digit -> Sub100` |
| `pot1` | `Digit -> Sub100` |
| `pot1plus` | `Digit -> Sub10 -> Sub100` |
| `pot1as2` | `Sub100 -> Sub1000` |
| `pot21` | `Sub1000` |
| `pot2` | `Sub10 -> Sub1000` |
| `pot2plus` | `Sub10 -> Sub100 -> Sub1000` |
| `pot2as3` | `Sub1000 -> Sub1000000` |
| `pot31` | `Sub1000000` |
| `pot3` | `Sub1000 -> Sub1000000` |
| `pot3plus` | `Sub1000 -> Sub1000 -> Sub1000000` |
| `pot3as4` | `Sub1000000 -> Sub1000000000` |
| `pot3decimal` | `Decimal -> Sub1000000` |
| `pot41` | `Sub1000000000` |
| `pot4` | `Sub1000 -> Sub1000000000` |
| `pot4plus` | `Sub1000 -> Sub1000000 -> Sub1000000000` |
| `pot4as5` | `Sub1000000000 -> Sub1000000000000` |
| `pot4decimal` | `Decimal -> Sub1000000000` |
| `pot51` | `Sub1000000000000` |
| `pot5` | `Sub1000 -> Sub1000000000000` |
| `pot5plus` | `Sub1000 -> Sub1000000000 -> Sub1000000000000` |
| `pot5decimal` | `Decimal -> Sub1000000000000` |
| `IDig` | `Dig -> Digits` |
| `IIDig` | `Dig -> Digits -> Digits` |
| `D_0` | `Dig` |
| `D_1` | `Dig` |
| `D_2` | `Dig` |
| `D_3` | `Dig` |
| `D_4` | `Dig` |
| `D_5` | `Dig` |
| `D_6` | `Dig` |
| `D_7` | `Dig` |
| `D_8` | `Dig` |
| `D_9` | `Dig` |
| `PosDecimal` | `Digits -> Decimal` |
| `NegDecimal` | `Digits -> Decimal` |
| `IFrac` | `Decimal -> Dig -> Decimal` |

## 4.4 `Names` — signatures exactes

| Fonction | Signature abstraite |
|---|---|
| `GivenName` | `GN -> NP` |
| `MaleSurname` | `SN -> NP` |
| `FemaleSurname` | `SN -> NP` |
| `PlSurname` | `SN -> NP` |
| `FullName` | `GN -> SN -> NP` |
| `UseLN` | `LN -> NP` |
| `PlainLN` | `LN -> NP` |
| `InLN` | `LN -> Adv` |
| `AdjLN` | `AP -> LN -> LN` |

## 5. Utilisation

- `13_ENGLISH_PARITY_LEDGER.md` mesure la couverture de ces signatures dans l’Albanais courant.
- `17_MIGRATION_CONTRACTS.md` doit nommer les signatures affectées par chaque migration.
- Une signature absente de ce lock ne doit pas être inventée comme exigence de parité English.
