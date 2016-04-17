tests-accessing
testLike
	| one firstChart rule |
	firstChart := JEChart number: 1.
	rule := (JENonterminal named: 'T')
		is: (JENonterminal named: 'T') , (JETerminal character: $+) , (JENonterminal named: 'P').
	one := (rule dotAt: 2) startedAt: firstChart.
	self assert: (chart like: one) equals: nil