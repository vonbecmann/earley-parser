tests
testParse2A
	forest := grammar parse: 'aa'.
	
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 6