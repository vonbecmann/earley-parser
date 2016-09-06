tests - parsing
testParseRule02
	tree := parser parse: 'E:E,$+,T.'.
	self deny: tree isNil