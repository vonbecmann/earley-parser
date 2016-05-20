tests
testParse1X
	forest := grammar parse: 'x'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2.
	self assert: forest size equals: 20