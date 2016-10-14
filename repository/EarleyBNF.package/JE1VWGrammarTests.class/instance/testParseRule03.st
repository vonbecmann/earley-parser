tests - parsing
testParseRule03
	tree := grammar parseTree: 'expression:expression,less than symbol,term.'.
	self deny: tree isNil