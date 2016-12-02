tests
testInstanceCreation
	grammar := JEGrammar
		e1vw:
'expression: term.
expression: expression, plus symbol, term.
term: product.
term: term, star symbol, product.
product: a symbol.'
		representations:
			{('plus symbol' -> (JETerminal character: $+)).
			('star symbol' -> (JETerminal character: $*)).
			('a symbol' -> (JETerminal character: $a))}.
			
	self assert: grammar rulesSize equals: 9.
	self assert: grammar nonterminalsSize equals: 7.