tests
testEquality
	| first second one another |
	first := JEChart number: 1.
	second := JEChart number: 2.
	one := JETerminalMatch
		this: $+
		matches: (JETerminal character: $+)
		between: first
		and: second.
	another := JETerminalMatch
		this: $+
		matches: (JETerminal character: $+)
		between: first
		and: second.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash