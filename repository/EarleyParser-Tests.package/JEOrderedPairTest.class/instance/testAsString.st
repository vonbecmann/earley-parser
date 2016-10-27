tests
testAsString
	| one |
	one := JEOrderedPair first: 'A' second: 1.

	self assert: one asString equals: '(''A'', 1)'