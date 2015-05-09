tests
testParseRule03
	| forest |
	forest := grammar parse: '<E>=<E>''<''<T>'.
	
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 44