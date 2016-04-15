tests
testEmptyRuleWithDotAtBeginningAsString
	self assert: emptyRule dotAtBeginning asString equals: 'T ::= epsilon*'