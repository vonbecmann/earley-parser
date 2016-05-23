tests
testAsString01
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JENonterminal named: 'P').
			(JENonterminal named: 'G')}.
	self assert: (rule dotAt: 1) asString equals: 'T = *F, P, G.'.
	self assert: rule dotAtBeginning asString equals: 'T = *F, P, G.'