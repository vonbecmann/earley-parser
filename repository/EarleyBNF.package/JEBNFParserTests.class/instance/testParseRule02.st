tests - parsing
testParseRule02
	tree := parser parse: 'expression:expression,plus symbol,term.'.
	self deny: tree isNil