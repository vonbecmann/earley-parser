tests
testParsePlusExp
	| forest |
	forest := grammar parse: 'a+a'.
	self deny: forest isEmpty.
	self assert: forest size equals: 13.
