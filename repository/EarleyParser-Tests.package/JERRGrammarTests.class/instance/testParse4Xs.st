tests
testParse4Xs
	| forest |
	forest := grammar parse: 'xxxx'.
	self assert: forest isEmpty not.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 12