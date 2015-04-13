initialization
initializeRules: aCollection
	| nonterminals |
	self initialize.
	rules addAll: aCollection.
	rules addFirst: (startSymbol body: {(rules first head)}).
	nonterminals := rules collect: [ :each | each head ] as: Set.
	nonterminals do: [ :each | alternatives at: each put: (rules asArray select: [ :rule | rule head = each ]) ]