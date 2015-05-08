tests
testParse2X
	| forest |
	forest := grammar parse: #(x x).
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 7