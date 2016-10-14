tests - rule
testParseRule02
	tree := self
		grammarStartingAt: 'rule'
		parseTree: 'expression:expression,plus symbol,term.'.
	self deny: tree isNil