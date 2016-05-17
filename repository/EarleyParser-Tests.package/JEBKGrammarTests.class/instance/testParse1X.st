tests
testParse1X
	forest := grammar parse: 'x'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 18.
	self assert: forest numberOfTrees equals: 2