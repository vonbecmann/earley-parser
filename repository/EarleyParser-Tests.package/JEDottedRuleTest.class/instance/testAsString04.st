tests
testAsString04
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JENonterminal named: 'P').
			(JENonterminal named: 'G')}.
	self assert: (rule dotAt: 4) asString equals: 'T: F, P, G·.'.
	self assert: rule dotAtEnd asString equals: 'T: F, P, G·.'