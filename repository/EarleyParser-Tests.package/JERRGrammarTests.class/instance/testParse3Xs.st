tests
testParse3Xs
	| forest |
	forest := grammar parse: 'xxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 27.
