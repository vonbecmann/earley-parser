tests
testParse2Xs
	| forest |
	forest := grammar parse: #(x x).
	self assert: forest isEmpty not.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 6