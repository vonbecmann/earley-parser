tests
testParse4Xs
	forest := grammar parseForest: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 16.
	self assert: forest size equals: 67