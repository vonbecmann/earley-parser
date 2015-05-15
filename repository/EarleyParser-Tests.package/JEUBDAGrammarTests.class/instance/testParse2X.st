tests
testParse2X
	| forest |
	forest := grammar parse: 'xx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 1.
	self assert: forest first size equals: 6