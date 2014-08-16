tests
testItemEquality
	| one another |
	one := JEItem
		rule:
			(JERule
				left: (JENonterminal for: #T)
				right:
					{(JENonterminal for: #T).
					(JETerminal for: #+).
					(JENonterminal for: #P)})
		dotAt: 2
		itemsetAt: 2.
	another := JEItem
		rule:
			(JERule
				left: (JENonterminal for: #T)
				right:
					{(JENonterminal for: #T).
					(JETerminal for: #+).
					(JENonterminal for: #P)})
		dotAt: 2
		itemsetAt: 2.
	self assert: one = another.
	self assert: one hash = another hash