tests - rule
testAcceptsRule08
	self
		assertGrammarStartingAt: 'rule'
		accepts: 
'expression: 
	expression, plus symbol, term;
	.'