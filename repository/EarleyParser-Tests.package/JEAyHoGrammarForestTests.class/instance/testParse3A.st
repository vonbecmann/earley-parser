tests
testParse3A
	forest := grammar parseForest: 'aaa'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4