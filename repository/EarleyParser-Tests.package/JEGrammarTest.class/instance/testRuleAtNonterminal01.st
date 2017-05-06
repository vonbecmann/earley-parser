tests
testRuleAtNonterminal01
	grammar := JEGrammar 
						productionRules: #(#('A' #('A')) #('A' #()) #('A' #('letter x symbol'))) 
						representations: {('letter x symbol' -> (JETerminal character: $x))}.
			
	self assert: grammar rulesSize equals: 5.
	self
		assert: (grammar ruleAt: 'A'->1)
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}).
	self 
		assert: (grammar ruleAt: 'A'->2) 
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {}).
	self 
		assert: (grammar ruleAt: 'A'->3) 
		equals: (JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'letter x symbol')}).
	self 
		assert: (grammar ruleAt: 'letter x symbol'->1) 
		equals: (JEProductionRule head: (JENonterminal named: 'letter x symbol') body: {(JETerminal character: $x)})