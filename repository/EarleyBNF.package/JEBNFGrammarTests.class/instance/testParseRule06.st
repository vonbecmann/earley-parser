tests
testParseRule06
	| forest |
	forest := grammar parse: 'character=$$.'.
	
	self deny: forest isAmbiguous.
