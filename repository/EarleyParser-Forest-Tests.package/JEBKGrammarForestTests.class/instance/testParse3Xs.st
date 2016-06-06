tests
testParse3Xs
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 8.
	self assert: forest size equals: 54