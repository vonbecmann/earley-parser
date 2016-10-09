tests - parsing
testParseRule03
	tree := parser parse: 'expression:expression,$<,term.'.
	self deny: tree isNil