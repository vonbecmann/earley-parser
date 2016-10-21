tests
testAsString
	| one |
	one := OrderedPair first: 'A' second: 1.

	self assert: one asString equals: '(''A'', 1)'