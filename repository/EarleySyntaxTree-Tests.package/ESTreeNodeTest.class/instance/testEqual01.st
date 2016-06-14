tests
testEqual01
	| one another |
	one := ESTreeNode model: 'A'.
	another := ESTreeNode model: 'A'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another