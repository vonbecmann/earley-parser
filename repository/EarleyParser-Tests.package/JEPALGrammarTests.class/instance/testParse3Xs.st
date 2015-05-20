tests
testParse3Xs
	| forest |
	forest := grammar parse: 'xxx'.
	self deny: forest isEmpty.
	self assert: forest size equals: 12.
	self assert: forest nodesSize equals: 8.
	self assert: forest edgesSize equals: 5
