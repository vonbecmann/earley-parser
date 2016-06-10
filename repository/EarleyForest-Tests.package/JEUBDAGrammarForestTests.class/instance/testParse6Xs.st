tests
testParse6Xs
	forest := grammar parseForest: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 42.
	self assert: forest size equals: 149