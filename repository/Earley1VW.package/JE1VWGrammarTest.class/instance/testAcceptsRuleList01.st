tests - rule list
testAcceptsRuleList01
	self
		assertGrammarStartingAt: 'rule list'
		accepts: 'expression:term.expression:expression,plus symbol,term.'