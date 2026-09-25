# English-parity ledger — surface nominale et API publique
> **Document version**: 2.0  
> **Document status**: GENERATED + REVIEWED LEDGER  
> **Benchmark**: English pour couverture/API/maturité; aucune analyse linguistique English n’est transférée automatiquement.  
## 1. Deux axes de parité

1. **Surface abstraite**: les fonctions exigées par `Noun`, `Adjective`, `Numeral`, `Names` doivent être présentes ou explicitement N/A.
2. **Expressivité de l’API de paradigmes**: le lexique albanais réel doit pouvoir être construit sans records bas niveau ni placeholders dus à une API insuffisante.

Ces axes sont indépendants: la surface abstraite peut être complète alors que `ParadigmsSqi` reste insuffisant pour les irréguliers.

## 2.1 `Noun`

| Fonction | Signature | Présente Sqi | Statut de certification / risque |
|---|---|---|---|
| `DetCN` | `Det -> CN -> NP` | YES | N2: dépend actuellement de `cn.g` scalaire; migration genre/numéro. |
| `UsePN` | `PN -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `UsePron` | `Pron -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `PredetNP` | `Predet -> NP -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `PPartNP` | `NP -> V2 -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `AdvNP` | `NP -> Adv -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `ExtAdvNP` | `NP -> Adv -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `RelNP` | `NP -> RS -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `DetNP` | `Det -> NP` | YES | N6/Q008: le code courant choisit `Masc` faute de tête nominale. |
| `DetQuant` | `Quant -> Num -> Det` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `DetQuantOrd` | `Quant -> Num -> Ord -> Det` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `NumSg` | `Num` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `NumPl` | `Num` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `NumCard` | `Card -> Num` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `NumDigits` | `Digits -> Card` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `NumDecimal` | `Decimal -> Card` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `NumNumeral` | `Numeral -> Card` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `AdNum` | `AdN -> Card -> Card` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `OrdDigits` | `Digits -> Ord` | YES | N7: ordinalisation actuelle préfixe `i`; à certifier/remplacer. |
| `OrdNumeral` | `Numeral -> Ord` | YES | N7: ordinalisation actuelle préfixe `i`; connu comme risque. |
| `OrdSuperl` | `A -> Ord` | YES | N5: degré/superlatif encore question ouverte. |
| `OrdNumeralSuperl` | `Numeral -> A -> Ord` | YES | N7/N5: combinaison ordinal/superlatif à certifier. |
| `IndefArt` | `Quant` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `DefArt` | `Quant` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `MassNP` | `CN -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `PossPron` | `Pron -> Quant` | YES | N6: paradigmes présents, certification exhaustive requise. |
| `UseN` | `N -> CN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `ComplN2` | `N2 -> NP -> CN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `ComplN3` | `N3 -> NP -> N2` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `UseN2` | `N2 -> CN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `Use2N3` | `N3 -> N2` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `Use3N3` | `N3 -> N2` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `AdjCN` | `AP -> CN -> CN` | YES | N2/N5: dépend du genre nominal et de la réalisation AP. |
| `RelCN` | `CN -> RS -> CN` | YES | N2: accord nominal transmis à la relative. |
| `AdvCN` | `CN -> Adv -> CN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `SentCN` | `CN -> SC -> CN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `ApposCN` | `CN -> NP -> CN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `PossNP` | `CN -> NP -> CN` | YES | N1/N4: code courant réalise la possession avec `np.s ! Dat` + lien local. |
| `PartNP` | `CN -> NP -> CN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `CountNP` | `Det -> NP -> NP` | YES | N6: accord courant utilise `Masc` par défaut. |
| `AdjDAP` | `DAP -> AP -> DAP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `DetDAP` | `Det -> DAP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `QuantityNP` | `Decimal -> MU -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |

## 2.2 `Adjective`

| Fonction | Signature | Présente Sqi | Statut de certification / risque |
|---|---|---|---|
| `PositA` | `A -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `ComparA` | `A -> NP -> AP` | YES | N5/Q004: comparaison à certifier. |
| `ComplA2` | `A2 -> NP -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `ReflA2` | `A2 -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `UseA2` | `A2 -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `UseComparA` | `A -> AP` | YES | N5/Q004: comparaison à certifier. |
| `CAdvAP` | `CAdv -> AP -> NP -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `AdjOrd` | `Ord -> AP` | YES | N5/N7: dépend des ordinaux certifiés. |
| `SentAP` | `AP -> SC -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `AdAP` | `AdA -> AP -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `AdvAP` | `AP -> Adv -> AP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |

## 2.3 `Numeral`

| Fonction | Signature | Présente Sqi | Statut de certification / risque |
|---|---|---|---|
| `num` | `Sub1000000 -> Numeral` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n2` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n3` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n4` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n5` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n6` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n7` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n8` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `n9` | `Digit` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot01` | `Sub10` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot0` | `Digit -> Sub10` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot0as1` | `Sub10 -> Sub100` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot110` | `Sub100` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot111` | `Sub100` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot1to19` | `Digit -> Sub100` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot1` | `Digit -> Sub100` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot1plus` | `Digit -> Sub10 -> Sub100` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot1as2` | `Sub100 -> Sub1000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot21` | `Sub1000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot2` | `Sub10 -> Sub1000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot2plus` | `Sub10 -> Sub100 -> Sub1000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot2as3` | `Sub1000 -> Sub1000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot31` | `Sub1000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot3` | `Sub1000 -> Sub1000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot3plus` | `Sub1000 -> Sub1000 -> Sub1000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot3as4` | `Sub1000000 -> Sub1000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot3decimal` | `Decimal -> Sub1000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot41` | `Sub1000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot4` | `Sub1000 -> Sub1000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot4plus` | `Sub1000 -> Sub1000000 -> Sub1000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot4as5` | `Sub1000000000 -> Sub1000000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot4decimal` | `Decimal -> Sub1000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot51` | `Sub1000000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot5` | `Sub1000 -> Sub1000000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot5plus` | `Sub1000 -> Sub1000000000 -> Sub1000000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `pot5decimal` | `Decimal -> Sub1000000000000` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `IDig` | `Dig -> Digits` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `IIDig` | `Dig -> Digits -> Digits` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_0` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_1` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_2` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_3` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_4` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_5` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_6` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_7` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_8` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `D_9` | `Dig` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `PosDecimal` | `Digits -> Decimal` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `NegDecimal` | `Digits -> Decimal` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `IFrac` | `Decimal -> Dig -> Decimal` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |

## 2.4 `Names`

| Fonction | Signature | Présente Sqi | Statut de certification / risque |
|---|---|---|---|
| `GivenName` | `GN -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `MaleSurname` | `SN -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `FemaleSurname` | `SN -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `PlSurname` | `SN -> NP` | YES | N8: accord pluriel courant est `Masc`; à justifier. |
| `FullName` | `GN -> SN -> NP` | YES | N8: `GivenName` est actuellement sélectionné au `Nom` dans le nom complet. |
| `UseLN` | `LN -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `PlainLN` | `LN -> NP` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |
| `InLN` | `LN -> Adv` | YES | N8: sélection `Acc` après `në` présente, à certifier pour Names. |
| `AdjLN` | `AP -> LN -> LN` | YES | Présente structurellement; certification linguistique spécifique non déduite de la compilation. |

## 3. Parité de `Paradigms` — gap distinct de la surface abstraite

### English (benchmark API)

Le snapshot fourni expose notamment des overloads publics permettant :

- `mkN` depuis une forme régulière, deux formes sing/pl, quatre principal parts, changement de genre, composition nominale;
- `mkN2` depuis `N`/`Str` avec `Prep` ou `Str`;
- `mkN3 : N -> Prep -> Prep -> N3`;
- `mkA` avec 1, 2 ou 4 formes selon régularité;
- `mkA2` depuis `A`/`Str` avec `Prep`/`Str`;
- `mkPN` depuis `Str`, `Str+Gender`, ou `N`;
- familles `mkGN`, `mkSN`, `mkLN`.

### Albanian courant

Le snapshot courant expose :

- `mkN : Str -> N` et `mkN : Str -> Str -> N`;
- `mkN2` avec `N`/`Str` + `Prep`/`Str`;
- `mkN3 : N -> Prep -> Prep -> N3`;
- `mkPN` invariant, avec genre, avec quatre formes de cas, ou depuis `N`;
- `mkLN` invariant / accord explicite / quatre formes de cas;
- `mkGN` invariant / genre / quatre formes de cas;
- `mkSN` invariant ou formes masc/fem/pl;
- `mkA : Str -> A` et `mkA : Str -> Str -> A`;
- `mkA2` avec `A`/`Str` + `Prep`/`Str`.

### Gaps de maturité API à fermer

1. constructeur nominal explicite à principal parts suffisantes pour irréguliers, sans passer par le dispatcher massif de `MorphoSqi`;
2. constructeur nominal avec `Gender` dépendant du nombre lorsque N2 est achevé;
3. constructeur adjectival explicite 2/3/4 formes + articulatedness, au lieu de forcer l’inférence;
4. constructeurs de proper names compatibles avec le futur `Gen`;
5. tests d’API montrant les erreurs/limites des smart paradigms.

**Règle:** on ne cherche pas à reproduire le nombre d’overloads d’English. On cherche une expressivité équivalente pour les classes réellement attestées en albanais.
