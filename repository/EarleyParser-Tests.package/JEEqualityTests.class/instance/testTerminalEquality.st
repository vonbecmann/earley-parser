tests
testTerminalEquality
	| one another |
	one := JETerminal for: #+.
	another := JETerminal for: #+.
	self assert: one = another.
	self assert: one hash = another hash.
	self deny: (JETerminal for: #+) = (JENonterminal for: #+).
	self deny: (JETerminal for: #+) hash = (JENonterminal for: #+) hash