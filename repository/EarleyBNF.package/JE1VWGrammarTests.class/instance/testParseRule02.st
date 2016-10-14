tests - parsing
testParseRule02
	tree := grammar parseTree: 'expression:expression,plus symbol,term.'.
	self deny: tree isNil