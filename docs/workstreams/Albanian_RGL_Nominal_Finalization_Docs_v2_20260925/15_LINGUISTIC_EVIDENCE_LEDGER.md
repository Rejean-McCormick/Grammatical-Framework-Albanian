# Linguistic Evidence Ledger — nominal Albanian
> **Document version**: 2.0  
> **Document status**: SOURCE-DERIVED LEDGER  
> **Rule**: une paraphrase de ce fichier n’est jamais plus forte que sa source. Les golds Standard Albanian exigent une source applicable au Standard/Tosk ou une validation explicite du mainteneur/linguiste.  
## 1. Source archive

- `Albanian_ref(8).zip` SHA-256: `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc`

| Fichier | SHA-256 | Scope observé / usage |
|---|---|---|
| `Albanian_ref/Albanian.pdf` | `189526590748a3bc921d46cfbac907632376caf0cc9a27903844b191ec2812ad` | Présent dans l’archive mais non utilisé pour les affirmations v2 tant qu’il n’est pas inspecté séparément. |
| `Albanian_ref/Albanian_Complete_Grammar.html` | `39afeeb3d2fd90e70d41ba9bbcab1a27f64ea2addfec115ce8d784f0bd342a30` | Cadrage général, cas/définitude/nyje; statut du neutre discuté. |
| `Albanian_ref/Geg_Glossary_Master.html` | `38042fd683606fe52f855f6b2c1c2300e02f68ca3f782213b9744a06da82a3cf` | Référence lexicale/contextuelle; ne vaut pas règle grammaticale exhaustive. |
| `Albanian_ref/Lesson_10.html` | `3dbec8b21edb4091e329acc0e1a12ef4358955f6dfce67d3d877af10eae7f5fe` | Lesson 1: Tosk — source principale nom/adjectif/nyje. |
| `Albanian_ref/Lesson_20.html` | `bc4cea05b4b3af552ea79b4b04890369f85e14f42ab79ea56e2815266bcb3405` | Référence lexicale/contextuelle; ne vaut pas règle grammaticale exhaustive. |
| `Albanian_ref/Lesson_30.html` | `ad971ebf9d999e984397cb308730db1dedca50c7836b722db9465b61590d10f0` | Lesson 3: Tosk — démonstratifs, pronoms, possessifs. |
| `Albanian_ref/Lesson_40.html` | `983851068e33ad74927640e366f5ae2b60e1c65b294da7a342c74c5e708e1ace` | Référence lexicale/contextuelle; ne vaut pas règle grammaticale exhaustive. |
| `Albanian_ref/Lesson_50.html` | `636736e973486b2535f404434fc1f246b7f55c665cf1097dcd9efe2805445f5b` | Lesson 5: Geg — numéraux/ordinaux; **pas de promotion automatique en gold Standard**. |
| `Albanian_ref/Tosk_Dictionary_Master.html` | `fae38b11308bb8c3779fc84457fc3881218a2cd064283ae2412ddd8f561107f8` | Référence lexicale/contextuelle; ne vaut pas règle grammaticale exhaustive. |
| `Albanian_ref/Tosk_Glossary_Master.html` | `2574a6e86fa4bf1b891bbba0b85d33ba7eab13a9bbdef4660526ca8abf5b34df` | Référence lexicale/contextuelle; ne vaut pas règle grammaticale exhaustive. |

## 2. Evidence records

| Evidence ID | Locator exact | Scope | Fait soutenu | Décisions/tests autorisés | Limites |
|---|---|---|---|---|---|
| E-NOM-001 | `Lesson_10.html` → **2.1 Grammatical Gender** | Tosk / Modern Albanian description | système productif masc/fem; neutre résiduel; noms ambigénériques masc.sg/fem.pl avec accord correspondant | N2, tests d’accord ambigénérique | ne définit pas à lui seul l’inventaire exhaustif des neutres standards |
| E-NOM-002 | `Lesson_10.html` → **3 Noun Inflection**, 3.1, 3.2 | Tosk | nombre/cas/définitude et classes de déclinaison | N3, matrices nominales | extraction complète des principal parts reste à faire avant chaque paradigme certifié |
| E-NOM-003 | `Lesson_10.html` → **4 "Nyje" Particles** | Tosk | génitif requiert nyje; formes `e/i/të/së`; choix selon genre/nombre/cas/définitude du référent | N1/N4; `link_clitic`; Gen ≠ Dat syntaxiquement | la matrice GF doit être testée cellule par cellule; le simple inventaire des 4 formes ne suffit pas |
| E-NOM-004 | `Lesson_10.html` → **5.1 Articulated Adjectives** | Tosk | adjectifs articulés requièrent nyje; classes à 2/3/4 formes | N5, API `mkA` explicite | exemples ne prouvent pas tous les adjectifs |
| E-NOM-005 | `Lesson_10.html` → **5.2 Unarticulated Adjectives** | Tosk | non-articulés sans nyje; formations fréquentes du féminin/pluriel + variation | N5, smart paradigms limités | exceptions doivent avoir constructeurs explicites |
| E-NOM-006 | `Lesson_30.html` → **15.1 Distal Demonstratives** | Tosk | paradigme `ai/ajo` genre×nombre×cas; sert aussi de 3e personne | N6, tests démonstratifs/pronoms | Gen/Dat y sont syncrétiques en tableau |
| E-NOM-007 | `Lesson_30.html` → **15.2 Proximal Demonstratives** | Tosk | paradigme `ky/kjo` genre×nombre×cas | N6 | même limite de syncrétisme |
| E-NOM-008 | `Lesson_30.html` → **16 Personal Pronouns** | Tosk | P1/P2 non marquées en genre; cas distincts; P3 par démonstratifs distaux | N6 | weak forms sont section séparée |
| E-NOM-009 | `Lesson_30.html` → **18.1 Forms of Possessive Pronouns** | Tosk | paradigmes P1/P2; P3 `tij/saj/tyre` adjectivaux; nyje impliquée dans certaines formes | N6, possessifs | nécessite tests du possédé et du possesseur |
| E-NOM-010 | `Lesson_30.html` → **18.2 Placement of Possessive Pronouns** | Tosk | postnominal quasi général + nom défini; classe restreinte de parenté pré-nominale + nom indéfini; P3 jamais pré-nominal | N6/Q003 | liste exhaustive de parenté non donnée ici |
| E-NOM-011 | `Lesson_50.html` → **25.1 Cardinal Numbers** | **Geg lesson** | inventaire/formations cardinales présentées (`një`, `dy`, `...`, `njëzet`, `dyzet`, etc.) | comparaison de `NumeralSqi`; tests candidats | **ne certifie pas à lui seul la sortie Standard Albanian** |
| E-NOM-012 | `Lesson_50.html` → **25.2 Ordinal numbers** | **Geg lesson** | `parë` suppletif; 2–5 dérivés; 6–10 formes présentées comme adjectifs articulés avec nyje | révèle risque du `"i" ++ numeral`; tests candidats | corroboration standard requise avant gold |
| E-NOM-013 | `Albanian_Complete_Grammar.html` → **Structure of Albanian** | général | 5 cas; Gen/Dat morphologiquement identiques; définitude; nyje distingue Gen de Dat | N1, cadrage global | description générale, pas paradigme exhaustif |

## 3. Exemples attestés utilisables comme seeds de tests

- `fillimi i vjeshtës` — exemple de nyje génitive (Lesson 10 §4).
- `Republikës së Kosovës` — féminin sg oblique + `së` (Lesson 10 §4).
- adjectifs articulés: `bardhë`, `zi` et patterns explicités (Lesson 10 §5.1).
- adjectif non articulé: `normal` avec formes décrites (Lesson 10 §5.2).
- possessifs: `gjuha jonë`, `miku im`, `vëllai im`, `motra jotë`, `im vëlla`, `jotë motër` (Lesson 30 §18.2).
- paradigmes complets `ai/ajo` et `ky/kjo` (Lesson 30 §15).

## 4. Promotion rule

`SOURCE FACT` → `STANDARD-APPLICABLE` → `TEST EXPECTATION` → `GOLD/CERTIFIED` sont quatre promotions distinctes. Une source Geg peut informer l’architecture et signaler un bug probable sans franchir automatiquement la deuxième étape.
