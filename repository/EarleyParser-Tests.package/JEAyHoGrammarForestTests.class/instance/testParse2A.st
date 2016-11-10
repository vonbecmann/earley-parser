tests
testParse2A
	forest := grammar parseForest: 'aa'.
	
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 6