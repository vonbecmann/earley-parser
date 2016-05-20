tests
testParse2X
	forest := grammar parse: 'xx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4.
	self assert: forest size equals: 37