tests
testParseRule05
	| forest |
	forest := grammar parse: 'rule=rulename,assignment,expression.'.
	
	self deny: forest isAmbiguous.
