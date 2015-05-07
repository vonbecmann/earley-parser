tests
testParseSimpleExp
	| forest |
	forest := grammar parse: 'a'.
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 5