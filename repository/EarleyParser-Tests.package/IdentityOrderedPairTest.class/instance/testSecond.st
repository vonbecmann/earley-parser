tests
testSecond
	| one |
	one := IdentityOrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'