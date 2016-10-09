tests - parsing
testParseEpsilonRule01
	tree := parser parse: 'expression:.'.
	self deny: tree isNil