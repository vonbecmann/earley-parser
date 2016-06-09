tests
testParse3X
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous