# Migration notes — checkpoint 1 -> checkpoint 2

## API VP

Ancien état :

```gf
cl : Str ;
subjcl : Str ;
```

Nouvel état :

```gf
clitics : CliticCluster ;
preverb : Str ;
voice : Voice ;
voiceUse : VoiceUse ;
perfAux : PerfectAux ;
```

Utiliser `addAccCliticVP`, `addDatCliticVP`, `addReflCliticVP`, `addPreverbVP` dans `ClauseSqiRes`. `appendClitic` n'est qu'un shim temporaire.

## Construction de `Verb`

Tout record `Verb`/`V` construit à la main doit fournir :

```gf
voice = ActiveVoice ;
voiceUse = PlainVoice ;
perfAux = AuxKam
```

ou utiliser les marqueurs non-actifs/passifs/réflexifs après avoir fourni les tables morphologiques exactes.

## Non-actif

`markNonActiveV`, `markPassiveV`, `markReflexiveV` changent la représentation de voix et l'auxiliaire parfait. Ils ne dérivent pas les formes synthétiques présent/imparfait à partir de l'actif.

## Génitif

Tout tableau explicite indexé par `Case` doit maintenant couvrir `Gen`. Dans les constructeurs compacts du checkpoint, `Gen` peut partager provisoirement la morphologie de `Dat`, mais le cas doit rester distinct dans le type et dans les sélections syntaxiques.

## Genre nominal

`Noun.g` / `CN.g` est une table `Number => Gender`. Les anciens appels `cn.g` doivent devenir `cn.g ! n` à l'endroit où le nombre est connu.
