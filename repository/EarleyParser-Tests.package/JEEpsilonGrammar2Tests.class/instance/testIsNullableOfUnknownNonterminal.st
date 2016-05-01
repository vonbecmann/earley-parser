tests
testIsNullableOfUnknownNonterminal
	self should: [ grammar isNullable: (JENonterminal named: 'F') ] raise: Error