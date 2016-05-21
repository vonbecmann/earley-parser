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
		assert: (grammar ruleAt: 'A'->1)
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'A')).
	self
		assert: (grammar ruleAt: 'A'->2)
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'C')).
	self
		assert: (grammar ruleAt: 'A'->3)
		equals: ((JENonterminal named: 'A') is: (JENonterminal named: 'D')).
	self 
		assert: (grammar ruleAt: 'A'->4) 
		equals: (JENonterminal named: 'A') is_epsilon.
	self 
		assert: (grammar ruleAt: 'C'->1) 
		equals: (JENonterminal named: 'C') is_epsilon.
	self 
		assert: (grammar ruleAt: 'D'->1) 
		equals: (JENonterminal named: 'D') is_epsilon