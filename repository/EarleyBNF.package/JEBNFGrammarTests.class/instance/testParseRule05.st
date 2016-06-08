tests
testParseRule05
	| forest |
	forest := grammar parseForest: 'rule=rulename,assignment,expression.'.
	
	self deny: forest isAmbiguous.
