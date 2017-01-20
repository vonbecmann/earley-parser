tests
testEqual
	| one another |
	one := JECharacterSetTerminal charSet: ($a to: $z).
	another := JECharacterSetTerminal charSet: ($a to: $z).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another