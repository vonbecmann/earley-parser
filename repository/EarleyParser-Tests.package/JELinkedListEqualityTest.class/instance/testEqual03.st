tests
testEqual03
	| one another |
	one := JELinkedList with: 2 with: 3.
	another := JELinkedList with: 2 with: 3.	
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another.
	
	