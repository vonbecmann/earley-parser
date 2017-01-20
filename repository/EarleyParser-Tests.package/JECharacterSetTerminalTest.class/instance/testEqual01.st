tests
testEqual01
	| one another |
	one := JECharacterSetTerminal charSet: ($a to: $z).
	another := JECharacterSetTerminal charSet: ($A to: $Z).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another