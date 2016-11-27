tests - parsing
testParseRule04
	rules := parser parse: 'expression:expression,greater than symbol,term.'.
	self assertCollection: rules equals: #(#('expression' #('expression' 'greater than symbol' 'term')))