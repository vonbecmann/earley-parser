parsing
parse: oneLevelVWRuleString
	" parse 1VW rules from a String and return an Array of production rules "

	| tree |
	tree := grammar parseTree: oneLevelVWRuleString.
	^ evaluator evaluateTree: tree