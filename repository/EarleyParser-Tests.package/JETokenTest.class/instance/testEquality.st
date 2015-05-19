tests
testEquality
	| one another |
	one := JEToken this: $+ matches: (JETerminal character: $+).
	another := JEToken this: $+ matches: (JETerminal character: $+).
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash