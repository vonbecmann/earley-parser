tests
testParse1A
	forest := grammar parse: 'a'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4