tests
testParseMixedExp
	forest := grammar parseForest: 'a+a*a+a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1