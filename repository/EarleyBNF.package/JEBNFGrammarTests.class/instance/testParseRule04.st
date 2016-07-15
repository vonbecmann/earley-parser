tests - parsing
testParseRule04
	tree := grammar parseTree: 'E=E,$>,T.'.
	self deny: tree isNil