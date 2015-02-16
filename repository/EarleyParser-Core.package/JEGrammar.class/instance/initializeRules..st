initialization
initializeRules: aCollection
	| nonterminals |
	self initialize.
	rules addAll: aCollection.
	nonterminals := rules collect: [ :each | each head ] as: Set.
	nonterminals do: [ :each | alternatives at: each put: (rules asArray select: [ :rule | rule head = each ]) ]