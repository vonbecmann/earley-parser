tests
testParse7Xs
	forest := grammar parseForest: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 128.
	self assert: forest size equals: 115