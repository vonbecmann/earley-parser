tests
testLike02
	| one first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	column add: one.
	self assert: (column like: one) equals: one.
	self assert: (column like: one) == (column like: one)