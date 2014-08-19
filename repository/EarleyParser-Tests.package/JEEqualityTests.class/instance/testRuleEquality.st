tests
testRuleEquality
	| one another |
	one := (JENonterminal for: #T)
		body:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}.
	another := (JENonterminal for: #T)
		body:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}.
	self assert: one = another.
	self assert: one hash = another hash