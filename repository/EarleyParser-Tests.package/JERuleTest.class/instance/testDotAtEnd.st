tests
testDotAtEnd
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $*).
			(JENonterminal named: 'P')}.
	self assert: rule dotAtEnd equals: (JEDottedRule given: rule withDotAt: 4)
	
