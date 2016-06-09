tests
testParse1X
	forest := grammar parse: 'x'.
	self deny: forest isAmbiguous