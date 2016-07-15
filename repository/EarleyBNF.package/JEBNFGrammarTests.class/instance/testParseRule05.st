tests - parsing
testParseRule05
	tree := grammar parseTree: 'rule=rulename,assignment,expression.'.
	self deny: tree isNil