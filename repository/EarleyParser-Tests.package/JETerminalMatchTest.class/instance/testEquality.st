tests
testEquality
	| one another |
	one := JETerminalMatch this: $+ matches: (JETerminal character: $+).
	another := JETerminalMatch this: $+ matches: (JETerminal character: $+).
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash