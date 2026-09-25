# Rapport d'alignement et décisions d'optimisation

## Résumé

Les 10 packs sont globalement compatibles sur la philosophie : baseline verte protégée, English comme benchmark, Albanian comme autorité linguistique, DRAFT-MAX atomique, compilation ≠ certification, placeholders = dette. Les non-alignements se situent surtout dans **l'état de décision**, **les types centraux** et **le vocabulaire de certification**.

## A. Baseline : 58/58 déclaré vs 56/58 archivé

**Non-alignement :** plusieurs packs présentent 58/58 + 52/52 comme baseline courante, tandis que l'archive de run fournie documente 56/58 + 52/52 puis un correctif sans rerun externe.

**Décision optimale :** conserver deux champs : `DECLARED_BASELINE` et `EVIDENCE_BACKED_RUN`. Ne réécrire aucun historique. Archiver le fresh run final pour fermer le gap.

## B. Genitive representation

**Non-alignement :** C6 marque Gen explicite comme décision ; C1 le gardait candidate ; C5 accepte Gen syntaxique mais laisse ouverte la représentation ; C9 garde le choix ouvert.

**Décision optimale :** Gen est distinct syntaxiquement, mais Dat/Gen restent syncrétiques dans la table du nom. Introduire `Case` 5 valeurs + `MorphCase` 4 valeurs et `morphCase Gen = MDat`. Cela conserve l'information sans dupliquer de fausses formes.

## C. Plural gender / ambigeneric nouns

**Non-alignement :** C6 l'avait accepté ; C1 le gardait candidate par prudence.

**Preuve consolidée :** les références fournies attestent explicitement des noms ambigénériques et un accord féminin au pluriel pour des noms masculins au singulier.

**Décision optimale :** `Noun.g : Number => Gender`, et `Agr` conserve le genre au pluriel.

## D. Neuter

**Non-alignement :** référence générale mentionne 3 genres, tandis que les leçons modernes décrivent le neutre comme presque éliminé/résiduel.

**Décision optimale :** ne pas ajouter `Neut` au core productif. Traiter les reliques lexicalisées explicitement jusqu'à preuve moderne d'un contraste productif Standard.

## E. Adjective case dimension

**Non-alignement :** code CURRENT stocke Case×Gender×Number ; C6 laissait le type exact ouvert.

**Preuve consolidée :** les références indiquent que les adjectifs fléchissent pour genre et nombre, jamais pour cas ; la *nyje* porte le conditionnement casuel/contextuel.

**Décision optimale :** `Adj.s : Gender => Number => Str`; articulatedness devient un type ; *nyje* séparée.

## F. Nyje duplicated logic

**Non-alignement :** `link_clitic`, `genitiveLink` et conditions locales créent plusieurs points de vérité.

**Décision optimale :** un service central *nyje* unique dans la couche ressource/nominale, utilisé par AP, génitif et autres consumers.

## G. Certification vocabulary fragmentation

**Non-alignement :** C2 `C6 CERTIFIED`, C5 `CERTIFIED`, C7/C8/C4 bare certified, C9 `gold_certified`, C10 interdit le mot nu.

**Décision optimale :** C10 est l'autorité globale. Les ladders locaux restent internes, mais tout rapport global les mappe à `*_reviewed_in_scope` / `gold_protected_in_scope`.

## H. Owner registry incomplete

**Non-alignement :** C10 disait Conversations 1–9 TBD alors que les 10 packs fournis donnent désormais leur scope.

**Décision optimale :** `04_WORKSTREAM_OWNERSHIP.md` remplit le registre canonique.

## I. Standard vs “Tosk/standard”

**Non-alignement :** certains docs MorphoDict disent « Tosk/standard » comme cible active ; C10 impose Standard Albanian.

**Décision optimale :** cible = Standard Albanian. Tosk est source majeure et comparison layer, pas synonyme du standard.

## J. Common API “not applicable”

**Non-alignement :** des matrices locales permettent N/A alors que C9 rappelle qu'une fonction common abstract doit être implémentée.

**Décision optimale :** pour une fonction common, produire un `equivalent`/neutralized realization ; `linguistically_not_applicable` ne signifie jamais « concrete manquante ».

## K. Past/Aorist semantics

**Non-alignement :** le current internal `Past` et certains mappings common past/aorist ne séparent pas clairement aspect/semantics.

**Décision optimale :** common past-simultaneous -> imperfect ; aorist = Albanian-specific/explicit strategy ; compound past anterior séparé. Renommer/refactorer l'interne au lieu de changer la sémantique common.

## L. VP/clitic parallel authorities

**Non-alignement :** current VP conserve `cl` / `subjcl` strings alors que C5/C4 exigent un état typé.

**Décision optimale :** typed cluster/realization plan = source de vérité ; legacy strings = shim temporaire unidirectionnel puis suppression.

## M. Preposition stranding / English-shaped syntax

**Non-alignement :** des helpers existent mais la preuve Albanian manque.

**Décision optimale :** pas de stranding canonique. Satisfaire les common functions par une stratégie Albanian (pied-piping/relative explicit/resumptive si prouvé). Garder `needs_review` pour les détails non prouvés.

## N. Giant MorphoSqi source-of-truth

**Non-alignement :** 734 classes existent mais la nature manual/generated/hybrid n'est pas globalement fixée.

**Décision optimale :** aucun refactor massif avant déclaration explicite de source-of-truth et round-trip reproductible. Préférer un modèle hybride/généré si les classes proviennent de données systématiques, tout en gardant l'API humaine dans `ParadigmsSqi`.

## O. Legacy project docs

**Non-alignement :** `docs/README.md`, `CURRENT_REPAIR_STATE.md` et status docs contiennent des états 54/54, 50/50 ou priorités de septembre 22–24 qui ne sont plus le routeur courant.

**Décision optimale :** préserver ces fichiers comme historique/evidence, mais le router canonique devient ce pack total. Les rapports de run restent autoritatifs pour le run exact qu'ils documentent.

## P. Compendium state machine absent de la première consolidation

**Non-alignement :** la v1 utilisait surtout R0–R4 et n'exposait pas S00–S11/W00–W08 comme protocole normatif.

**Décision optimale :** deux axes séparés. S00–S11 gouverne la légalité de progression ; R0–R4 mesure la maturité Albanian. Le plus bas S-gate non satisfait contrôle l'état.

## Q. Task header / route R01–R14

**Non-alignement :** le format de change local ne forçait pas le choix du route/workflow avant édition.

**Décision optimale :** Mandatory Task Header + route R01–R14 obligatoire avant tout patch ; route du premier unresolved decision.

## R. Patch envelope incomplet

**Non-alignement :** l'ancien template Albanian ne listait pas systématiquement symbols, abstract functions, categories, parameters, fields, hypotheses, patterns et predicted regression scope.

**Décision optimale :** `25_CHANGE_CONTROL_AND_DELIVERY.md` devient un superset du `AI_PATCH_PROTOCOL`; aucun champ Compendium requis ne peut être supprimé par un template local.

## S. Release semantics

**Non-alignement :** R4 pouvait être lu comme release candidate.

**Décision optimale :** `R4_candidate` ne vaut pas `S10`; S10 et S11 ne sont attribués qu'après évaluation `RG-*` du release gate Compendium.

## T. Authority order trop agrégé

**Non-alignement :** la v1 avait une liste unique mettant compiler avant target source pour certains claims.

**Décision optimale :** reprendre les hiérarchies domain-specific de `02_AUTHORITY_AND_PROVENANCE.md`: target source/producers-consumers gouvernent les representations; compiler gouverne build/type facts; preuves Albanian gouvernent les faits linguistiques.
