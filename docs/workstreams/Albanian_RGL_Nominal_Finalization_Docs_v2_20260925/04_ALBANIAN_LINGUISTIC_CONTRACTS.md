# Contrats linguistiques albanais du domaine nominal

> **Document version**: 2.0  
> **Document status**: NORMATIVE  
> **Baseline evidence authority**: `19_BASELINE_EVIDENCE_LOCK.md`  
> **Source/provenance authority**: `02_SOURCE_LOCK_AND_AUTHORITY.md`  

> **Projet**: Albanian RGL — domaine nominal complet  
> **Date de verrouillage documentaire**: 2026-09-25  
> **Baseline d’intégration fournie par le mainteneur**: `albanian-s02-green-20260925`  
> **GF**: 3.12  
> **GF Wordbench**: 1.3.4  
> **Gate d’intégration**: voir `19_BASELINE_EVIDENCE_LOCK.md`  
> **Certification linguistique globale**: non établie  
> **Principe**: compilation verte ≠ certification linguistique.  

## 1. Portée

Ce fichier contient uniquement les faits actuellement soutenus par les références albanaises fournies et leurs conséquences minimales pour le design. Lorsqu’une conséquence GF est une inférence d’ingénierie, elle est explicitement étiquetée **DESIGN CONSEQUENCE**.

## 2. Noms

### NOM-LING-001 — genre grammatical

**FACT** — La référence décrit le nom moderne albanais comme généralement masculin ou féminin ; le statut résiduel du neutre est discuté et les anciens neutres ont largement été réanalysés.

**DESIGN CONSEQUENCE** — `Masc/Fem` restent le système productif par défaut. Ne pas ajouter un troisième genre productif sans nouvelle preuve ciblée.

### NOM-LING-002 — noms ambigénériques

**FACT** — Certains noms sont masculins au singulier et féminins au pluriel ; l’accord suit le genre correspondant au nombre.

**DESIGN CONSEQUENCE** — le genre du nom doit pouvoir dépendre du nombre et le genre ne doit pas être effacé dans l’accord pluriel.

### NOM-LING-003 — dimensions flexionnelles

**FACT** — Les noms s’infléchissent pour nombre, cas et définitude.

**FACT** — Les références distinguent cinq cas : nominatif, accusatif, génitif, datif, ablatif ; génitif et datif sont morphologiquement identiques dans les paradigmes présentés.

**DESIGN CONSEQUENCE** — conserver cinq contextes grammaticaux ; autoriser la même chaîne Gen/Dat lorsque la morphologie est syncrétique.

### NOM-LING-004 — définitude

**FACT** — La définitude nominale est suffixée/postposée dans les paradigmes, p.ex. `zog` / `zogu`.

**DESIGN CONSEQUENCE** — `Species` appartient à la morphologie nominale ; `DefArt` n’a pas besoin de produire un mot pré-nominal s’il déclenche la forme définie du nom.

### NOM-LING-005 — pluriels

**FACT** — Les références décrivent plusieurs relations productives ou fréquentes entre radical singulier et radical pluriel : identité, `-e`, `-ë`, `-a`, `-nj/-inj`, `-ër` et alternances consonantiques, plus des irréguliers.

**DESIGN CONSEQUENCE** — la RGL finale doit fournir des paradigmes par classe/principal parts, pas supposer une seule règle de pluriel.

## 3. *Nyje*

### NOM-LING-010 — statut

**FACT** — La *nyje* est obligatoire avec le génitif et avec les adjectifs articulés ; elle relie le nom tête à un modificateur.

### NOM-LING-011 — inventaire

**FACT** — Les formes décrites sont `i`, `e`, `të`, `së`.

### NOM-LING-012 — conditionnement

**FACT** — La sélection dépend du genre, nombre, cas et définitude du référent/tête dans les règles données par la référence.

**DESIGN CONSEQUENCE** — une opération centrale reçoit le contexte grammatical complet ; ni l’adjectif ni `PossNP` ne doivent choisir une *nyje* en regardant la chaîne déjà réalisée.

## 4. Adjectifs

### NOM-LING-020 — accord

**FACT** — Les adjectifs sont décrits comme fléchis en genre et nombre, pas en cas ; la marque de définitude adjectivale est rare et associée à des contextes spécifiques.

**DESIGN CONSEQUENCE** — distinguer la morphologie lexicale de l’adjectif du marquage contextuel porté par la *nyje*.

### NOM-LING-021 — classes articulée / non articulée

**FACT** — Deux classes sont explicitement décrites : adjectifs qui requièrent une *nyje*, et adjectifs qui n’en requièrent pas.

**DESIGN CONSEQUENCE** — cette propriété doit être stockée comme métadonnée lexicale/structurelle, jamais déduite du premier caractère de la forme.

### NOM-LING-022 — variations de paradigme

**FACT** — Les adjectifs articulés peuvent avoir 2, 3 ou 4 formes distinctes selon genre/nombre ; les non articulés possèdent leurs propres formations de féminin/pluriel avec exceptions.

**DESIGN CONSEQUENCE** — un constructeur « une chaîne → toutes les cellules » n’est qu’un smart paradigm ; une API explicite doit exister pour les irréguliers.

## 5. Démonstratifs et pronoms

### NOM-LING-030 — démonstratifs

**FACT** — `ai/ajo` (distal) et `ky/kjo` (proximal) possèdent des paradigmes de genre/nombre/cas ; les formes 3e personne utilisent le distal.

**DESIGN CONSEQUENCE** — `Quant/IQuant/Pron` doivent conserver ces traits jusqu’à réalisation.

### NOM-LING-031 — pronoms personnels

**FACT** — 1re/2e personnes ne sont pas marquées en genre dans les tableaux fournis ; les formes de cas diffèrent et les formes faibles sont un sous-système distinct.

**DESIGN CONSEQUENCE** — le genre d’accord par défaut de certaines personnes doit être traité comme convention GF, pas comme flexion pronominale attestée.

## 6. Possessifs

### NOM-LING-040 — structure

**FACT** — Les possessifs proviennent historiquement de *nyje* + pronom et présentent un paradigme dépendant des traits du possédé et du possesseur.

### NOM-LING-041 — placement ordinaire

**FACT** — Les possessifs suivent presque toujours le nom ; le nom est alors défini, p.ex. `gjuha jonë`, `miku im`.

### NOM-LING-042 — placement exceptionnel

**FACT** — Un petit groupe de termes de parenté autorise le possessif pré-nominal ; le nom est alors indéfini. La 3e personne ne précède jamais le nom selon la source fournie.

**DESIGN CONSEQUENCE** — le placement ne doit pas être un simple choix stylistique global. L’exception pré-nominale exige une condition lexicale/syntaxique explicitement documentée avant implémentation.

## 7. Numéraux

### NOM-LING-050 — cardinaux

**SOURCE FACT (Geg Lesson 5; Standard applicability not yet certified)** — La source décrit les formations 1–10, 11–19, dizaines, centaines, mille, million et les irrégularités lexicales (`njëzet`, `dyzet`, etc.).

### NOM-LING-051 — ordinaux

**SOURCE FACT (Geg Lesson 5; Standard applicability not yet certified)** — `parë` est suppletif ; 2e–5e ont une formation propre ; 6e–10e utilisent des formes apparentées/identiques aux cardinaux et sont décrits comme adjectifs articulés nécessitant une *nyje*.

**DESIGN CONSEQUENCE** — le comportement courant signale un besoin de revue; `OrdNumeral` ne doit pas rester définitivement « `i` + numeral » si cela contredit les formes attestées ; les ordinaux doivent disposer de paradigmes/lexèmes corrects.

### NOM-LING-052 — gouvernement après numéral

**GAP** — Les extraits utilisés ici ne suffisent pas à établir toutes les règles de forme nominale/cas/accord gouvernées par les nombres.

**RULE** — ne pas introduire de `NumeralGov` spécifique à l’albanais avant preuve ciblée ; conserver cependant l’architecture ouverte à cette extension.

## 8. Noms propres

### NOM-LING-060

**GAP** — Le corpus fourni contient de nombreux noms propres en contexte, mais cette première passe n’établit pas encore une règle exhaustive de déclinaison des anthroponymes/toponymes en Standard Albanian.

**RULE** — garder `NamesSqi` case-aware ; ne pas certifier l’invariance d’un nom à partir d’un simple constructeur `Str`.

## 9. Standard/Tosk/Geg

Le chantier vise la RGL albanaise standard. Les leçons fournies combinent Tosk et Geg. Un exemple Geg peut servir de preuve historique/contrastive, mais ne devient pas automatiquement sortie Standard Albanian. Toute fonctionnalité dialectale doit être marquée comme telle ou justifiée par une source standard.

## 10. Evidence granularity

Les IDs `E-NOM-*`, hashes, sections exactes et scopes dialectaux sont normatifs dans `15_LINGUISTIC_EVIDENCE_LEDGER.md`. Ce fichier reste la synthèse des contrats linguistiques, pas le locator primaire.
