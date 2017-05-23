tests
testEqual03
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
		andEndedAt: (JEColumn number: 1).
	
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another.
	