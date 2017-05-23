tests
testEqual02
	| one another |
	one := JETerminalItem
		given: (JETerminal charSet: ($a to: $z))
		word: $z
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	another := JETerminalItem
		given: (JETerminal charSet: ($a to: $z))
		word: $b
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another.
	