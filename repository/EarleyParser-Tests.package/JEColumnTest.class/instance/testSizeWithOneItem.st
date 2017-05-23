tests
testSizeWithOneItem
	| one first rule |
	self assert: column isEmpty.
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	column add: one.
	self assert: column size equals: 1