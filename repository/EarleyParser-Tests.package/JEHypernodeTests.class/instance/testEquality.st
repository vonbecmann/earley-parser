tests
testEquality
	| one another |
	one := JEHypernode value: (JENonterminal start startedAt: 1 andEndedAt: 4).
	another := JEHypernode value: (JENonterminal start startedAt: 1 andEndedAt: 4).
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash