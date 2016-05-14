tests
testParseRule01
	| forest |
	forest := grammar parse: 'E=T.'.

	self deny: forest isAmbiguous.

