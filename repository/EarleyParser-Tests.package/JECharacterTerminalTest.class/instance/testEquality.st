tests
testEquality
	| one another |
	one := JETerminal character: $+.
	another := JETerminal character: $+.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash