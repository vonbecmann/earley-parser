tests
testParse2A
	| forest |
	forest := grammar parse: 'aa'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 53.
	self assert: forest numberOfTrees equals: 6