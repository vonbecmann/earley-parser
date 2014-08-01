tests
testTerminalEquality
	self assert: (JETerminal for: #+) = (JETerminal for: #+).
	self assert: (JETerminal for: #+) hash = (JETerminal for: #+) hash