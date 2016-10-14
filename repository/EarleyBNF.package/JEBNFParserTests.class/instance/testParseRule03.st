tests - parsing
testParseRule03
	tree := parser parse: 'expression:expression,less than symbol,term.'.
	self deny: tree isNil