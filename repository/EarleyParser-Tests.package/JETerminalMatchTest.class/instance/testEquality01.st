tests
testEquality01
	| first second one another |
	first := JEChart number: 1.
	second := JEChart number: 2.
	one := JETerminalMatch
		this: $*
		matches: (JETerminal character: $*)
		between: first
		and: second.
	another := JETerminalMatch
		this: $A
		matches: (JETerminal character: $A)
		between: first
		and: second.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash