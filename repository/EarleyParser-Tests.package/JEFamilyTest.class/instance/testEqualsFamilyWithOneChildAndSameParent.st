tests
testEqualsFamilyWithOneChildAndSameParent
	| one another |
	one := JEFamily with: firstPackedNode.
	one parent: parentNode.
	
	another := JEFamily with: firstPackedNode.
	another parent: parentNode.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another