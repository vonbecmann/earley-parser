initialization
initializeNonterminalsWith: aRuleCollection
	nonterminals addAll: (aRuleCollection collect: [ :each | each head ]).
	nonterminalSort := [ 
		| index |
		index := Dictionary with: startSymbol -> 0.
		nonterminals
			do: [ :each | 
				index
					add: each -> (aRuleCollection findFirst: [ :rule | rule head = each ]) ].
		[ :a :b | (index at: a) < (index at: b) ] ] value