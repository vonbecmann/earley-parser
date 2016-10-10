tests - parsing
testParseRule03
	tree := grammar parseTree: 'expression:expression,$<,term.'.
	self deny: tree isNil