tests
testEqualsFamilyWithTwoMembers
	| one another |
	one := JEFamily with: aPackedItem with: anotherPackedItem.
	another := JEFamily with: aPackedItem with: anotherPackedItem.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another