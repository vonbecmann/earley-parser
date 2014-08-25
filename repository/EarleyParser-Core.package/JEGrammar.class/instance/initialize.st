initialization
initialize
	nonterminals := rules collect: [ :each | each head ] as: Set.
	startSymbol := rules first head.
	terminals := (rules flatCollect: [ :each | each body ] as: Set)
		reject: [ :each | nonterminals includes: each ]
		thenCollect: [ :each | each ].
	alternatives := Dictionary new.
	nonterminals do: [ :each | alternatives at: each put: (rules asArray select: [ :rule | rule head = each ]) ]