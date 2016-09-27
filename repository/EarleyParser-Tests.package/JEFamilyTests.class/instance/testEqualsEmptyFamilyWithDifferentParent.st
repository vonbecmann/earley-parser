tests
testEqualsEmptyFamilyWithDifferentParent
	| one another |
	one := JEFamily empty.
	one parent: parentNode.
	
	another := JEFamily empty.

	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another