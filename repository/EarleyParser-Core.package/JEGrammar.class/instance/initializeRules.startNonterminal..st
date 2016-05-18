initialization
initializeRules: aRuleCollection startNonterminal: aNonterminal
	self initialize.
	nonterminals addAll: (aRuleCollection collect: [ :each | each head ]).
	terminals addAll: (aRuleCollection flatCollect: [ :each | each body select: [ :symbol | symbol isTerminal ] ]).
	self initializeRules: (aRuleCollection copyWith: (startSymbol is: aNonterminal)).
	startRule := rules detect: [ :each | startSymbol == each head ].
	nonterminals
		do: [ :nonterminal | 
			alternatives
				at: nonterminal
				putAll: (rules select: [ :rule | rule head = nonterminal ] thenCollect: [ :rule | rule dotAtBeginning ]) ]