tests
testIsRepresentation
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: {(JETerminal character: $t)}.
	self assert: rule isRepresentation