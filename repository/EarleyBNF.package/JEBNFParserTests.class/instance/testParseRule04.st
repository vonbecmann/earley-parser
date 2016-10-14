tests - parsing
testParseRule04
	tree := parser parse: 'expression:expression,greater than symbol,term.'.
	self deny: tree isNil