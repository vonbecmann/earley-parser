tests
testParse6Xs
	forest := grammar parse: 'xxxxxx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 41