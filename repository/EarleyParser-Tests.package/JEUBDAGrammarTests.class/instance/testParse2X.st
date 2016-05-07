tests
testParse2X
	forest := grammar parse: 'xx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 15.
	self assert: forest numberOfTrees equals: 1