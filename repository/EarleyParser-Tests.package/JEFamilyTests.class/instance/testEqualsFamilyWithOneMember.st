tests
testEqualsFamilyWithOneMember
	| one another |
	one := JEFamily with: 1.
	another := JEFamily with: 1.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another