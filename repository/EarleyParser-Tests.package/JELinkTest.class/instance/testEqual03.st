tests
testEqual03
	| next one another |
	next := JELink with: 2.
	one := JELink with: 1 next: next.
	another := JELink with: 1 next: next.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another