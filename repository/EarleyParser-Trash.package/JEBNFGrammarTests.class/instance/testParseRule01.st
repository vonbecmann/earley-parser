tests
testParseRule01
	| forest |
	forest := grammar parse: '<E>::=<T>'.

	self deny: forest isEmpty.
	self assert: forest size equals: 46.
