tests
testNullableOfUnknownNonterminal
	self should: [ grammar isNullable: (JENonterminal named: 'Z') ] raise: Error