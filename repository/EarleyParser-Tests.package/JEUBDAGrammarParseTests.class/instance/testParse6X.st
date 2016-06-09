tests
testParse6X
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous