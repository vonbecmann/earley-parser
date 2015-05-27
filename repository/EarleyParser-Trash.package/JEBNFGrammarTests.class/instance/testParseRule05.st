tests
testParseRule05
	| forest |
	forest := grammar parse: 'rule::=rulename,assignment,expression'.
	
	self deny: forest isEmpty.
	self assert: forest size equals: 264