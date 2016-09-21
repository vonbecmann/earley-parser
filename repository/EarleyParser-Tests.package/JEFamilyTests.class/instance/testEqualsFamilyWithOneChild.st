tests
testEqualsFamilyWithOneChild
	| one another |
	one := JEFamily with: firstPackedNode.
	another := JEFamily with: firstPackedNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another