tests
testDottedRuleEquality
	| one another |
	one := JEDottedRule
		given:
			((JENonterminal for: #T)
				body:
					{(JENonterminal for: #T).
					(JETerminal for: #+).
					(JENonterminal for: #P)})
		withDotAt: 2.
	another := JEDottedRule
		given:
			((JENonterminal for: #T)
				body:
					{(JENonterminal for: #T).
					(JETerminal for: #+).
					(JENonterminal for: #P)})
		withDotAt: 2.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash