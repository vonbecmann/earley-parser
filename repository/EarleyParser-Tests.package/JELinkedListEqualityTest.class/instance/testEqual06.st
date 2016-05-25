tests
testEqual06
	| one another |
	one := JELinkedList with: 2 with: 3.
	another := JELinkedList with: 2.	
	
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another.
	
	