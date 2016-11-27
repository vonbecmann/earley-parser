tests - parsing
testParseRule05
	rules := parser parse: 'rule: rulename, assignment, expression.'.
	self assertCollection: rules equals: #(#('rule' #('rulename' 'assignment' 'expression')))