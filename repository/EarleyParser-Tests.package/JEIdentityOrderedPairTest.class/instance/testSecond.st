tests
testSecond
	| one |
	one := JEIdentityOrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'