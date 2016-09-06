tests - parsing
testParseRule03
	tree := parser parse: 'E:E,$<,T.'.
	self deny: tree isNil