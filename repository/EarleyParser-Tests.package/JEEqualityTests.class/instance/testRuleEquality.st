tests
testRuleEquality
	| one another |
	one := JERule
		left: (JENonterminal for: #T)
		right:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}.
	another := JERule
		left: (JENonterminal for: #T)
		right:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}.
	self assert: one = another.
	self assert: one hash = another hash