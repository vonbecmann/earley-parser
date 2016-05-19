tests
testParse2X
	forest := grammar parse: 'xx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 13.
	self assert: forest numberOfTrees equals: 1