tests
testIsActive
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body: {(JENonterminal named: 'F'). (JENonterminal named: 'P'). (JENonterminal named: 'G')}.

	self deny: rule dotAtBeginning isActive.
	self assert: (rule dotAt: 2) isActive.
	self assert: (rule dotAt: 3) isActive.
	self deny: rule dotAtEnd isActive