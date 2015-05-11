tests
testItemEquality03
	| one another chart rule |
	chart := JEChart number: 1.
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := ((rule dotAt: 2) startedAt: chart).
	another := ((rule dotAt: 2) startedAt: chart) endChart: (JEChart number: 4).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash