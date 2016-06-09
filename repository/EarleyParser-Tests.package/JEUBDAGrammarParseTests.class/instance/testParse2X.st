tests
testParse2X
	forest := grammar parse: 'xx'.
	self deny: forest isAmbiguous