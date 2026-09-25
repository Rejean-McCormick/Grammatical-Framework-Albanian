# Structural, Extend, Extra, Symbol, Markup, Documentation

## StructuralSqi

Closed-class inventory : chaque item doit avoir catégorie, gouvernement/valence, réalisation Standard et statut de revue. Les aliases exacts peuvent être `equivalent`; les adaptations Albanian doivent être testées.

## ExtendSqi

- toute fonction common `Extend` reçoit un verdict ;
- defaults hérités sont explicitement promus `equivalent` ou remplacés ;
- DRAFT-MAX n'est pas activé en bloc ;
- les helpers spécialisés restent derrière une interface minimale ;
- les chemins de focus/fronting/slash/existential/relative sont linguistic-reviewed avant gold.

## ExtraSqi

Réservé aux capacités albanaises qui ne correspondent pas au common abstract : aorist/marked moods, variantes de voix/non-fini, stratégies de focus, etc. Extra ne doit pas redéfinir le sens d'un constructeur common.

## Documentation/Symbol/Markup

La documentation doit refléter les signatures réellement livrées. Symbol/Markup suivent les contrats de catégories riches et ne simplifient pas les locks. Les smoke tests publics doivent utiliser les façades et non `ResSqi` directement.
