initialization
initializeRules: aCollection
	| nonterminals |
	self initialize.
	rules addAll: aCollection.
	rules addFirst: (startSymbol body: {(rules first head)}).
	nonterminals := rules collect: [ :each | each head ] as: Set.
	nonterminals
		do: [ :nonterminal | 
			alternatives
				at: nonterminal
				put: ((rules select: [ :rule | rule head = nonterminal ]) collect: [ :rule | rule dotAtBeginning ] as: Array) ]