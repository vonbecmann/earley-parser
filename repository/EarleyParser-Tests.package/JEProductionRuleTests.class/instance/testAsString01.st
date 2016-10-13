tests
testAsString01
	self
		assert:
			(JEProductionRule
				head: (JENonterminal named: 'A')
				body:
					{	(JENonterminal named: 'B'). 
						(JENonterminal named: 'C').
						(JENonterminal named: 'D')	}) asString
		equals: 'A = B, C, D.'