tests
testParse2A
	| forest |
	forest := grammar parse: 'aa'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 51.
	self assert: forest numberOfTrees equals: 6