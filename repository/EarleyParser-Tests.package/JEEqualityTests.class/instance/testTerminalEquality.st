tests
testTerminalEquality
	| one another |
	one := JETerminal character: $+.
	another := JETerminal character: $+.
	self assert: one = another.
	self assert: one hash = another hash.
	self deny: (JETerminal character: $+) = (JENonterminal named: '+').
	self deny: (JETerminal character: $+) hash = (JENonterminal named: '+') hash