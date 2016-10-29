tests
testIsPredicted
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body: {(JENonterminal named: 'F'). (JENonterminal named: 'P'). (JENonterminal named: 'G')}.

	self assert: rule dotAtBeginning isPredicted.
	self deny: (rule dotAt: 2) isPredicted.
	self deny: (rule dotAt: 3) isPredicted.
	self deny: rule dotAtEnd isPredicted