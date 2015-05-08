tests
testParse5Xs
	| forest |
	forest := grammar parse: 'xxxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 15