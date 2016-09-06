tests - parsing
testParseRule06
	tree := parser parse: 'character:$$.'.
	self deny: tree isNil