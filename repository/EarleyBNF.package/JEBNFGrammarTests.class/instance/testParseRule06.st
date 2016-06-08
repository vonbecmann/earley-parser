tests
testParseRule06
	| forest |
	forest := grammar parseForest: 'character=$$.'.
	
	self deny: forest isAmbiguous.
