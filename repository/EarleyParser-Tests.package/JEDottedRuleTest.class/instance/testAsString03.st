tests
testAsString03
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JENonterminal named: 'P').
			(JENonterminal named: 'G')}.
	self assert: (rule dotAt: 3) asString equals: 'T: F, P, ·G.'