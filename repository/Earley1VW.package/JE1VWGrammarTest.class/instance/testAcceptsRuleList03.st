tests - rule list
testAcceptsRuleList03
	self
		assertGrammarStartingAt: 'rule list'
		accepts:
'expression:term.
expression:expression,plus symbol,term.
term:product.
term:term,star symbol,product.
product:letter a symbol.'