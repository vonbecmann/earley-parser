tests - parsing
testParseRule03
	rules := parser parse: 'expression: expression, less  than  symbol, term.'.
	self assertCollection: rules equals: #(#('expression' #('expression' 'less than symbol' 'term')))