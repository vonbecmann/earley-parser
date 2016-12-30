tests
testRuleAtNonterminal01
	grammar := JEGrammar
		basedOn:
			{(JENonterminal named: 'A') -> {(JENonterminal named: 'A')}.
			 (JENonterminal named: 'A') -> {}}.
	self assert: grammar rulesSize equals: 3.
	self
		assert: (grammar ruleAt: 'A'->1)
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}).
	self 
		assert: (grammar ruleAt: 'A'->2) 
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {})