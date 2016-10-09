tests - parsing
testParseRule04
	tree := grammar parseTree: 'expression:expression,$>,term.'.
	self deny: tree isNil