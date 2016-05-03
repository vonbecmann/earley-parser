tests
testParse2Xs
	forest := grammar parse: 'xx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 13