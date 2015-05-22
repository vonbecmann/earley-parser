tests
testParse4Xs
	| forest |
	forest := grammar parse: 'xxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 60.
