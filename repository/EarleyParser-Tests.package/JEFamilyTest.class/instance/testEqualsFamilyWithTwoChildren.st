tests
testEqualsFamilyWithTwoChildren
	| one another |
	one := JEFamily with: firstPackedNode with: secondPackedNode.
	another := JEFamily with: firstPackedNode with: secondPackedNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another