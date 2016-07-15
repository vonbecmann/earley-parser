tests - parsing
testParseRule01
	tree := grammar parseTree: 'E=T.'.
	self deny: tree isNil