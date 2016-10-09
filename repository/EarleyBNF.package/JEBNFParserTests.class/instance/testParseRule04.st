tests - parsing
testParseRule04
	tree := parser parse: 'expression:expression,$>,term.'.
	self deny: tree isNil