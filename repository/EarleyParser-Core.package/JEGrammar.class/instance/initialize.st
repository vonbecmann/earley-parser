initialization
initialize
	nonterminals := rules collect: [ :each | each head ] as: Set.
	startSymbol := rules first head.
	alternatives := Dictionary new.
	nonterminals do: [ :each | alternatives at: each put: (rules asArray select: [ :rule | rule head = each ]) ]