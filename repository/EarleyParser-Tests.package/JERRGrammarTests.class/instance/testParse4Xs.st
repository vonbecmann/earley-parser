tests
testParse4Xs
	| forest |
	forest := grammar parse: 'xxxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 9