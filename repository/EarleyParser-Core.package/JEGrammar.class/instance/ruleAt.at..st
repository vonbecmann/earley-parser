accessing
ruleAt: aNamedNonterminal at: index
	"the rule definition at position index for a named nonterminal"

	| nonterminal nonterminalAlternatives |
	nonterminal := JENonterminal named: aNamedNonterminal.
	nonterminalAlternatives := alternatives at: nonterminal ifAbsent: [ self unknowNonterminal: nonterminal ].
	^ (nonterminalAlternatives at: index ifAbsent: [ self unknowRuleAt: nonterminal at: index ]) asDefined