tests
testEquality02
	| one another |
	one := JERule head: (JENonterminal named: 'T') body: {}.
	another := JERule head: (JENonterminal named: 'T') body: {}.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash