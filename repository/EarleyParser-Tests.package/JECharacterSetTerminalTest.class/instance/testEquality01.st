tests
testEquality01
	| one another |
	one := JETerminal regex: '[\w]'.
	another := JETerminal regex: '[\W]'.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash