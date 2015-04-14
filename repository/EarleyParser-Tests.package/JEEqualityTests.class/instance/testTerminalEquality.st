tests
testTerminalEquality
	| one another |
	one := JETerminal symbol: #+.
	another := JETerminal symbol: #+.
	self assert: one = another.
	self assert: one hash = another hash.
	self deny: (JETerminal symbol: #+) = (JENonterminal named: '+').
	self deny: (JETerminal symbol: #+) hash = (JENonterminal named: '+') hash