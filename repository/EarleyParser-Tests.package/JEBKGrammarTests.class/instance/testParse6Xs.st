tests
testParse6Xs
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 64.
	self assert: forest size equals: 105