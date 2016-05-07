tests
testParse6Xs
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 161.
	self assert: forest numberOfTrees equals: 42