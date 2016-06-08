tests
testParse5Xs
	forest := grammar parseForest: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 32.
	self assert: forest size equals: 88