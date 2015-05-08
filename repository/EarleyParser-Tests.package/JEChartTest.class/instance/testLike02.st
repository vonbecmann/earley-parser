tests-accessing
testLike02
	| one firstChart rule |
	firstChart := JEChart number: 1.
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: firstChart.
	chart add: one.
	self assert: (chart like: one) equals: one.
	self assert: (chart like: one) == (chart like: one)