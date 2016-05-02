tests
testParse3Xs
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest size equals: 32