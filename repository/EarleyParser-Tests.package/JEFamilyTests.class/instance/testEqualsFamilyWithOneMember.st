tests
testEqualsFamilyWithOneMember
	| one another |
	one := JEFamily with: aPackedItem.
	another := JEFamily with: aPackedItem.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another