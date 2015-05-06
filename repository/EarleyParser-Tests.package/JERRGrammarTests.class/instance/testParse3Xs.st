tests
testParse3Xs
	| forest |
	forest := grammar parse: #(x x x).
	self assert: forest isEmpty not.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 9