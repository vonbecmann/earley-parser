tests
testEqualsFamilyWithTwoMembers
	| one another |
	one := JEFamily with: 1 with: 'A'.
	another := JEFamily with: 1 with: 'A'.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another