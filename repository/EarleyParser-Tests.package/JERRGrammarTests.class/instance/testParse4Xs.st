tests
testParse4Xs
	forest := grammar parse: 'xxxx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 27