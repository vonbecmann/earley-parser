tests
testEquality01
	| one another |
	one := JETerminal charset: '[\w]'.
	another := JETerminal charset: '[\W]'.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash