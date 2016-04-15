tests
testEmptyRuleWithDotAtEndAsString
	self assert: emptyRule dotAtEnd asString equals: 'T ::= epsilon*'