tests
testEqual01
	| one another |
	one := JECharacterSetComplementTerminal of: ($a to: $z).
	another := JECharacterSetComplementTerminal of: ($A to: $Z).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another