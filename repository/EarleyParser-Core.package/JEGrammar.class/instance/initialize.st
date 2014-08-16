initialization
initialize
	alternatives := Dictionary new.
	nonterminals do: [ :each | alternatives at: each put: (rules asArray select: [ :rule | rule left = each ]) ]