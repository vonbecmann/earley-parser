tests
testParseRule02
	| forest |
	forest := grammar parseForest: 'E=E,$+,T.'.
	self deny: forest isAmbiguous.
