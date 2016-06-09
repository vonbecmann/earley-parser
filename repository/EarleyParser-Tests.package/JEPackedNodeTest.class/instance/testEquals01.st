tests
testEquals01
	| dottedRule one another |
	dottedRule := (JERule head: (JENonterminal named: 'A') body: #()) dotAtEnd.
	
	one := JEPackedNode model: (dottedRule startedAt: (JEChart number: 10)).
	another := JEPackedNode model: (dottedRule startedAt: (JEChart number: 10)).
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another