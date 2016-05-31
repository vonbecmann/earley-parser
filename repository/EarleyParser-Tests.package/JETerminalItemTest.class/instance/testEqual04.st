tests
testEqual04
	| one another |
	one := JETerminalItem
		given: (JETerminal charset: ($a to: $z))
		word: $z
		startedAt: (JEChart number: 3)
		andEndedAt: (JEChart number: 12).
	another := JETerminalItem
		given: (JETerminal charset: ($a to: $z))
		word: $b
		startedAt: (JEChart number: 1)
		andEndedAt: (JEChart number: 12).
	
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another.
	