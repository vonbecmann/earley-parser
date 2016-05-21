tests
testRuleAtNonterminal01
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
			(JENonterminal named: 'A') is_epsilon}.
	self assert: grammar rulesSize equals: 3.
	self
		assert: (grammar ruleAt: 'A'->1)
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
	self 
		assert: (grammar ruleAt: 'A'->2) 
		equals: (JENonterminal named: 'A') is_epsilon