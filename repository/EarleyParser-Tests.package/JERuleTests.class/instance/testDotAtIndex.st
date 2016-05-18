tests
testDotAtIndex
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $*).
			(JENonterminal named: 'P')}.
	self assert: rule dotAtBeginning equals: (JEDottedRule given: rule withDotAt: 1).
	self assert: (rule dotAt: 1) equals: (JEDottedRule given: rule withDotAt: 1).
	self assert: (rule dotAt: 2) equals: (JEDottedRule given: rule withDotAt: 2).
	self assert: (rule dotAt: 3) equals: (JEDottedRule given: rule withDotAt: 3).
	self assert: rule dotAtEnd equals: (JEDottedRule given: rule withDotAt: 4).
	self assert: (rule dotAt: 4) equals: (JEDottedRule given: rule withDotAt: 4)