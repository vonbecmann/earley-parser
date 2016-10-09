tests - parsing
testParseEpsilonRule01
	tree := grammar parseTree: 'expression:.'.
	self deny: tree isNil