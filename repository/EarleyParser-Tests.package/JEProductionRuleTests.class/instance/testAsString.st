tests
testAsString
	self
		assert: (JEProductionRule head: (JENonterminal named: 'A') body: #()) asString
		equals: 'A: .'