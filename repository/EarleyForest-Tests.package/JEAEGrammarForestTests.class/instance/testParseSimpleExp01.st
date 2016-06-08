tests
testParseSimpleExp01
	forest := grammar parseForest: 'a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1