tests
testEquality
	| one another |
	one := JETerminal character: $+.
	another := JETerminal character: $+.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash