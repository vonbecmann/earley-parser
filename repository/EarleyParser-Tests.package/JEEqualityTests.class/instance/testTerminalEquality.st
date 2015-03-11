tests
testTerminalEquality
	self assert: (JETerminal for: #+) = (JETerminal for: #+).
	self assert: (JETerminal for: #+) hash = (JETerminal for: #+) hash.
	self deny: (JETerminal for: #+) = (JENonterminal for: #+).
	self deny: (JETerminal for: #+) hash = (JENonterminal for: #+) hash