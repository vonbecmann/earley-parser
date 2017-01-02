tests
testEquality
	| one another |
	one := JETerminal rxCharSet: '[\w]'.
	another := JETerminal rxCharSet: '[\w]'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another