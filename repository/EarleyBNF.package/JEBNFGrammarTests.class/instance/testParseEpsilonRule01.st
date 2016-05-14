tests
testParseEpsilonRule01
	| forest |
	forest := grammar parse: 'E=.'.

	self deny: forest isAmbiguous.

