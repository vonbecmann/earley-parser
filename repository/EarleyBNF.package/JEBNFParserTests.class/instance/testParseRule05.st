tests - parsing
testParseRule05
	tree := parser parse: 'rule:rulename,assignment,expression.'.
	self deny: tree isNil