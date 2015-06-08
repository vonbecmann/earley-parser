tests
testParse6Xs
	| forest |
	forest := grammar parse: 'xxxxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 161.
