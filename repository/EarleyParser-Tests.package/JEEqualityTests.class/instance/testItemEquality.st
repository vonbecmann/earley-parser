tests
testItemEquality
	| one another chart |
	chart := JEChart number: 1.
	one := (((JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal symbol: #+).
			(JENonterminal named: 'P')}) dotAt: 2) startedAt: chart.
	another := (((JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal symbol: #+).
			(JENonterminal named: 'P')}) dotAt: 2) startedAt: chart.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash