tests - parsing
testParseRule08
	rules := parser parse: 
'expression: 
	expression, plus symbol, term;
	    .
term:
	product;.'.
	self 
		assertCollection: rules 
		equals: #(	#('expression' #('expression' 'plus symbol' 'term'))
						#('expression' #())
						#('term' #('product'))
						#('term' #()))