tests
testParseRule03
	| forest |
	forest := grammar parseForest: 'E=E,$<,T.'.
	
	self deny: forest isAmbiguous.
