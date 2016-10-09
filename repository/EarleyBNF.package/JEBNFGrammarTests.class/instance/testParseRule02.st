tests - parsing
testParseRule02
	tree := grammar parseTree: 'expression:expression,$+,term.'.
	self deny: tree isNil