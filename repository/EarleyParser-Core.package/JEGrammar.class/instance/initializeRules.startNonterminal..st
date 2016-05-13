initialization
initializeRules: aCollection startNonterminal: aNonterminal
	| index aRuleCollection |
	self initialize.
	startRule := startSymbol is: aNonterminal.
	aRuleCollection := OrderedCollection with: startRule.
	aRuleCollection addAll: aCollection.
	nonterminals := aRuleCollection collect: [ :each | each head ] as: Set.
	index := (nonterminals collect: [ :each | each -> (aRuleCollection findFirst: [ :rule | rule head = each ]) ])
		asDictionary.
	nonterminals := nonterminals sorted: [ :a :b | (index at: a) <= (index at: b) ].
	rules addAll: aRuleCollection.
	nonterminals
		do: [ :nonterminal | 
			alternatives
				at: nonterminal
				putAll: (rules select: [ :rule | rule head = nonterminal ] thenCollect: [ :rule | rule dotAtBeginning ]) ]