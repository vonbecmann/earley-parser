tests
testDottedRuleEquality
	| one another |
	one := ((JENonterminal for: #T)
		body:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}) dotAt: 2.
	another := ((JENonterminal for: #T)
		body:
			{(JENonterminal for: #T).
			(JETerminal for: #+).
			(JENonterminal for: #P)}) dotAt: 2.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash