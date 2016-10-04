tests
testSizeWithOneItem
	| one firstChart rule |
	self assert: chart isEmpty.
	firstChart := JEChart number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: firstChart.
	chart add: one.
	self assert: chart size equals: 1