tests - parsing
testParseRule01
	tree := parser parse: 'expression:term.'.
	self deny: tree isNil