tests
testEqual02
	| one another |
	one := JELink value: 1 next: nil.
	another := JELink value: 1 next: nil.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another