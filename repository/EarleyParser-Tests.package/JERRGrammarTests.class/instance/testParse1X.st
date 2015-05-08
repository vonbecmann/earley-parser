tests
testParse1X
	| forest |
	forest := grammar parse: 'x'.
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 3