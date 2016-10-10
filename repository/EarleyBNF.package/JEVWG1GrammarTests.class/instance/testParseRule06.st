tests - parsing
testParseRule06
	tree := grammar parseTree: 'character:$$.'.
	self deny: tree isNil