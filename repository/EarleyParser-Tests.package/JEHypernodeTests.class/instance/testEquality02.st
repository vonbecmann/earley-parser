tests
testEquality02
	| rule first fourth one another |
	rule := (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	one := JEHypernode value: ((rule dotAt: 2) startedAt: first andEndedAt: fourth).
	another := JEHypernode value: ((rule dotAt: 2) startedAt: first andEndedAt: fourth).
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash