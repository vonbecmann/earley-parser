accessing
ruleAt: anAssociation
	"an association like
		aNamedNonterminal -> index   : the rule at index for a named nonterminal
	example:
		'A' -> 1  : the rule at 1 for nonterminal named 'A'
		
	returns the rule definition at position index for a named nonterminal"

	| nonterminal nonterminalAlternatives |
	nonterminal := JENonterminal named: anAssociation key.
	nonterminalAlternatives := alternatives at: nonterminal ifAbsent: [ self unknowNonterminal: nonterminal ].
	^ (nonterminalAlternatives
		at: anAssociation value
		ifAbsent: [ self unknowRuleAt: nonterminal at: anAssociation value ]) asDefined