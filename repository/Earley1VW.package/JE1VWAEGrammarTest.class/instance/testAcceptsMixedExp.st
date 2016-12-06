tests
testAcceptsMixedExp
	grammar := JEGrammar
		e1vw:
'expression:
	term;
	expression, plus symbol, term.
term:
	product;
	term, star symbol, product.
product: a symbol.'
		representations:
			{('plus symbol' -> (JETerminal character: $+)).
			('star symbol' -> (JETerminal character: $*)).
			('a symbol' -> (JETerminal character: $a))}.
	self assert: (grammar accepts: 'a+a*a+a*a')