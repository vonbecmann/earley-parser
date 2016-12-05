tests - parsing
testParseRule09
	rules := parser parse: 
'expression: 
	term;
	expression, plus symbol, term.
term: 
	product;
	term, star symbol, product.
product: a symbol.'.
	self 
		assertCollection: rules 
		equals: #(	#('expression' #('term'))
						#('expression' #('expression' 'plus symbol' 'term'))
						#('term' #('product'))
						#('term' #('term' 'star symbol' 'product'))						
						#('product' #('a symbol')))