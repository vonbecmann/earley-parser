tests
testRuleAtNonterminal02
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
			((JENonterminal named: 'A') is: (JENonterminal named: 'C')).
			((JENonterminal named: 'A') is: (JENonterminal named: 'D')).
			((JENonterminal named: 'A') is_epsilon).
			((JENonterminal named: 'C') is_epsilon).
			((JENonterminal named: 'D') is_epsilon)}.
	self assert: grammar rulesSize equals: 7.
	self 
		assert: (grammar ruleAt: 'A') 
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
	self
		assert: (grammar ruleAt: 'A' at: 1)
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
	self
		assert: (grammar ruleAt: 'A' at: 2)
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'C')).
	self
		assert: (grammar ruleAt: 'A' at: 3)
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'D')).
	self 
		assert: (grammar ruleAt: 'A' at: 4) 
		equals: (JENonterminal named: 'A') is_epsilon.
	self 
		assert: (grammar ruleAt: 'C') 
		equals: (JENonterminal named: 'C') is_epsilon.
	self 
		assert: (grammar ruleAt: 'D') 
		equals: (JENonterminal named: 'D') is_epsilon