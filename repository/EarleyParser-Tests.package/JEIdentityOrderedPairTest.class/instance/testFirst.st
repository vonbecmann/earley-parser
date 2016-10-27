tests
testFirst
	| one |
	one := JEIdentityOrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil