tests
testParse5Xs
	| forest |
	forest := grammar parse: 'xxxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 82.
