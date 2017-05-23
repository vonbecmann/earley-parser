tests
testEquals02
	| terminal one another |
	terminal := JETerminalItem
		given: (JETerminal character: $J)
		word: $J
		startedAt: (JEColumn number: 2)
		andEndedAt: (JEColumn number: 3).
	one := JEPackedNode model: terminal.
	another := JEPackedNode model: terminal.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another