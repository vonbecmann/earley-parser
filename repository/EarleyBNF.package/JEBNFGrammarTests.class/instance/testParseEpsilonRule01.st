tests
testParseEpsilonRule01
	| forest |
	forest := grammar parseForest: 'E=.'.

	self deny: forest isAmbiguous.

