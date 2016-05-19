tests
testParse6Xs
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 87.
	self assert: forest numberOfTrees equals: 64