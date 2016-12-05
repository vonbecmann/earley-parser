tests - rule list
testAcceptsRuleList04
	self
		assertGrammarStartingAt: 'rule list'
		accepts:
'expression:
	term;
	expression, plus symbol, term.
term:
	product;
	term, star symbol, product.
product: letter a symbol.'