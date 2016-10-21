tests
testFirst
	| one |
	one := IdentityOrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil