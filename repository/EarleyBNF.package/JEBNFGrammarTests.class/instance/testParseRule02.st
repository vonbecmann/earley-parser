tests - parsing
testParseRule02
	tree := grammar parseTree: 'E=E,$+,T.'.
	self deny: tree isNil