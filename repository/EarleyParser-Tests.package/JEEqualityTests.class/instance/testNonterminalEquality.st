tests
testNonterminalEquality
	self assert: (JENonterminal for: #E) = (JENonterminal for: #E).
	self assert: (JENonterminal for: #E) hash = (JENonterminal for: #E) hash.
	self deny: (JENonterminal for: #E) = (JETerminal for: #E).
	self deny: (JENonterminal for: #E) hash = (JETerminal for: #E) hash.