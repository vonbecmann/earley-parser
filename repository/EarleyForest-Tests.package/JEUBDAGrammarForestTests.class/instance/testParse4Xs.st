tests
testParse4Xs
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 56.
	self assert: forest numberOfTrees equals: 5