tests
testNullables
	self assert: (grammar isNullable: (JENonterminal named: 'S')).
	self assert: (grammar isNullable: (JENonterminal named: 'A')).
	self assert: (grammar isNullable: (JENonterminal named: 'E'))