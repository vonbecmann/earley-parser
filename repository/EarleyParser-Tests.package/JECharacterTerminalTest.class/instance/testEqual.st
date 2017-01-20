tests
testEqual
	| one another |
	one := JECharacterTerminal character: $+.
	another := JECharacterTerminal character: $+.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash