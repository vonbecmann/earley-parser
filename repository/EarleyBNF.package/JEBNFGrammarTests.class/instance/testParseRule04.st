tests
testParseRule04
	| forest |
	forest := grammar parseForest: 'E=E,$>,T.'.
	
	self deny: forest isAmbiguous.
