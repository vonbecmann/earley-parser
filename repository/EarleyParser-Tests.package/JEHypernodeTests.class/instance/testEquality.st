tests
testEquality
	| one another |
	one := JENonterminal start startedAt: 1 andEndedAt: 4.
	another := JENonterminal start startedAt: 1 andEndedAt: 4.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash