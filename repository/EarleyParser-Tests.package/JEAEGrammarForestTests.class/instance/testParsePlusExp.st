tests
testParsePlusExp
	forest := grammar parseForest: 'a+a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1