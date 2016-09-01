accessing
ruleAt: anAssociation
	"an association like
		aNamedNonterminal -> index   : the rule at index for a named nonterminal
	example:
		'A' -> 1  : the rule at 1 for nonterminal named 'A'
		
	returns the rule definition at position index for a named nonterminal"

	| nonterminal key |
	nonterminal := JENonterminal named: anAssociation key.
	nonterminals like: nonterminal ifAbsent: [ self unknowNonterminal: nonterminal ].
	key := OrderedPair first: nonterminal second: anAssociation value.
	^ (alternatives 
			at: key 
			ifAbsent: [ self unknowRuleAt: key ]) asDefined