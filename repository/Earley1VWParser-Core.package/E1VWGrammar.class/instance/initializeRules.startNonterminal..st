initialization
initializeRules: aRuleCollection startNonterminal: aNonterminal
	self initialize.
	self initializeNonterminalsWith: aRuleCollection.
	terminals
		addAll:
			(aRuleCollection
				flatCollect: [ :each | each body select: [ :symbol | symbol isTerminal ] ]).
	self
		initializeRules: (aRuleCollection copyWith: (JEProductionRule head: startSymbol body: {aNonterminal})).
	startRule := (rules at: startSymbol) first.
	self initializeAlternatives.
	self initializePredictedAlternatives.
	self initializeDottedRules.
	self initializeRepresentationRules.