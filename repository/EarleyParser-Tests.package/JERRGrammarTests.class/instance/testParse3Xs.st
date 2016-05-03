tests
testParse3Xs
	forest := grammar parse: 'xxx'.
	self deny: forest isAmbiguous.
	self assert: forest size equals: 20