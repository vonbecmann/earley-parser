tests
testParse3Xs
	| forest |
	forest := grammar parse: 'xxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 6