tests
testParse1A
	forest := grammar parseForest: 'a'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4