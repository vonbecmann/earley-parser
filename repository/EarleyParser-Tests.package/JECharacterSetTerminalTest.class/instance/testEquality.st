tests
testEquality
	| one another |
	one := JETerminal charset: '[\w]'.
	another := JETerminal charset: '[\w]'.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash