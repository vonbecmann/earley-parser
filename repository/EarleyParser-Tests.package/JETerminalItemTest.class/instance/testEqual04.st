tests
testEqual04
	| one another |
	one := JETerminalItem
		given: (JETerminal charSet: ($a to: $z))
		word: $z
		startedAt: (JEItemSet number: 3)
		andEndedAt: (JEItemSet number: 12).
	another := JETerminalItem
		given: (JETerminal charSet: ($a to: $z))
		word: $b
		startedAt: (JEItemSet number: 1)
		andEndedAt: (JEItemSet number: 12).
	
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another.
	