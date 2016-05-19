tests
testParsePlusExp
	forest := grammar parse: 'a+a'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 23.
	self assert: forest numberOfTrees equals: 1