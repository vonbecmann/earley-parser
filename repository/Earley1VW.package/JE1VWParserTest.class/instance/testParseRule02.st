tests - parsing
testParseRule02
	rules := parser parse: 'expression: expression, plus  symbol, term.'.
	self assertCollection: rules equals: #(#('expression' #('expression' 'plus symbol' 'term')))