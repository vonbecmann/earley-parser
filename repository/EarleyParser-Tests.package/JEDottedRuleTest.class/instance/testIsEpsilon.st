tests
testIsEpsilon
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: {}.

	self assert: rule dotAtBeginning isEpsilon.
	self assert: rule dotAtEnd isEpsilon