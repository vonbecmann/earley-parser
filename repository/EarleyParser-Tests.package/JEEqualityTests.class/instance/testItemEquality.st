tests
testItemEquality
	| one another chart rule |
	chart := JEChart number: 1.
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal symbol: #+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: chart.
	another := (rule dotAt: 2) startedAt: chart.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash