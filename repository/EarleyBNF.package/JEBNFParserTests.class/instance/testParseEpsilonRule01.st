tests - parsing
testParseEpsilonRule01
	tree := parser parse: 'E:.'.
	self deny: tree isNil