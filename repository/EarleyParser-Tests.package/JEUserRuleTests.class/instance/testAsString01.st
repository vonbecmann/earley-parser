tests
testAsString01
	self
		assert: ((JENonterminal named: 'A') is: (JENonterminal named: 'B') , (JENonterminal named: 'C') , (JENonterminal named: 'D')) asString
		equals: 'A = B, C, D.'