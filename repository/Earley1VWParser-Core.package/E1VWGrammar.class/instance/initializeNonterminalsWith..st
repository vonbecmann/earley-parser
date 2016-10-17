initialization
initializeNonterminalsWith: aRuleCollection
	nonterminals addAll: (aRuleCollection collect: [ :each | each head ]).
	nonterminalSort := [ 
		| index |
		index := Dictionary with: startSymbol -> 0.
		nonterminals
			collect: [ :each | each -> (aRuleCollection findFirst: [ :rule | rule head = each ]) ]
			thenDo: [ :assoc | index add: assoc ].
		[ :a :b | (index at: a) < (index at: b) ] ] value