tests
testIsFinal
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body: {(JENonterminal named: 'F'). (JENonterminal named: 'P'). (JENonterminal named: 'G')}.

	self deny: rule dotAtBeginning isFinal.
	self deny: (rule dotAt: 2) isFinal.
	self deny: (rule dotAt: 3) isFinal.
	self assert: rule dotAtEnd isFinal