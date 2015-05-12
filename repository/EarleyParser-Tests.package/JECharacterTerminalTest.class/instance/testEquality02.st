tests
testEquality02
	| one another |
	one := JETerminal character: $+.
	another := JETerminal character: $*.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash