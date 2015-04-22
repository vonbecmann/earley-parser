tests
testNodeEquality02
	| rule startChart endChart one another |
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal symbol: #+).
			(JENonterminal named: 'P')}.
	startChart := JEChart number: 1.
	endChart := JEChart number: 4.
	one := JEHNode labeled: (rule dotAt: 2) from: startChart to: endChart.
	another := JEHNode labeled: (rule dotAt: 2) from: startChart to: endChart.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash