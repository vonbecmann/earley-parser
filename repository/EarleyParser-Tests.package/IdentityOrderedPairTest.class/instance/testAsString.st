tests
testAsString
	| one |
	one := IdentityOrderedPair first: 'A' second: 1.

	self assert: one asString equals: '<''A'', 1>'