tests
testNonterminalEquality
	self assert: (JENonterminal for: #E) = (JENonterminal for: #E).
	self assert: (JENonterminal for: #E) hash = (JENonterminal for: #E) hash