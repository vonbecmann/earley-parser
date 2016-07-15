tests - parsing
testParseEpsilonRule01
	tree := grammar parseTree: 'E=.'.
	self deny: tree isNil