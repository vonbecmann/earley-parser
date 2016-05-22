tests
testAsString
	| one |
	one := JEPair first: 'A' second: 1.

	self assert: one asString equals: '(''A'' . 1)'