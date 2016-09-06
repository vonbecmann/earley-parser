tests - parsing
testParseRule04
	tree := parser parse: 'E:E,$>,T.'.
	self deny: tree isNil