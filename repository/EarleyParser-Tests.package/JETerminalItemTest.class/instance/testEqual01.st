tests
testEqual01
	| one another |
	one := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	another := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another.
	