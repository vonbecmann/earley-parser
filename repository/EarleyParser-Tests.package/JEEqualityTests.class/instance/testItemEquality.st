tests
testItemEquality
	| one another chart |
	chart := JEChart number: 1.
	one := (((JENonterminal for: #T)
		body:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}) dotAt: 2) startedAt: chart.
	another := (((JENonterminal for: #T)
		body:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}) dotAt: 2) startedAt: chart.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash