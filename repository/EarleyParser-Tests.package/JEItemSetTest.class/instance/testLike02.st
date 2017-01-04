tests
testLike02
	| one first rule |
	first := JEItemSet number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	itemSet add: one.
	self assert: (itemSet like: one) equals: one.
	self assert: (itemSet like: one) == (itemSet like: one)