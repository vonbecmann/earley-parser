tests
testDottedRuleEquality
	| one another rule |
	rule := (JENonterminal named: 'T')
					body:
						{(JENonterminal named: 'T'). 
						 (JETerminal character: $+).
						 (JENonterminal named: 'P')}.
	one := rule dotAt: 2.
	another := rule dotAt: 2.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash