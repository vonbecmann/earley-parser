tests - parsing
testParseRule01
	rules := parser parse: 'expression:term.'.
	self assertCollection: rules equals: #(#('expression' #('term')))