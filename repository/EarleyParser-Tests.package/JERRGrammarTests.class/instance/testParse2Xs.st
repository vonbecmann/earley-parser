tests
testParse2Xs
	| forest |
	forest := grammar parse: 'xx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 7.
