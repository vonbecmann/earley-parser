initialization
initializeRules: aCollection startNonterminal: aNonterminal
	| index |
	self initialize.
	rules add: (startSymbol is: aNonterminal).
	rules addAll: aCollection.
	nonterminals := rules collect: [ :each | each head ] as: Set.
	index := (nonterminals collect: [ :each | each -> (rules findFirst: [ :rule | rule head = each ]) ]) asDictionary.
	nonterminals := nonterminals sorted: [ :a :b | (index at: a) <= (index at: b) ].
	nonterminals
		do: [ :nonterminal | 
			alternatives
				at: nonterminal
				putAll: (rules select: [ :rule | rule head = nonterminal ] thenCollect: [ :rule | rule dotAtBeginning ]) ]