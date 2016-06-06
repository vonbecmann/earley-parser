tests
testEquality
	| one another |
	one := JEHypernode model: 'start'.
	another := JEHypernode model: 'start'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another