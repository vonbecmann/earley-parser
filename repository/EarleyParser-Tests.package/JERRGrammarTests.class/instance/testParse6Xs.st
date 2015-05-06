tests
testParse6Xs
	| forest |
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isEmpty not.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 18