tests
testEqual
	| one another |
	one := JECharacterSetComplementTerminal of: ($a to: $z).
	another := JECharacterSetComplementTerminal of: ($a to: $z).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another