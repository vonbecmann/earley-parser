tests
testEquality
	| one another |
	one := JETerminal regex: '[\w]'.
	another := JETerminal regex: '[\w]'.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash