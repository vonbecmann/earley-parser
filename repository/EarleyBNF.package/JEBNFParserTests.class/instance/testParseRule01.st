tests - parsing
testParseRule01
	tree := parser parse: 'E:T.'.
	self deny: tree isNil