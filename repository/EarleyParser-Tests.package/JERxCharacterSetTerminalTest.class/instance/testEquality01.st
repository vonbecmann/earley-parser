tests
testEquality01
	| one another |
	one := JETerminal rxCharSet: '[\w]'.
	another := JETerminal rxCharSet: '[\W]'.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another