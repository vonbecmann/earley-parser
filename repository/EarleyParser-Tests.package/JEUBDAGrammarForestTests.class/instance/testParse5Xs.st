tests
testParse5Xs
	forest := grammar parseForest: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 14.