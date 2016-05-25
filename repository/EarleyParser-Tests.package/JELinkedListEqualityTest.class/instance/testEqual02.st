tests
testEqual02
	| one another |
	one := JELinkedList new.
	another := JELinkedList new.	
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another.
	
	