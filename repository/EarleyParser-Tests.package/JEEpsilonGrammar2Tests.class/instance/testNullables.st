tests
testNullables
	self assert: (grammar isNullable: (JENonterminal named: 'A')).
	self assert: (grammar isNullable: (JENonterminal named: 'B')).
	self assert: (grammar isNullable: (JENonterminal named: 'C')).
	self assert: (grammar isNullable: (JENonterminal named: 'D')).
	self assert: (grammar isNullable: (JENonterminal named: 'E'))