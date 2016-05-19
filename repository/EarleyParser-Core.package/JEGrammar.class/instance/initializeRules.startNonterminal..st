initialization
initializeRules: aRuleCollection startNonterminal: aNonterminal
	self initialize.
	nonterminals addAll: (aRuleCollection collect: [ :each | each head ]).
	nonterminals do: [ :each | nonterminalIndex add: each -> (aRuleCollection findFirst: [ :rule | rule head = each ]) ].
	terminals addAll: (aRuleCollection flatCollect: [ :each | each body select: [ :symbol | symbol isTerminal ] ]).
	self initializeRules: (aRuleCollection copyWith: (startSymbol is: aNonterminal)).
	startRule := rules detect: [ :each | startSymbol == each head ].
	nonterminals
		do: [ :nonterminal | 
			alternatives at: nonterminal putAll: ((rules select: [ :rule | rule head = nonterminal ]) sorted: ruleSort).
			dottedAlternatives
				at: nonterminal
				putAll: (rules select: [ :rule | rule head = nonterminal ] thenCollect: [ :rule | rule dotAtBeginning ]) ]