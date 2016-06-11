tests
testParse1X
	forest := grammar parse: 'x'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1