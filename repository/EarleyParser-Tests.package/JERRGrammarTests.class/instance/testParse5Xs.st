tests
testParse5Xs
	forest := grammar parse: 'xxxxx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 34