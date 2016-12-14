tests
testRuleAtNonterminal02
	grammar := JEGrammar
		basedOn:
			{{(JENonterminal named: 'A'). {(JENonterminal named: 'A')}}.
			 {(JENonterminal named: 'A'). {(JENonterminal named: 'C')}}.
			 {(JENonterminal named: 'A'). {(JENonterminal named: 'D')}}.
			 {(JENonterminal named: 'A'). {}}.
			 {(JENonterminal named: 'C'). {}}.
			 {(JENonterminal named: 'D'). {}}}.
	self assert: grammar rulesSize equals: 7.
	self
		assert: (grammar ruleAt: 'A'->1)
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}).
	self
		assert: (grammar ruleAt: 'A'->2)
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'C')}).
	self
		assert: (grammar ruleAt: 'A'->3)
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'D')}).
	self 
		assert: (grammar ruleAt: 'A'->4) 
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {}).
	self 
		assert: (grammar ruleAt: 'C'->1) 
		equals: (JEProductionRule head: (JENonterminal named: 'C') body: {}).
	self 
		assert: (grammar ruleAt: 'D'->1) 
		equals: (JEProductionRule head: (JENonterminal named: 'D') body: {})