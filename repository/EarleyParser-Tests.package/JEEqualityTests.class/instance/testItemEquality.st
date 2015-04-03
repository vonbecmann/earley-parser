tests
testItemEquality
	| one another chart |
	chart := JEChart number: 1.
	one := JEItem
		rule:
			(((JENonterminal for: #T)
				body:
					{(JENonterminal for: #T).
					(JETerminal for: #+).
					(JENonterminal for: #P)}) dotAt: 2)
		chart: chart.
	another := JEItem
		rule:
			(((JENonterminal for: #T)
				body:
					{(JENonterminal for: #T).
					(JETerminal for: #+).
					(JENonterminal for: #P)}) dotAt: 2)
		chart: chart.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash