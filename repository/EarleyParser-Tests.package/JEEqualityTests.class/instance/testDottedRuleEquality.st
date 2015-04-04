tests
testDottedRuleEquality
	| one another |
	one := ((JENonterminal named: #T)
		body:
			{(JENonterminal named: #T).
			(JETerminal for: #+).
			(JENonterminal named: #P)}) dotAt: 2.
	another := ((JENonterminal named: #T)
		body:
			{(JENonterminal named: #T).
			(JETerminal for: #+).
			(JENonterminal named: #P)}) dotAt: 2.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash