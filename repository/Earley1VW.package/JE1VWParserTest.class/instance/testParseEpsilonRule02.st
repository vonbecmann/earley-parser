tests - parsing
testParseEpsilonRule02
	rules := parser parse: 'expression: .'.
	self assertCollection: rules equals: #(#('expression' #()))