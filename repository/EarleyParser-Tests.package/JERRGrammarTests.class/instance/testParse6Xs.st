tests
testParse6Xs
	| forest |
	forest := grammar parse: 'xxxxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 18