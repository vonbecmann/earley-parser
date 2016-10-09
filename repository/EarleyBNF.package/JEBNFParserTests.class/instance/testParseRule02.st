tests - parsing
testParseRule02
	tree := parser parse: 'expression:expression,$+,term.'.
	self deny: tree isNil