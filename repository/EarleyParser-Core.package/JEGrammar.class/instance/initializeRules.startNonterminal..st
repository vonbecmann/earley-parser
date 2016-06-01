initialization
initializeRules: aRuleCollection startNonterminal: aNonterminal
	self initialize.
	nonterminals addAll: (aRuleCollection collect: [ :each | each head ]).
	nonterminalSort := [ 
		| index |
		index := Dictionary with: startSymbol -> 0.
		nonterminals do: [ :each | index add: each -> (aRuleCollection findFirst: [ :rule | rule head = each ]) ].
		[ :a :b | (index at: a) < (index at: b) ] ] value.
	terminals addAll: (aRuleCollection flatCollect: [ :each | each body select: [ :symbol | symbol isTerminal ] ]).
	self initializeRules: (aRuleCollection copyWith: (startSymbol is: aNonterminal)).
	startRule := rules detect: [ :each | startSymbol == each head ].
	(nonterminals sorted: nonterminalSort)
		do: [ :nonterminal | 
			((rules select: [ :rule | rule head = nonterminal ]) sorted: ruleSort)
				withIndexDo: [ :each :index | alternatives at: (JEPair first: nonterminal second: index) put: each ].
			dottedAlternatives
				at: nonterminal
				putAll: (rules select: [ :rule | rule head = nonterminal ] thenCollect: [ :rule | rule dotAtBeginning ]) ]