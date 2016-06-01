tests
testEqual01
	| one another |
	one := JELink value: 1.
	another := JELink value: 1.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another