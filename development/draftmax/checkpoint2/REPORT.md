# Albanian DRAFT-MAX — checkpoint 2 / stabilization overlay (2026-09-24)

## Statut

Ce checkpoint poursuit le checkpoint 1 fourni par l'utilisateur. Il complète le noyau de représentation demandé pour les clitiques, la voix, l'auxiliaire des temps composés et la propagation du génitif **dans les fichiers présents dans l'overlay**.

Il ne doit pas être présenté comme une release GF compilée : le snapshot complet cible (`20260923-194448` + overlay de complétion linguistique du 2026-09-24) n'est pas inclus dans les fichiers fournis et l'exécutable `gf` n'est pas installé dans l'environnement. La validation incluse est donc statique et structurelle.

## Changements réalisés

### 1. `CliticCluster` typé à la place de `VP.cl` / `VP.subjcl`

`ResSqi.VP` transporte maintenant :

- `clitics : CliticCluster` avec slots `dat`, `acc`, `refl` et un slot `extra` réservé à la compatibilité ;
- `preverb : Str` pour les particules comme `po` / `vetë` ;
- plus aucune chaîne plate `cl : Str` ou `subjcl : Str`.

`ClauseSqiRes` fournit des opérations par rôle (`addAccCliticVP`, `addDatCliticVP`, `addReflCliticVP`) et conserve `appendClitic` comme shim de migration pour les clients du checkpoint 1.

### 2. Fusion centralisée des clitiques faibles

`ResSqi.fuseWeakClitics` centralise l'ordre datif > accusatif/réflexif et les fusions principales, notamment :

- `më + e -> ma`, `më + i -> m'i`, `më + u -> m'u` ;
- `të + e -> ta`, `të + i -> t'i`, `të + u -> t'u` ;
- `i + e/i -> ia`, `i + u -> iu` ;
- `ju + e/i -> jua` ;
- `u + e/i -> ua`.

La contraction de la particule subjonctive `të` avec un cluster immédiatement adjacent est maintenant possédée par `teWithClitics`, au lieu d'être préassemblée dans chaque constructeur.

### 3. Ordre des clitiques au subjonctif, futur et impératif

`ClauseSqiRes` possède désormais les têtes :

- `subjHead` pour `të + clitique(s)` et les contractions ;
- `negSubjHead` pour `të mos + clitique(s)` ;
- `impHead` pour l'impératif positif/négatif ;
- `finiteHead` pour la réalisation indicative centralisée.

L'impératif positif utilise l'ordre proclitique, qui est une option standard sûre. L'enclise plurielle avant `-ni` n'est pas fabriquée par concaténation : elle exige une segmentation morphologique fiable du paradigme impératif.

### 4. Voix et choix d'auxiliaire typés

Nouveaux paramètres :

- `Voice = ActiveVoice | NonActiveVoice` ;
- `VoiceUse = PlainVoice | PassiveVoice | ReflexiveVoice` ;
- `PerfectAux = AuxKam | AuxJam`.

`Verb` et `VP` transportent explicitement `voice`, `voiceUse`, `perfAux`.

Les verbes actifs construits normalement prennent `AuxKam`. Les opérations `markNonActiveVerb`, `markPassiveVerb`, `markReflexiveVerb` et leurs homologues de paradigme/VP sélectionnent `AuxJam`.

`ClauseSqiRes` utilise `perfectAuxFinite` / `perfectAuxSubj`, donc la sélection `kam` vs `jam` est propagée aux temps antérieurs sans dupliquer la logique dans les consommateurs.

### 5. Non-actif synthétique : représentation sans invention morphologique

Le `u` du non-actif à l'aoriste est injecté dans le slot réflexif du cluster par `addVoiceClitic`, ce qui permet sa combinaison avec un datif dans le même mécanisme de fusion.

Les formes non-actives synthétiques du présent/imparfait ne sont **pas** générées heuristiquement à partir d'une forme active. Les marqueurs de voix supposent que les tables finies correspondantes ont été fournies par un paradigme exact (`irregVFull` ou futur constructeur morphologique dédié). Cette contrainte évite de produire des formes linguistiquement fausses.

### 6. Propagation du génitif dans l'overlay fourni

Les branches `Gen` ont été ajoutées/corrigées dans :

- `ResSqi.mkPron` ;
- `ResSqi.mkQuant` ;
- `ParadigmsSqi.mkNFull`, `mkPN`, `mkLN`, `mkGN`, `mkIP`, `mkQuant`, `mkDet`, `mkPron` ;
- `StructuralSqiNominal` (`IDet`, `IQuant`, `IP`) ;
- `SymbolSqi` ;
- `NounSqi.PossNP`, qui demande maintenant explicitement `np.s ! Gen`.

Comme dans le checkpoint 1, lorsque la morphologie de génitif n'a pas de forme distincte dans le constructeur compact, elle est provisoirement alimentée par la forme dative ; la distinction de cas reste néanmoins explicite dans le type.

### 7. Genre au pluriel : corrections de propagation

- `[CN].g` dans `ConjunctionSqi` est maintenant `Number => Gender` ;
- le genre des CN coordonnés est combiné par nombre ;
- `SymbolSqi.agr3` conserve le genre fourni au pluriel (`GPl g`) ;
- `SymbolSqi` sélectionne `cn.g ! n` au lieu de l'ancien `cn.g` scalaire ;
- `ParadigmsSqi.mkNFull` et `mkGN` remplissent correctement les tables de genre dépendantes du nombre.

## Validation incluse

`validation/static_validate.py` contrôle notamment :

- présence du système à cinq cas ;
- absence de `VP.cl : Str` et de `subjcl` ;
- présence de la fusion des clitiques et des contractions de `të` ;
- état typé de voix et d'auxiliaire ;
- propagation du génitif dans les constructeurs touchés ;
- propagation du genre pluriel ;
- équilibre des délimiteurs dans les dix fichiers GF.

Résultat actuel : **36/36 contrôles statiques passent**. Voir `STATIC_VALIDATION.txt`.

## Ce qui reste nécessaire avant de déclarer une release compilée

1. Appliquer l'overlay au **snapshot complet exact** mentionné dans le manifeste et lancer `gf -make` sur les modules RGL pertinents.
2. Migrer tout consommateur hors des dix fichiers fournis qui construit directement un `VP`/`VPSlash` ou accède encore à `.cl` / `.subjcl` vers `clitics`, `preverb`, `voice`, `voiceUse`, `perfAux`.
3. Faire l'audit lexical/morphologique des noms ambigénériques sur le lexique/Morpho complet et appliquer `setNounGender` aux classes/entrées concernées.
4. Ajouter/valider les paradigmes synthétiques non-actifs du présent et de l'imparfait dans la couche morphologique complète. Le checkpoint fournit la représentation et la réalisation, mais n'invente pas ces paradigmes absents de l'overlay.
5. Ajouter des tests GF de linéarisation couvrant clitiques simples/doubles, futur, subjonctif, impératif, parfait actif/non-actif, relatif `cili` et noms ambigénériques.

Ces points ne peuvent pas être certifiés depuis l'archive actuelle parce que le dépôt cible complet et le compilateur GF ne sont pas disponibles dans l'environnement.
