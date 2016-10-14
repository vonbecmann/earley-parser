tests - rule
testParseRule04
	tree := grammar parseTree: 'expression:expression,greater than symbol,term.'.
	self deny: tree isNil