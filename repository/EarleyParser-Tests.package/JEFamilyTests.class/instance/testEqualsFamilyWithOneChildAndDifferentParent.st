tests
testEqualsFamilyWithOneChildAndDifferentParent
	| one another |
	one := JEFamily with: firstPackedNode.
	one parent: parentNode.
	
	another := JEFamily with: firstPackedNode.


	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another