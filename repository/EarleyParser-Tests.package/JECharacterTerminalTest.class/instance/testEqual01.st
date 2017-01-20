tests
testEqual01
	| one another |
	one := JECharacterTerminal character: $+.
	another := JECharacterTerminal character: $*.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash