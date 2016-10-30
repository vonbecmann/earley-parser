tests
testParse3Xs
	forest := grammar parseForest: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 8