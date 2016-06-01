initialization
initializeRules: aRuleCollection startNonterminal: aNonterminal
	self initialize.
	self initializeNonterminalsWith: aRuleCollection.
	terminals
		addAll:
			(aRuleCollection
				flatCollect: [ :each | each body select: [ :symbol | symbol isTerminal ] ]).
	self
		initializeRules: (aRuleCollection copyWith: (startSymbol is: aNonterminal)).
	startRule := rules detect: [ :each | startSymbol == each head ].
	self initializeAlternatives.
	self initializeDottedAlternatives