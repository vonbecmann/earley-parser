tests
testEquality
	| one another |
	one := JETerminal charSet: ($a to: $z).
	another := JETerminal charSet: ($a to: $z).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another