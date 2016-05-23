tests
testEquality01
	| one another |
	one := JETerminal charset: ($a to: $z).
	another := JETerminal charset: ($A to: $Z).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another