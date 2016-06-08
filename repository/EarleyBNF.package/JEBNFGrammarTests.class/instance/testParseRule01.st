tests
testParseRule01
	| forest |
	forest := grammar parseForest: 'E=T.'.

	self deny: forest isAmbiguous.

