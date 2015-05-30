tests
testRuleEquality
	| one another |
	one := (JENonterminal named: 'T')
		body: (JENonterminal named: 'T'), (JETerminal character: $+), (JENonterminal named: 'P').
	another := (JENonterminal named: 'T')
		body: (JENonterminal named: 'T'), (JETerminal character: $+),	(JENonterminal named: 'P').
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash