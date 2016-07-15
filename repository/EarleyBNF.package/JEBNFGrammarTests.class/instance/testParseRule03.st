tests - parsing
testParseRule03
	tree := grammar parseTree: 'E=E,$<,T.'.
	self deny: tree isNil