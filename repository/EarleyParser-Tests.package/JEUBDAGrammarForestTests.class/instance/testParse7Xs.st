tests
testParse7Xs
	forest := grammar parseForest: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 132.
