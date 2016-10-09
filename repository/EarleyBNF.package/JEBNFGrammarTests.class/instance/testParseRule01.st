tests - parsing
testParseRule01
	tree := grammar parseTree: 'expression:term.'.
	self deny: tree isNil