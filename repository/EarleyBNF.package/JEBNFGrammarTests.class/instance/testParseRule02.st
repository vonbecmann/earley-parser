tests
testParseRule02
	| forest |
	forest := grammar parse: 'E=E,"+",T.'.
	self deny: forest isAmbiguous.
