tests - parsing
testParseEpsilonRule01
	rules := parser parse: 'expression:.'.
	self assertCollection: rules equals: #(#('expression' #()))