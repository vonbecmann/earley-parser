tests
testAsString
	| one |
	one := JEIdentityOrderedPair first: 'A' second: 1.

	self assert: one asString equals: '<''A'', 1>'