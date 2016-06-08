tests
testParse7Xs
	forest := grammar parseForest: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 233.
	self assert: forest numberOfTrees equals: 132